import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ibilling_app/models/contract_details.dart';
import 'package:ibilling_app/provider/contract_provider.dart';
import 'package:ibilling_app/widgets/contracts_card.dart';
import 'package:ibilling_app/widgets/date_picker_widget.dart';
import 'package:provider/provider.dart';

class HistoryScreen extends StatelessWidget {
  static final historyRoute = '/history-screen';

  @override
  Widget build(BuildContext context) {
    List<ContractDetails> newContractList = Provider.of<ContractList>(context).contracts;

    return Container(
      padding: EdgeInsets.only(top: 20, left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('Date', style: TextStyle(fontWeight: FontWeight.w700, fontFamily: 'Ubuntu Medium', fontSize: 14, color: Color(0xff999999))),
          SizedBox(height: 19),
          Container(
            width: MediaQuery.of(context).size.width*0.7,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DatePickerWidget(dateText: 'From'),
                Padding(
                  padding: const EdgeInsets.only(top: 18),
                  child: Container(
                    height: 2,
                    width: 8,
                    color: Color(0xffD1D1D1),
                  ),
                ),
                DatePickerWidget(dateText: 'To')
              ],
            ),
          ),
          SizedBox(height: 20),
          newContractList.isEmpty ?
              Expanded(
                child: Center(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset('assets/icons/Document.svg', height: 74, width: 66, color: Color(0xff2A2A2D)),
                        SizedBox(height: 15),
                        Text('No history for this period', style: TextStyle(fontFamily: 'Ubuntu Medium', fontWeight: FontWeight.w600, color: Color(0xff2A2A2D), fontSize: 14))
                      ],
                    ),
                  ),
                ),
              ) :
              Expanded(
                child: Container(
                  child: ListView.builder(
                      physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                      shrinkWrap: true,
                      itemCount: newContractList.length,
                      itemBuilder: (context, index){
                        ContractDetails oneContract = newContractList[index];
                        return Column(
                          children: [
                            ContractsCard(
                              contractDetails: oneContract,
                            ),
                            Padding(padding: EdgeInsets.only(bottom: 12)),
                          ],
                        );
                      }
                  ),
                ),
              )
        ],
      ),
    );
  }
}
