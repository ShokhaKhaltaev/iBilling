import 'package:ibilling_app/models/contract_details.dart';

class IndividualCardModel extends ContractDetails{
  final String address;
  final String ITN;

  IndividualCardModel({String fishName,double amount, int lastInvoice, int numOfInvoices, String status,DateTime date, this.address, this.ITN}):
      super(fishName: fishName, amount: amount, lastInvoice: lastInvoice, numOfInvoices: numOfInvoices, status: status, date: date);
}