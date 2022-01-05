import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ocrdeneme/views/add_bill/view/add_bill_view.dart';
import 'package:ocrdeneme/views/more/view/more_view.dart';
import 'package:ocrdeneme/views/profile/view/profile_view.dart';
import 'package:provider/provider.dart';
import 'package:rect_getter/rect_getter.dart';

import '../../../core/base/view/base_view.dart';
import '../../_product/widgets/bottomnavigationbar/custom_bottom_navigation_bar.dart';
import '../../details/view/details_view.dart';
import '../../home/view/home_view.dart';
import '../../home/viewmodel/home_viewmodel.dart';
import '../viewmodel/bottomnavigation_viewmodel.dart';

class BottomnavigationView extends StatefulWidget {
  const BottomnavigationView({Key? key}) : super(key: key);

  @override
  State<BottomnavigationView> createState() => _BottomnavigationViewState();
}

class _BottomnavigationViewState extends State<BottomnavigationView> {
  var rectGetterKey = RectGetter.createGlobalKey(); //<--Create a key
  Rect? rect;
  late GlobalKey<ScaffoldState> fabButtonKey;
  RipplePageTransition? _ripplePageTransition;
  void _onTap() {
    setState(() => rect =
        RectGetter.getRectFromKey(rectGetterKey)); //<--onTap, update rect
    Navigator.of(context).push(FadeRouteBuilder(page: AddBillView()));
  }

  @override
  void initState() {
    fabButtonKey = GlobalKey();

    print(fabButtonKey);
    _ripplePageTransition = RipplePageTransition(fabButtonKey);
    super.initState();
  }

  //<--Create a key
  @override
  Widget build(BuildContext context) {
    return BaseView<BottomNavigationViewModel>(
      viewModel: Provider.of<BottomNavigationViewModel>(context, listen: false),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (context, value) => Stack(
        children: [
          Scaffold(
              body: Observer(builder: (_) {
                return destinator(value.selectedDestination.index);
              }),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              floatingActionButton: FloatingActionButton(
                key: fabButtonKey,
                backgroundColor: Colors.purple,
                onPressed: () {
                  _ripplePageTransition!.navigateTo(AddBillView());
                },
                tooltip: 'Create',
                child: const Icon(Icons.add),
              ),
              bottomNavigationBar: FABBottomAppBar(
                  items: [
                    FABBottomAppBarItem(iconData: Icons.home, text: 'Home'),
                    FABBottomAppBarItem(
                        iconData: Icons.description_outlined, text: 'Details'),
                    FABBottomAppBarItem(
                        iconData: Icons.account_circle, text: 'Profile'),
                    FABBottomAppBarItem(
                        iconData: Icons.more_horiz, text: 'More'),
                  ],
                  centerItemText: "Add Bill",
                  backgroundColor: Colors.white,
                  color: Colors.grey,
                  selectedColor: Colors.purple,
                  notchedShape: CircularNotchedRectangle(),
                  onTabSelected: value.selectDestination)),
          _ripplePageTransition!
        ],
      ),
    );
  }

  Widget destinator(int index) {
    switch (index) {
      case 0:
        return HomeView();
      case 1:
        return DetailsView();
      case 2:
        return ProfileView();
      case 3:
        return MoreView();

      default:
        return HomeView();
    }
  }

  Widget ripple(Rect rect, BuildContext context) {
    return Positioned(
      left: rect.left, //<-- Margin from left
      right: MediaQuery.of(context).size.width -
          rect.right, //<-- Margin from right
      top: rect.top, //<-- Margin from top
      bottom: MediaQuery.of(context).size.height -
          rect.bottom, //<-- Margin from bottom
      child: Container(
        //<-- Blue cirle
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.blue,
        ),
      ),
    );
  }
}

class RipplePageTransition extends StatefulWidget {
  RipplePageTransition(
    this._originalWidgetKey, {
    Color? color,
  }) : color = color ?? Colors.purple;

  final GlobalKey _originalWidgetKey;
  final Color color;
  final _state = _RipplePageTransitionState();

  void navigateTo(Widget page) => _state.startSpreadOutAnimation(page);

  @override
  _RipplePageTransitionState createState() => _state;
}

class _RipplePageTransitionState extends State<RipplePageTransition> {
  late Widget _page;
  late Rect _originalWidgetRect;
  Rect? _ripplePageTransitionRect;

  // Starts ripple effect from the original widget size to the whole screen.
  void startSpreadOutAnimation(Widget page) {
    if (!mounted) {
      return;
    }

    setState(() {
      _page = page;
      _originalWidgetRect = _getWidgetRect(widget._originalWidgetKey)!;
      _ripplePageTransitionRect = _originalWidgetRect;
    });

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }

      final fullscreenSize = 1.3 * MediaQuery.of(context).size.longestSide;
      // Expands the `_ripplePageTransitionRect` to cover the whole screen.
      setState(() {
        _ripplePageTransitionRect =
            _ripplePageTransitionRect!.inflate(fullscreenSize);
      });
    });
  }

  // Starts ripple effect from the whole screen to the original widget size.
  void _startShrinkInAnimation() =>
      setState(() => _ripplePageTransitionRect = _originalWidgetRect);

  Rect? _getWidgetRect(GlobalKey globalKey) {
    var renderObject = globalKey.currentContext?.findRenderObject();
    var translation = renderObject?.getTransformTo(null).getTranslation();
    var size = renderObject?.semanticBounds.size;

    if (translation != null && size != null) {
      return Rect.fromLTWH(
          translation.x, translation.y, size.width, size.height);
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_ripplePageTransitionRect == null) {
      return Container();
    }

    return AnimatedPositioned.fromRect(
      rect: _ripplePageTransitionRect!,
      duration: Duration(milliseconds: 300),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: widget.color,
        ),
      ),
      onEnd: () {
        bool shouldNavigatePage =
            _ripplePageTransitionRect != _originalWidgetRect;
        if (shouldNavigatePage) {
          Navigator.push(
            context,
            FadeRouteBuilder(page: _page),
          ).then((_) {
            _startShrinkInAnimation();
          });
        } else {
          if (!mounted) {
            return;
          }

          // Dismiss ripple widget after shrinking finishes.
          setState(() => _ripplePageTransitionRect = null);
        }
      },
    );
  }
}

class FadeRouteBuilder<T> extends PageRouteBuilder<T> {
  FadeRouteBuilder({required Widget page})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionDuration: Duration(milliseconds: 001),
          transitionsBuilder: (
            context,
            animation,
            secondaryAnimation,
            child,
          ) =>
              FadeTransition(opacity: animation, child: child),
        );
}
