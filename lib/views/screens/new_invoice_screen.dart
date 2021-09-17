import 'package:flutter/material.dart';
import 'package:ibilling_app/constants.dart';
import 'package:ibilling_app/widgets/custom_button.dart';
import 'package:ibilling_app/widgets/custom_textfield.dart';
import 'package:ibilling_app/widgets/form_textfireld.dart';

import 'home_page.dart';

class NewInvoiceScreen extends StatefulWidget {
  static final newInvoicePage = '/invoice-page';

  @override
  _NewInvoiceScreenState createState() => _NewInvoiceScreenState();
}

class _NewInvoiceScreenState extends State<NewInvoiceScreen> {
  GlobalKey<FormState> _formKey;

  @override
  void initState() {
    _formKey = GlobalKey();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appBarBottomNav,
        leading: Image.asset('assets/images/logo.png', height: 24,width: 24),
        titleSpacing: 0,
        title: Text('New Invoice', style: AppTextStyles.appBarTitle),
      ),
      body: Container(
        padding: EdgeInsets.only(
          top: 20,
          left: 16,
          right: 16
        ),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Service type", style: AppTextStyles.contractDetails),
              SizedBox(height: 8),
              FormTextField(isIcon: false),
              SizedBox(height: 20),
              Text("Amount of Invoice", style: AppTextStyles.contractDetails),
              SizedBox(height: 8),
              FormTextField(isIcon: false),
              SizedBox(height: 20),
              Text("Status of the contract", style: AppTextStyles.contractDetails),
              SizedBox(height: 8),
              Expanded(
                child: DropDown(
                  list: ['Paid', 'In process', 'Rejected by Payme', 'Rejected by IQ'],
                  selectedValue: '',
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: SizedBox(
                    width: double.infinity,
                    child: CustomButton(
                      buttonText: 'Save Contract',
                      color: AppColors.lightBlue,
                      buttonColor: Colors.white,
                      onPressed: (){
                        if(_formKey.currentState.validate()){
                          Navigator.pushNamed(context, HomePage.homePageRoute);
                        }
                      },
                    ),
                  ),
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}
