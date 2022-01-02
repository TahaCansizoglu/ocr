import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
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
            backgroundColor: Color(0xF0E9EAEC),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 210,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
                    color: Color(0xE04453E2),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Observer(builder: (_) {
                              return Text(
                                value.txt,
                                style: alata(),
                              );
                            }),
                            Icon(
                              Icons.search,
                              color: Colors.white,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 30,
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
                                Text(
                                  "\$9,840.00",
                                  style: alata(30),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () => value.addBill(),
                              child: Container(
                                padding: EdgeInsets.all(6),
                                decoration: BoxDecoration(shape: BoxShape.circle, color: Color(0xFF6F76E8)),
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 38,
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(color: Colors.white, width: 380, height: 1),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text("Expenses  ", style: alata(16, Colors.purple)),
                      Text("Earnings", style: alata(16, Colors.black)),
                      SizedBox(
                        width: 160,
                      ),
                      Row(
                        children: [Text("Sort by", style: alata(16, Colors.black)), Icon(Icons.arrow_drop_down)],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Observer(builder: (_) {
                    return ListView.builder(
                      itemCount: value.list.length,
                      itemBuilder: (context, index) {
                        BillModel data = value.list[index];
                        return Observer(builder: (_) {
                          return Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Observer(builder: (_) {
                              return ListTile(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                                tileColor: Colors.white,
                                leading: CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  child: FlutterLogo(),
                                ),
                                trailing: Container(
                                  child: Text(
                                    data.amount.toString(),
                                    style: alata(14, Colors.red),
                                  ),
                                  margin: const EdgeInsets.all(10.0),
                                  padding: const EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.red), color: Colors.red.shade100),
                                ),
                                title: Text(data.corporation.toString()),
                                subtitle: Text(data.category.toString()),
                              );
                            }),
                          );
                        });
                      },
                    );
                  }),
                )
              ],
            )));
  }

  TextStyle alata([double size = 24, Color color = Colors.white]) {
    return GoogleFonts.alata(color: color, fontSize: size);
  }
}
