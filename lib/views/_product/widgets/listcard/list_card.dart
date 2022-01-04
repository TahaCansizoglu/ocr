import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ocrdeneme/core/models/bill_model/bill_model.dart';

class ListCard extends StatelessWidget {
  final BillModel bill;

  const ListCard({Key? key, required this.bill}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              "\$" + bill.amount.toString(),
              style: alata(14, bill.amount > 0 ? Colors.green : Colors.red),
            ),
            margin: const EdgeInsets.all(10.0),
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                    color: bill.amount > 0 ? Colors.green : Colors.red),
                color: bill.amount > 0
                    ? Colors.green.shade100
                    : Colors.red.shade100),
          ),
          title: Text(bill.corporation.toString()),
          subtitle: Text(bill.category.toString()),
        ));
  }

  TextStyle alata([double size = 24, Color color = Colors.white]) {
    return GoogleFonts.alata(color: color, fontSize: size);
  }
}
