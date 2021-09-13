import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ibilling_app/views/screens/contracts_screen.dart';

class CustomBottomNavBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BuildNavBar(iconUrlName: 'Paper.svg', name: 'Contacts', pagePath: Contracts.contractRoute),
      ],
    );
  }
}

class BuildNavBar extends StatelessWidget {
  final String iconUrlName;
  final String name;
  final String pagePath;
  BuildNavBar({this.name, this.iconUrlName, this.pagePath});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushReplacementNamed(context, pagePath);
      },
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width/5,
        decoration: BoxDecoration(
          color: Color(0xff141416),
        ),
        child: Column(
          children: [
            SvgPicture.asset('assets/icons/$iconUrlName'),
            SizedBox(height: 5),
            Text(name, style: TextStyle(fontFamily: 'Ubuntu Medium', fontSize: 10))
          ],
        ),
      ),
    );
  }
}
