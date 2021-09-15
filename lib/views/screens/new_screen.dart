import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ibilling_app/views/screens/add_contract_screen.dart';
import 'package:ibilling_app/views/screens/new_invoice_screen.dart';
import 'package:ibilling_app/widgets/invoice_button.dart';

class NewScreen extends StatelessWidget {
  static final newRoute = '/new-screen';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      child: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          height: MediaQuery.of(context).size.height * 0.24,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xff2A2A2D),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                child: Text('Что вы хотите создать?', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16, fontFamily: 'Ubuntu Medium'),),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.128,
                width: double.infinity,
                child: Column(
                  children: [
                    Expanded(
                      child: InvoiceButton(
                        buttonText: 'Contract',
                        iconPath: 'Paper.svg',
                        callback: (){
                          Navigator.pushNamed(context, AddContractScreen.addContractPage);
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                        child: InvoiceButton(
                          buttonText: 'Invoice',
                          iconPath: 'invoice.svg',
                          callback: (){
                            Navigator.pushNamed(context, NewInvoiceScreen.newInvoicePage);
                          },
                        ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
