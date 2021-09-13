import 'package:flutter/material.dart';
import 'package:ibilling_app/models/profile_details.dart';
import 'package:ibilling_app/widgets/language_container.dart';
import 'package:ibilling_app/widgets/language_selection.dart';
import 'package:ibilling_app/widgets/profile_widget.dart';

class ProfileScreen extends StatelessWidget {
  static final profileRoute = '/profile-screen';
  ProfileDetails profileDetails;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.only(top: 20, left: 16, right: 16),
      child: Column(
        children: [
          ProfileWidget(
            fullName: 'Otabek Abdusamatov',
            profession: 'Graphic Designer',
            company: 'IQ Eduaction',
            dateOfBirth: DateTime.now(),
            phoneNumber: '+998977210688',
            email: 'predatorhunter041@gmail.com',
          ),
          SizedBox(height: 10),
          InkWell(child: LanguageContainer(),
            onTap: (){
              showDialog(context: context, builder: (context){
                return LanguageSelection();
              });
            },
          )
        ],
      ),
    );
  }
}
