import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ibilling_app/widgets/custom_button.dart';
import 'package:ibilling_app/widgets/custom_textfield.dart';
import 'package:ibilling_app/widgets/form_textfireld.dart';

class AddContractScreen extends StatefulWidget {
  static final addContractPage = '/add-contract';
  @override
  _AddContractScreenState createState() => _AddContractScreenState();
}

class _AddContractScreenState extends State<AddContractScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Image.asset('assets/images/logo.png', height: 24,width: 24),
        titleSpacing: 0,
        title: Text('New Contract', style: TextStyle(fontSize: 18, fontFamily: 'Ubuntu Regular'),),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.65,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Лицо', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey)),
              SizedBox(height: 5),
              Expanded(
                child: DropDown(
                  list: ['Физическое', 'Юридическое'],
                  selectedValue: '',
                ),
              ),
              //SizedBox(height: 16),
              Text("Fisher's full name", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey)),
              SizedBox(height: 5),
              Expanded(child: FormTextField(isIcon: false)),
              Text("Address of the organization", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey)),
              SizedBox(height: 5),
              Expanded(child: FormTextField(isIcon: false)),
              Text("Tax­pay­er Identification Num­ber", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey)),
              SizedBox(height: 5),
              Expanded(child: FormTextField(isIcon: true)),
              Text("Status of the contract", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey)),
              SizedBox(height: 5),
              Expanded(
                child: DropDown(
                  list: ['Paid', 'In process', 'Rejected by Payme', 'Rejected by IQ'],
                  selectedValue: '',
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: CustomButton(
                  buttonText: 'Save Contract',
                  onPressed: (){},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
