import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ibilling_app/models/profile_details.dart';
import 'package:intl/intl.dart';

class ProfileWidget extends StatelessWidget {

  final String fullName;
  final String profession;
  final String company;
  final DateTime dateOfBirth;
  final String phoneNumber;
  final String email;
  ProfileWidget({this.fullName, this.profession, this.company, this.dateOfBirth, this.phoneNumber, this.email});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.24,
      padding: EdgeInsets.all(12),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xff2A2A2D),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 48,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 40,
                  width: 40,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/user.png'),
                        fit: BoxFit.fill
                      )
                    ),
                ),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(fullName, style: TextStyle(color: Color(0xff00A795), fontSize: 16, fontWeight: FontWeight.w600, fontFamily: 'Ubuntu Medium'),),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Row(
                        children: [
                          Text(profession, style: TextStyle(fontFamily: 'Ubuntu Medium', fontSize: 12, fontWeight: FontWeight.w500),),
                          SizedBox(width: 5),
                          Center(
                            child: Container(
                              height: 5,
                              width: 5,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30)
                              ),
                            ),
                          ),
                          SizedBox(width: 5),
                          Text(company, style: TextStyle(fontFamily: 'Ubuntu Medium', fontSize: 12, fontWeight: FontWeight.w500),),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 20),
          RichText(
            text: TextSpan(
                children: <TextSpan>[
                  TextSpan(text: 'Date of birth: ', style: TextStyle(fontFamily: 'Ubuntu Medium', fontWeight: FontWeight.w500, fontSize: 14)),
                  TextSpan(text: ' ${DateFormat('dd-MM-yyyy').format(dateOfBirth)}', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xff999999), fontFamily: 'Ubuntu Regular'))
                ]
            ),
          ),
          SizedBox(height: 12),
          RichText(
            text: TextSpan(
                children: <TextSpan>[
                  TextSpan(text: 'Phone number: ', style: TextStyle(fontFamily: 'Ubuntu Medium', fontWeight: FontWeight.w500, fontSize: 14)),
                  TextSpan(text: phoneNumber, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xff999999), fontFamily: 'Ubuntu Regular'))
                ]
            ),
          ),
          SizedBox(height: 12),
          RichText(
            text: TextSpan(
                children: <TextSpan>[
                  TextSpan(text: 'E-mail: ', style: TextStyle(fontFamily: 'Ubuntu Medium', fontWeight: FontWeight.w500, fontSize: 14)),
                  TextSpan(text: email, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xff999999), fontFamily: 'Ubuntu Regular'))
                ]
            ),
          ),
        ],
      )
    );
  }
}
