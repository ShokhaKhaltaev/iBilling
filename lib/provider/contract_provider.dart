import 'package:flutter/foundation.dart';
import 'package:ibilling_app/models/contract_details.dart';

class ContractList with ChangeNotifier{
  List<ContractDetails> _contracts = [
    ContractDetails(fishName: 'Yoldosheva Ziyoda', amount: 1200000, lastInvoice: 156, numOfInvoices: 6, status: 'Paid', date: DateTime.now()),
    ContractDetails(fishName: 'Seulki Lee', amount: 1250000, lastInvoice: 155, numOfInvoices: 6, status: 'In process', date: DateTime.now()),
    ContractDetails(fishName: 'Ashrapova Nigina', amount: 1320000, lastInvoice: 151, numOfInvoices: 4, status: 'Rejected by Payme', date: DateTime.now()),
    ContractDetails(fishName: 'Ashrapova Nigina', amount: 1320000, lastInvoice: 151, numOfInvoices: 4, status: 'In process', date: DateTime.now()),
    ContractDetails(fishName: 'Ashrapova Nigina', amount: 1320000, lastInvoice: 151, numOfInvoices: 4, status: 'Rejected by Payme', date: DateTime.now()),
    ContractDetails(fishName: 'Ashrapova Nigina', amount: 1320000, lastInvoice: 151, numOfInvoices: 4, status: 'Paid', date: DateTime.now())
  ];

  void addContract(ContractDetails newContract){
    _contracts.add(newContract);
    notifyListeners();
  }

  void deleteContract(ContractDetails contractDetails, int index){
    _contracts.removeAt(index);
    notifyListeners();
  }

  List<ContractDetails> get contracts => _contracts;

}