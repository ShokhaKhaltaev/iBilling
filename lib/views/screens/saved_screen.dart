import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ibilling_app/constants.dart';
import 'package:ibilling_app/models/contract_details.dart';
import 'package:ibilling_app/provider/contract_provider.dart';
import 'package:ibilling_app/widgets/contracts_card.dart';
import 'package:provider/provider.dart';

class SavedScreen extends StatelessWidget {
  static final savedRoute = '/saved-screen';

  @override
  Widget build(BuildContext context) {
    List<ContractDetails> newContractList = Provider.of<ContractList>(context).contracts;
    return Padding(
      padding: EdgeInsets.only(top: 20, left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          newContractList.isEmpty ?
          Expanded(
            child: Center(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/icons/Bookmark.svg', height: 74, width: 66, color: Color(0xff2A2A2D)),
                    SizedBox(height: 15),
                    Text('No saved contracts', style: AppTextStyles.emptyList)
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
