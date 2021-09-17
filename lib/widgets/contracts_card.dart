import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ibilling_app/constants.dart';
import 'package:ibilling_app/models/contract_details.dart';
import 'package:intl/intl.dart';

class ContractsCard extends StatelessWidget {
  ContractDetails contractDetails;
  ContractsCard({this.contractDetails});

  Widget statusFunc(){
    switch(contractDetails.status){
      case 'Paid':
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
          decoration: BoxDecoration(
              color: Color(0xff49B7A5).withOpacity(0.15),
              borderRadius: BorderRadius.circular(8)
          ),
          child: Text(contractDetails.status, style: TextStyle(fontFamily: 'Ubuntu Medium', fontWeight: FontWeight.w500, fontSize: 12, color: Color(0xff49B7A5)),),
        );
        break;
      case 'In process':
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
          decoration: BoxDecoration(
              color: Color(0xffFDAB2A).withOpacity(0.15),
              borderRadius: BorderRadius.circular(8)
          ),
          child: Text(contractDetails.status, style: TextStyle(fontFamily: 'Ubuntu Medium', fontWeight: FontWeight.w500, fontSize: 12, color: Color(0xffFDAB2A)),),
        );
        break;
      case 'Rejected by Payme':
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
          decoration: BoxDecoration(
              color: Color(0xffF85379).withOpacity(0.15),
              borderRadius: BorderRadius.circular(8)
          ),
          child: Text(contractDetails.status, style: TextStyle(fontFamily: 'Ubuntu Medium', fontWeight: FontWeight.w500, fontSize: 12, color: Color(0xffFF426D)),),
        );
        break;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.cardGrey,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              Row(children: [
                SvgPicture.asset('assets/icons/Paper.svg', height: 18,width: 18),
                SizedBox(width: 6),
                Text('№ ${contractDetails.lastInvoice}', style: AppTextStyles.invoiceNumber),
                Spacer(),
                statusFunc()
              ],),
            SizedBox(height: 12),
            RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(text: 'Fish: ', style: AppTextStyles.cardTitles),
                  TextSpan(text: ' ${contractDetails.fishName}', style: AppTextStyles.contractDetails)
                ]
              ),
            ),
            SizedBox(height: 10),
            RichText(
              text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(text: 'Amount: ', style: AppTextStyles.cardTitles),
                    TextSpan(text: ' ${contractDetails.amount} UZS', style: AppTextStyles.contractDetails)
                  ]
              ),
            ),
            SizedBox(height: 10),
            RichText(
              text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(text: 'Last Invoice: ', style: AppTextStyles.cardTitles),
                    TextSpan(text: ' ${contractDetails.lastInvoice}', style: AppTextStyles.contractDetails)
                  ]
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                RichText(
                  text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(text: 'Number of invoices: ', style: AppTextStyles.cardTitles),
                        TextSpan(text: ' ${contractDetails.numOfInvoices}', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xff999999), fontFamily: 'Ubuntu Regular'))
                      ]
                  ),
                ),
                Spacer(),
                Text(DateFormat('yyyy-MM-dd').format(contractDetails.date), style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xff999999), fontFamily: 'Ubuntu Regular'))
              ],
            )
            ],
          ),
    );
  }
}
