import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ibilling_app/constants.dart';
import 'package:ibilling_app/views/screens/home_page.dart';
import 'package:ibilling_app/widgets/custom_button.dart';
import 'package:ibilling_app/widgets/custom_textfield.dart';
import 'package:ibilling_app/widgets/form_textfireld.dart';

class AddContractScreen extends StatefulWidget {
  static final addContractPage = '/add-contract';
  @override
  _AddContractScreenState createState() => _AddContractScreenState();

}

class _AddContractScreenState extends State<AddContractScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController itn = TextEditingController();
  GlobalKey<FormState> _formKey;

  String status = 'Paid';
  String dropdownValue = 'Физическое';
  List<String> newList = ['Физическое', 'Юридическое'];
  List<String> statuses = ['Paid', 'In process', 'Rejected by Payme', 'Rejected by IQ'];

  @override
  void initState() {
    _formKey = GlobalKey();
    super.initState();
  }

  @override
  void dispose() {
    name.dispose();
    address.dispose();
    itn.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AppColors.appBarBottomNav,
        leading: Image.asset('assets/images/logo.png', height: 24,width: 24),
        titleSpacing: 0,
        title: Text('New Contract', style: AppTextStyles.appBarTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.55,
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Лицо', style: AppTextStyles.contractDetails),
                      SizedBox(height: 5),
                      Expanded(
                        child: SizedBox(
                          height: 40,
                          width: double.infinity,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(0xff2A2A2D), style: BorderStyle.solid, width: 2),
                              borderRadius: BorderRadius.circular(6)
                            ),
                            child: DropdownButtonHideUnderline(
                              child: Theme(
                                data: Theme.of(context).copyWith(
                                  canvasColor: AppColors.cardGrey,
                                  textTheme: TextTheme(
                                    bodyText2: TextStyle(color: Colors.white),
                                    bodyText1:  TextStyle(color: Colors.white)
                                  )
                                ),
                                child: DropdownButton(
                                  onChanged: (value){
                                    setState(() {
                                      dropdownValue = value;
                                    });
                                  },
                                  items: newList
                                      .map((String item) =>
                                      DropdownMenuItem<String>(
                                          child: Text(item),
                                          value: item
                                      ),
                                  ).toList(),
                                  value: dropdownValue,
                                ),
                              ),
                            ),
                          ),
                        )
                      ),
                      SizedBox(height: 16),
                      Text("Fisher's full name", style: AppTextStyles.contractDetails),
                      SizedBox(height: 5),
                      Expanded(child:
                        FormTextField(isIcon: false, controller: name)
                      ),
                      Text("Address of the organization", style: AppTextStyles.contractDetails),
                      SizedBox(height: 5),
                      Expanded(child: FormTextField(isIcon: false, controller: address,)),
                      Text("Tax­pay­er Identification Num­ber", style: AppTextStyles.contractDetails),
                      SizedBox(height: 5),
                      Expanded(child: FormTextField(isIcon: true, controller: itn)),
                      Text("Status of the contract", style: AppTextStyles.contractDetails),
                      SizedBox(height: 5),
                      Expanded(
                          child: SizedBox(
                            height: 40,
                            width: double.infinity,
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xff2A2A2D), style: BorderStyle.solid, width: 2),
                                  borderRadius: BorderRadius.circular(6)
                              ),
                              child: DropdownButtonHideUnderline(
                                child: Theme(
                                  data: Theme.of(context).copyWith(
                                      canvasColor: AppColors.cardGrey,
                                      textTheme: TextTheme(
                                          bodyText2: TextStyle(color: Colors.white),
                                          bodyText1:  TextStyle(color: Colors.white)
                                      )
                                  ),
                                  child: DropdownButton(
                                    onChanged: (value){
                                      setState(() {
                                        status = value;
                                      });
                                    },
                                    items: statuses
                                        .map((String item) =>
                                        DropdownMenuItem<String>(
                                            child: Text(item),
                                            value: item
                                        ),
                                    ).toList(),
                                    value: status,
                                  ),
                                ),
                              ),
                            ),
                          )
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: double.infinity,
                  child: CustomButton(
                    buttonText: 'Save Contract',
                    color: AppColors.lightBlue,
                    buttonColor: Colors.white,
                    onPressed: (){
                      if(_formKey.currentState.validate()){
                        _formKey.currentState.save();
                        Navigator.pushNamed(context, HomePage.homePageRoute);
                      }
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

