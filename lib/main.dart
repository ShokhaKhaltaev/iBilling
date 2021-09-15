import 'package:flutter/material.dart';
import 'package:ibilling_app/provider/contract_provider.dart';
import 'package:ibilling_app/views/screens/add_contract_screen.dart';
import 'package:ibilling_app/views/screens/contracts_screen.dart';
import 'package:ibilling_app/views/screens/filters_screen.dart';
import 'package:ibilling_app/views/screens/history_screen.dart';
import 'package:ibilling_app/views/screens/home_page.dart';
import 'package:ibilling_app/views/screens/individual_contract_screen.dart';
import 'package:ibilling_app/views/screens/new_invoice_screen.dart';
import 'package:ibilling_app/views/screens/new_screen.dart';
import 'package:ibilling_app/views/screens/profile_screen.dart';
import 'package:ibilling_app/views/screens/saved_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ContractList>(
      create: (context) => ContractList(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: Color(0xff000000),
          primarySwatch: Colors.blue,
          textTheme: TextTheme(
            bodyText2: TextStyle(
              color: Colors.white
            )
          ),
        ),
        initialRoute: HomePage.homePageRoute,
        routes: {
          '/': (context) => HomePage(),
          Contracts.contractRoute: (context) => Contracts(),
          HistoryScreen.historyRoute: (context) => HistoryScreen(),
          NewScreen.newRoute: (context) => NewScreen(),
          ProfileScreen.profileRoute: (context) => ProfileScreen(),
          SavedScreen.savedRoute: (context) => SavedScreen(),
          FiltersScreen.filtersPageRoute: (context) => FiltersScreen(),
          AddContractScreen.addContractPage: (context) => AddContractScreen(),
          NewInvoiceScreen.newInvoicePage: (context) => NewInvoiceScreen(),
          IndividualContractScreen.individualContractPage: (context) => IndividualContractScreen()
        }
      ),
    );
  }
}
