import 'package:flutter/material.dart';
import 'package:ibilling_app/constants.dart';
import 'package:ibilling_app/models/contract_details.dart';
import 'package:ibilling_app/provider/contract_provider.dart';
import 'package:provider/provider.dart';

class Search extends SearchDelegate {
  String query = ContractDetails().fishName;
  String selectedResult;

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      appBarTheme: AppBarTheme(
        backgroundColor: Color(0xff000000),
      ),
      scaffoldBackgroundColor: Color(0xff000000),
      textTheme: TextTheme(
        bodyText1: TextStyle(color: Colors.white),
        bodyText2: TextStyle(color: Colors.white)
      )
    );
  }
  List<Widget> buildActions(BuildContext context) {

    IconButton(
      icon: Icon(Icons.close),
      onPressed: () {
        query = '';
      },
    );
  }

  @override
  Widget buildLeading(BuildContext context) {
    IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: (){
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Center(
        child: Text(
          selectedResult
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<ContractDetails> suggestionContracts = [];
    List<ContractDetails> searchContractList = Provider.of<ContractList>(context).contracts;

    query.isEmpty ?
    suggestionContracts = searchContractList :
        suggestionContracts.addAll(searchContractList.where((element) => element.fishName.contains(query)));
    return ListView.builder(
        itemCount: suggestionContracts.length,
        itemBuilder: (context, index){
          return ListTile(
            title: Text(
                suggestionContracts[index].fishName
            ),
          );
        }
    );
  }
}
