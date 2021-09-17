import 'package:flutter/foundation.dart';
import 'package:ibilling_app/models/contract_details.dart';
import 'package:ibilling_app/models/invoice_details.dart';

class InvoiceList with ChangeNotifier{
  List<InvoiceDetails> _invoices = [
  ];

  void addInvoice(InvoiceDetails newInvoice){
    _invoices.add(newInvoice);
    notifyListeners();
  }

  void deleteInvoice(ContractDetails contractDetails, int index){
    _invoices.removeAt(index);
    notifyListeners();
  }

  List<InvoiceDetails> get invoices => _invoices;

}