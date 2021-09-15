import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ibilling_app/widgets/expnaded_animation.dart';
import 'package:ibilling_app/widgets/scrollbar.dart';

class DropDown extends StatefulWidget {

  final List<String> list;
  String selectedValue;
  DropDown({this.list, this.selectedValue});
  @override
  _DropDownState createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  bool isStretchedDropDown = false;
  bool onTap = false;
  int groupValue;
  @override
  Widget build(BuildContext context) {
    return Container(
          height: double.infinity,
          width: double.infinity,
          //padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: onTap ? Color(0xffF1F1F1) : Color(0xff2A2A2D), width: 2),
                            borderRadius: BorderRadius.all(Radius.circular(4))),
                        child: Column(
                          children: [
                            Container(
                              // height: 45,
                                width: double.infinity,
                                padding: EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(4))),
                                constraints: BoxConstraints(
                                  minHeight: 45,
                                  minWidth: double.infinity,
                                ),
                                alignment: Alignment.center,
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 10),
                                        child: Text(
                                          widget.selectedValue, style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14, color: Colors.white),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            isStretchedDropDown =
                                            !isStretchedDropDown;
                                            onTap = true;
                                          });
                                        },
                                        child: SvgPicture.asset('assets/icons/arrow_text.svg'),)
                                  ],
                                )),
                                    ExpandedSection(
                                      expand: isStretchedDropDown,
                                      height: 100,
                                      child: MyScrollbar(
                                        builder: (context, scrollController2) =>
                                        ListView.builder(
                                            padding: EdgeInsets.all(0),
                                            controller: scrollController2,
                                            shrinkWrap: true,
                                            itemCount: widget.list.length,
                                            itemBuilder: (context, index) {
                                              return RadioListTile(
                                                  title: Text(widget.list.elementAt(index), style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14, color: Colors.white)),
                                                  value: index,
                                                  groupValue: groupValue,
                                                  onChanged: (val) {
                                                    setState(() {
                                                      groupValue = val;
                                                      widget.selectedValue = widget.list.elementAt(index);
                                                    });
                                                  });
                                            }),
                                      ),
                                    ),
                          ],
                        ),
                      )),
                ],
              )
            ],
          ),
        );
  }
}