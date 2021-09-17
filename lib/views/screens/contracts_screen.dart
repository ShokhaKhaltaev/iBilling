import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ibilling_app/constants.dart';
import 'package:ibilling_app/models/contract_details.dart';
import 'package:ibilling_app/models/invoice_details.dart';
import 'package:ibilling_app/provider/contract_provider.dart';
import 'package:ibilling_app/provider/invoice_provider.dart';
import 'package:ibilling_app/views/screens/individual_contract_screen.dart';
import 'package:ibilling_app/widgets/calendar_widget.dart';
import 'package:ibilling_app/widgets/contracts_card.dart';
import 'package:provider/provider.dart';

class Contracts extends StatefulWidget {

  static final contractRoute = '/contract-screen';
  @override
  _ContractsState createState() => _ContractsState();
}

class _ContractsState extends State<Contracts> {
  String selectedType = 'Contracts';
  bool changeButton = true;

  void changeSelectedType(String type){
    selectedType = type;
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    List<ContractDetails> newContractList = Provider.of<ContractList>(context).contracts;
    List<InvoiceDetails> newInvoiceList = Provider.of<InvoiceList>(context).invoices;

    return Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10),
          child : Container(
            color: Color(0xff1E1E20),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.2,
            child: CalendarWidget(),
            )
          ),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      child: Container(
                        height: 33,
                        width: 92,
                        decoration: BoxDecoration(
                          color: (selectedType == 'Contracts') ? AppColors.lightBlue : Colors.transparent,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Center(child: Text('Contracts', style: AppTextStyles.buttonWhiteText)),
                      ),
                      onTap: (){
                        changeSelectedType('Contracts');
                        setState(() {
                          changeButton = true;
                        });
                      },
                    ),
                    SizedBox(width: 15),
                    InkWell(
                      child: Container(
                        height: 33,
                        width: 92,
                        decoration: BoxDecoration(
                          color: (selectedType == 'Invoice') ? AppColors.lightBlue : Colors.transparent,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Center(child: Text('Invoice', style: AppTextStyles.buttonWhiteText)),
                      ),
                      onTap: (){
                        changeSelectedType('Invoice');
                        setState(() {
                          changeButton = false;
                        });
                      },
                    )
                  ],
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
          changeButton ? Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: newContractList.isEmpty ?
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/icons/Document.svg', height: 74, width: 66, color: Color(0xff2A2A2D)),
                      SizedBox(height: 15),
                      Text('No contracts are made', style: TextStyle(fontFamily: 'Ubuntu Medium', fontWeight: FontWeight.w600, color: Color(0xff2A2A2D), fontSize: 14))
                    ],
                  )
                  : ListView.builder(
                  physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                  shrinkWrap: true,
                  itemCount: newContractList.length,
                  itemBuilder: (context, index){
                    ContractDetails oneContract = newContractList[index];
                    return Column(
                      children: [
                        GestureDetector(
                          child: ContractsCard(
                            contractDetails: oneContract,
                          ),
                          onTap: (){
                            Navigator.pushNamed(context, IndividualContractScreen.individualContractPage, arguments: oneContract);
                          },
                        ),
                        Padding(padding: EdgeInsets.only(bottom: 12)),
                      ],
                    );
                  }
              ),
            ),
          ) : Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: newInvoiceList.isEmpty ?
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/icons/invoice.svg', height: 74, width: 66, color: Color(0xff2A2A2D)),
                  SizedBox(height: 15),
                  Text('No invoices are made', style: TextStyle(fontFamily: 'Ubuntu Medium', fontWeight: FontWeight.w600, color: Color(0xff2A2A2D), fontSize: 14))
                ],
              )
                  : ListView.builder(
                  physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                  shrinkWrap: true,
                  itemCount: newInvoiceList.length,
                  itemBuilder: (context, index){
                    InvoiceDetails oneInvoice = newInvoiceList[index];
                    return Column(
                      children: [
                        GestureDetector(
                          child: Container(),
                          onTap: (){
                            Navigator.pushNamed(context, IndividualContractScreen.individualContractPage, arguments: oneInvoice);
                          },
                        ),
                        Padding(padding: EdgeInsets.only(bottom: 12)),
                      ],
                    );
                  }
              ),
            ),
          )
        ],
      );
  }
}
