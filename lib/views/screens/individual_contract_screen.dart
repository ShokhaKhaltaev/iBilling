import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ibilling_app/models/contract_details.dart';
import 'package:ibilling_app/models/individual_card_model.dart';
import 'package:ibilling_app/widgets/contract_extended_card.dart';
import 'package:ibilling_app/widgets/custom_button.dart';
import 'package:ibilling_app/widgets/delete_alert.dart';

class IndividualContractScreen extends StatefulWidget {
  static final individualContractPage = '/individual_contract-page';
  TextEditingController deleteController;

  @override
  _InvidualContractScreenState createState() => _InvidualContractScreenState();
}

class _InvidualContractScreenState extends State<IndividualContractScreen> {
  ContractDetails contractDetails;
  @override
  Widget build(BuildContext context) {
    contractDetails = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.pop(context);
          },
          color: Colors.white,
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/icons/Paper.svg',),
            SizedBox(width: 10),
            Text('№${contractDetails.lastInvoice}', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18, fontFamily: 'Ubuntu Medium')),
          ],
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(child: SvgPicture.asset('assets/icons/Bookmark.svg', height: 20, width: 16),
            onTap: (){

            },),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: [
              ContractsExtendedCard(contractDetails: contractDetails),
              SizedBox(height: 20),
              Container(
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: CustomButton(
                          buttonText: 'Delete contract',
                          color: Color(0xff561625),
                          buttonColor: Colors.pink,
                          onPressed: (){
                            showDialog(
                              context: context,
                              builder: (context) => DeleteAlert(controller: widget.deleteController)
                            );
                          },
                        )
                    ),
                    SizedBox(width: 17),
                    Expanded(
                        child: CustomButton(
                          buttonText: 'Create contract',
                          color: Color(0xff00A795),
                          buttonColor: Colors.white,
                          onPressed: (){

                          },
                        )
                    )
                  ],
                ),
              ),
            ],
          )
      ),
    );
  }
}

