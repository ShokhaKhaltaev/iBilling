import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ibilling_app/constants.dart';
import 'package:ibilling_app/models/contract_details.dart';
import 'package:ibilling_app/provider/contract_provider.dart';
import 'package:ibilling_app/widgets/contracts_card.dart';
import 'package:ibilling_app/widgets/date_picker_widget.dart';
import 'package:provider/provider.dart';

class HistoryScreen extends StatefulWidget {
  static final historyRoute = '/history-screen';

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  DateTime fromDate = DateTime(2021, 09, 1);
  DateTime toDate = DateTime(2021, 09, 12);
  @override
  Widget build(BuildContext context) {
    List<ContractDetails> newContractList = Provider.of<ContractList>(context).contracts;

    return Container(
      padding: EdgeInsets.only(top: 20, left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('Date', style: AppTextStyles.headerStyle),
          SizedBox(height: 19),
          Container(
            width: MediaQuery.of(context).size.width*0.7,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                    child: DatePickerWidget(dateText: fromDate),
                  onTap: () => _selectFromDate(context),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 18),
                  child: Container(
                    height: 2,
                    width: 8,
                    color: Color(0xffD1D1D1),
                  ),
                ),
                InkWell(
                  onTap: () => _selectToDate(context),
                  child: DatePickerWidget(dateText: toDate)
                )
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
                        Text('No history for this period', style: AppTextStyles.emptyList)
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

  _selectFromDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: fromDate, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != fromDate)
      setState(() {
        fromDate = picked;
      });
  }

  _selectToDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: toDate, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != toDate)
      setState(() {
        toDate = picked;
      });
  }
}


