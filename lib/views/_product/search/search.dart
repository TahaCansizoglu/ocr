import 'package:flutter/material.dart';
import 'package:ocrdeneme/core/models/bill_model/bill_model.dart';
import 'package:ocrdeneme/views/_product/widgets/listcard/list_card.dart';

class Search extends SearchDelegate {
  List<BillModel> bills;
  Search({required this.bills});
  @override
  List<Widget>? buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back));
  }

  var selectedResult = "";

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      child: Center(
        child: Text(selectedResult),
      ),
    );
  }

  List<BillModel> recentList = [];

  @override
  Widget buildSuggestions(BuildContext context) {
    List<BillModel> suggestions = [];
    query.isEmpty
        ? suggestions = bills
        : suggestions.addAll(
            bills.where((element) => element.corporation.contains(query)));
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) => ListCard(bill: suggestions[index]),
    );
  }
}
