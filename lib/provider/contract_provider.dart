import 'package:flutter/foundation.dart';
import 'package:ibilling_app/models/contract_details.dart';

class ContractList with ChangeNotifier{
  List<ContractDetails> _contracts = [
    ContractDetails(fishName: 'Yoldosheva Ziyoda', amount: 1200000, lastInvoice: 156, numOfInvoices: 6, status: 'Paid', date: DateTime.now(), address: 'Проспект Мирзо-Улугбек, дом 58, Мирзо-Улугбекский район, Ташкент', ITN: '5647520318'),
    ContractDetails(fishName: 'Seulki Lee', amount: 1250000, lastInvoice: 155, numOfInvoices: 6, status: 'In process', date: DateTime.now(), address: 'Проспект Мирзо-Улугбек, дом 58, Мирзо-Улугбекский район, Ташкент', ITN: '5647520318'),
    ContractDetails(fishName: 'Ashrapova Nigina', amount: 1320000, lastInvoice: 151, numOfInvoices: 4, status: 'Rejected by Payme', date: DateTime.now(), address: 'Проспект Мирзо-Улугбек, дом 58, Мирзо-Улугбекский район, Ташкент', ITN: '5647520318'),
    ContractDetails(fishName: 'Ashrapova Nigina', amount: 1320000, lastInvoice: 151, numOfInvoices: 4, status: 'In process', date: DateTime.now(), address: 'Проспект Мирзо-Улугбек, дом 58, Мирзо-Улугбекский район, Ташкент', ITN: '5647520318'),
    ContractDetails(fishName: 'Ashrapova Nigina', amount: 1320000, lastInvoice: 151, numOfInvoices: 4, status: 'Rejected by Payme', date: DateTime.now(), address: 'Проспект Мирзо-Улугбек, дом 58, Мирзо-Улугбекский район, Ташкент', ITN: '5647520318'),
    ContractDetails(fishName: 'Ashrapova Nigina', amount: 1320000, lastInvoice: 151, numOfInvoices: 4, status: 'Paid', date: DateTime.now(), address: 'Проспект Мирзо-Улугбек, дом 58, Мирзо-Улугбекский район, Ташкент', ITN: '5647520318')
  ];

  void addContract(ContractDetails newContract){
    _contracts.add(newContract);
    notifyListeners();
  }

  void deleteContract(ContractDetails contractDetails, int index){
    _contracts.removeAt(index);
    notifyListeners();
  }

  String language = 'English (USA)';
  String imagePath = 'assets/images/english.png';

  void changeLanguage(String lang){
    language = lang;
    notifyListeners();
  }

  void changeImagePath(String path){
    imagePath = path;
    notifyListeners();
  }

  List<ContractDetails> get contracts => _contracts;

}