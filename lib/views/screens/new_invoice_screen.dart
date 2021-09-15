import 'package:flutter/material.dart';
import 'package:ibilling_app/widgets/custom_textfield.dart';
import 'package:ibilling_app/widgets/form_textfireld.dart';

class NewInvoiceScreen extends StatelessWidget {
  static final newInvoicePage = '/invoice-page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Image.asset('assets/images/logo.png', height: 24,width: 24),
        titleSpacing: 0,
        title: Text('New Invoice', style: TextStyle(fontSize: 18, fontFamily: 'Ubuntu Regular'),),
      ),
      body: Container(
        padding: EdgeInsets.only(
          top: 20,
          left: 16,
          right: 16
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Fisher's full name", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey)),
            SizedBox(height: 8),
            FormTextField(isIcon: false),
            SizedBox(height: 20),
            Text("Fisher's full name", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey)),
            SizedBox(height: 8),
            FormTextField(isIcon: false),
            SizedBox(height: 20),
            Text("Status of the contract", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey)),
            SizedBox(height: 8),
            Expanded(
              child: DropDown(
                list: ['Paid', 'In process', 'Rejected by Payme', 'Rejected by IQ'],
                selectedValue: '',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
