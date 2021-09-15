import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ibilling_app/models/contract_details.dart';
import 'package:intl/intl.dart';

class ContractsExtendedCard extends StatelessWidget {
  ContractDetails contractDetails;
  ContractsExtendedCard({this.contractDetails});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
        padding: EdgeInsets.only(top: 12, left: 12, bottom: 12, right: 35),
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.42,
        decoration: BoxDecoration(
          color: Color(0xff2A2A2D),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(text: "Fisher's full name: ", style: TextStyle(fontFamily: 'Ubuntu Medium', fontWeight: FontWeight.w500, fontSize: 14)),
                    TextSpan(text: ' ${contractDetails.fishName}', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xff999999), fontFamily: 'Ubuntu Regular'))
                  ]
              ),
            ),
            SizedBox(height: 10),
            RichText(
              text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(text: "Status of the contract: ", style: TextStyle(fontFamily: 'Ubuntu Medium', fontWeight: FontWeight.w500, fontSize: 14)),
                    TextSpan(text: ' ${contractDetails.status}', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xff999999), fontFamily: 'Ubuntu Regular'))
                  ]
              ),
            ),
            SizedBox(height: 10),
            RichText(
              text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(text: 'Amount: ', style: TextStyle(fontFamily: 'Ubuntu Medium', fontWeight: FontWeight.w500, fontSize: 14)),
                    TextSpan(text: ' ${contractDetails.amount} UZS', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xff999999), fontFamily: 'Ubuntu Regular'))
                  ]
              ),
            ),
            SizedBox(height: 10),
            RichText(
              text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(text: 'Last Invoice: ', style: TextStyle(fontFamily: 'Ubuntu Medium', fontWeight: FontWeight.w500, fontSize: 14)),
                    TextSpan(text: '№ ${contractDetails.lastInvoice}', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xff999999), fontFamily: 'Ubuntu Regular'))
                  ]
              ),
            ),
            SizedBox(height: 10),
            RichText(
              text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(text: 'Number of invoices: ', style: TextStyle(fontFamily: 'Ubuntu Medium', fontWeight: FontWeight.w500, fontSize: 14)),
                    TextSpan(text: ' ${contractDetails.numOfInvoices}', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xff999999), fontFamily: 'Ubuntu Regular'))
                  ]
              ),
            ),
            SizedBox(height: 10),
            RichText(
              text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(text: "Address of the organization: ", style: TextStyle(fontFamily: 'Ubuntu Medium', fontWeight: FontWeight.w500, fontSize: 14)),
                    TextSpan(text: ' ${contractDetails.address}', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xff999999), fontFamily: 'Ubuntu Regular'))
                  ]
              ),
            ),
            SizedBox(height: 10),
            RichText(
              text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(text: "ITN/IEC of the organization: ", style: TextStyle(fontFamily: 'Ubuntu Medium', fontWeight: FontWeight.w500, fontSize: 14)),
                    TextSpan(text: ' ${contractDetails.fishName}', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xff999999), fontFamily: 'Ubuntu Regular'))
                  ]
              ),
            ),
            SizedBox(height: 10),
            RichText(
              text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(text: "Created at: ", style: TextStyle(fontFamily: 'Ubuntu Medium', fontWeight: FontWeight.w500, fontSize: 14)),
                    TextSpan(text: ' ${DateFormat.Hm().format(contractDetails.date)}, ${DateFormat.yMMMMd('en_US').format(contractDetails.date)}', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xff999999), fontFamily: 'Ubuntu Regular'))
                  ]
              ),
            )
          ],
        ),
      ),
    );
  }
}