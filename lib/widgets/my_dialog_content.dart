import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ibilling_app/models/alert_model.dart';
import 'package:ibilling_app/provider/contract_provider.dart';
import 'package:provider/provider.dart';

class MyDialogContent extends StatefulWidget {

  @override
  _MyDialogContentState createState() => new _MyDialogContentState();
}

class _MyDialogContentState extends State<MyDialogContent> {
  List<CustomRowModel> sampleData = [];

  @override
  void initState() {
    super.initState();
    sampleData.add(CustomRowModel(title: "O'zbek (Lotin)",imagePath: 'assets/images/Uzbek.png',selected: false));
    sampleData.add(CustomRowModel(title: "Russian",imagePath: 'assets/images/Russian.png', selected: false));
    sampleData.add(CustomRowModel(title: "English (USA)",imagePath: 'assets/images/english.png', selected: false));
  }

  @override
  Widget build(BuildContext context) {
    return sampleData.length == 0
        ? Container()
        : Container(
      //height: 280,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: sampleData.length,
        itemBuilder: (BuildContext context, int index) {
          return new InkWell(
            //highlightColor: Colors.red,
            //splashColor: Colors.blueAccent,
            onTap: () {
              setState(() {
                sampleData.forEach((element) => element.selected = false);
                sampleData[index].selected = true;
              });
            },
            child: new CustomRow(sampleData[index]),
          );
        },
      ),
    );
  }
}