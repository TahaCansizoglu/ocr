import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
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
      child: Observer(builder: (_) {
        return Row(
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
              width: context.dynamicWidth(0.29),
            ),
            Row(
              children: [
                Text("Sort by", style: alata(16, Colors.black)),
                const Icon(Icons.arrow_drop_down)
              ],
            ),
          ],
        );
      }),
    );
  }

  Container buildHeader(BuildContext context, DetailsViewModel value) {
    return Container(
      height: context.dynamicHeight(0.25),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.purple.shade700,
              Colors.purple.shade600,
              Colors.purple.shade500,
              Colors.purple.shade400,
              Colors.purple.shade300,
              Colors.purple.shade200,
              Colors.purple.shade100,
            ],
            tileMode: TileMode.mirror),
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
        color: Color(0xE04453E2),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 4,
            blurRadius: 4,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: context.dynamicHeight(0.04),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  value.txt,
                  style: alata(),
                ),
                const Icon(
                  Icons.search,
                  color: Colors.white,
                )
              ],
            ),
            SizedBox(
              height: context.dynamicHeight(0.033),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              height: context.dynamicHeight(0.04),
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
      child: Observer(builder: (_) {
        List<BillModel> data = value.isButtonTextExpenses
            ? value.expensesList
            : value.earningsList;
        return ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            print(value.txt);

            return buildListCard(data[index]);
          },
        );
      }),
    ));
  }

  Container buildListCard(BillModel data) {
    return Container(
        margin: EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 2,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: ListTile(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          tileColor: Colors.white,
          leading: const CircleAvatar(
            backgroundColor: Colors.transparent,
            child: FlutterLogo(),
          ),
          trailing: Container(
            child: Text(
              "\$" + data.amount.toString(),
              style: alata(14, data.amount > 0 ? Colors.green : Colors.red),
            ),
            margin: const EdgeInsets.all(10.0),
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                    color: data.amount > 0 ? Colors.green : Colors.red),
                color: data.amount > 0
                    ? Colors.green.shade100
                    : Colors.red.shade100),
          ),
          title: Text(data.corporation.toString()),
          subtitle: Text(data.category.toString()),
        ));
  }

  TextStyle alata([double size = 24, Color color = Colors.white]) {
    return GoogleFonts.alata(color: color, fontSize: size);
  }
}
