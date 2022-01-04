import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:ocrdeneme/views/_product/search/search.dart';
import 'package:ocrdeneme/views/_product/widgets/listcard/list_card.dart';
import 'package:ocrdeneme/views/bottomnavigation/viewmodel/bottomnavigation_viewmodel.dart';
import 'package:provider/provider.dart';

import '../../../core/base/view/base_view.dart';
import '../../../core/models/bill_model/bill_model.dart';
import '../viewmodel/details_viewmodel.dart';

class DetailsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<DetailsViewModel>(
        viewModel: Provider.of<DetailsViewModel>(context, listen: false),
        onModelReady: (model) {
          model.setContext(context);
          model.init();
        },
        onPageBuilder: (context, value) => Scaffold(
            backgroundColor: const Color(0xF0E9EAEC),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildHeader(context, value),
                buildFilterRow(context, value),
                buildListView(context, value)
              ],
            )));
  }

  Padding buildFilterRow(BuildContext context, DetailsViewModel value) {
    return Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
        child: Row(
          children: [
            Observer(builder: (_) {
              return TextButton(
                style: value.isOnClick
                    ? TextButton.styleFrom(backgroundColor: Colors.purple)
                    : TextButton.styleFrom(backgroundColor: Color(0xF0E9EAEC)),
                child: Text("Expenses  ",
                    style: alata(
                        16, value.isOnClick ? Colors.white : Colors.purple)),
                onPressed: () =>
                    Provider.of<DetailsViewModel>(context, listen: false)
                        .changeListFilter("Expenses"),
              );
            }),
            Observer(builder: (_) {
              return TextButton(
                style: !value.isOnClick
                    ? TextButton.styleFrom(backgroundColor: Colors.purple)
                    : TextButton.styleFrom(backgroundColor: Color(0xF0E9EAEC)),
                child: Text("Earnings  ",
                    style: alata(
                        16, !value.isOnClick ? Colors.white : Colors.purple)),
                onPressed: () =>
                    Provider.of<DetailsViewModel>(context, listen: false)
                        .changeListFilter("Earnings"),
              );
            }),
            SizedBox(
              width: context.dynamicWidth(0.22),
            ),
            DropdownButtonHideUnderline(
              child: DropdownButton(
                hint: Text("Sort by"),
                items: <String>['Low Price', 'High Price', 'Date']
                    .map<DropdownMenuItem<String>>((String sortType) {
                  return DropdownMenuItem<String>(
                    value: sortType,
                    child: Text(sortType),
                  );
                }).toList(),
                onChanged: (dynamic sortType) {
                  value.sortList(sortType);
                },
              ),
            )
          ],
        ));
  }

  Container buildHeader(BuildContext context, DetailsViewModel value) {
    return Container(
      height: context.dynamicHeight(0.22),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
        color: Colors.purple,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 4,
            blurRadius: 4,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: context.dynamicHeight(0.04),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "HarBi",
                  style: alata(),
                ),
                IconButton(
                  icon: Icon(Icons.search),
                  color: Colors.white,
                  onPressed: () {
                    showSearch(
                        context: context, delegate: Search(bills: value.list));
                  },
                )
              ],
            ),
            SizedBox(
              height: context.dynamicHeight(0.003),
            ),
            Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Active Total Balance",
                      style: alata(14),
                    ),
                    Observer(builder: (_) {
                      return Text(
                        value.amount.toString(),
                        style: alata(30),
                      );
                    }),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: context.dynamicHeight(0.02),
            ),
            Container(
                color: Colors.white,
                width: context.dynamicWidth(0.95),
                height: 1),
          ],
        ),
      ),
    );
  }

  Widget buildListView(BuildContext context, DetailsViewModel value) {
    return Expanded(
        child: MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: RefreshIndicator(
        onRefresh: () =>
            Provider.of<BottomNavigationViewModel>(context, listen: false)
                .fecthData(),
        child: Observer(builder: (_) {
          List<BillModel> data = value.isButtonTextExpenses
              ? value.expensesList
              : value.earningsList;
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return ListCard(bill: data[index]);
            },
          );
        }),
      ),
    ));
  }

  TextStyle alata([double size = 24, Color color = Colors.white]) {
    return GoogleFonts.alata(color: color, fontSize: size);
  }
}
