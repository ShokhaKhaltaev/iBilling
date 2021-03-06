import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:ibilling_app/constants.dart';
import 'package:ibilling_app/views/screens/home_page.dart';
import 'package:ibilling_app/widgets/custom_bottom_navbar.dart';
import 'package:ibilling_app/widgets/custom_button.dart';
import 'package:ibilling_app/widgets/date_picker_widget.dart';

class FiltersScreen extends StatefulWidget {
  static final filtersPageRoute = '/filters-screen';
  String checkBoxValue = '';

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  List<String> _checked = [];
  DateTime fromDate = DateTime(2021, 09, 1);
  DateTime toDate = DateTime(2021, 09, 12);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: AppColors.appBarBottomNav),
        backgroundColor: AppColors.appBarBottomNav,
        centerTitle: true,
        title: Text('Filters', style: TextStyle(fontSize: 20, fontFamily: 'Ubuntu Medium', fontWeight: FontWeight.w500),),
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
          color: Colors.white
          ),
          onPressed: (){
            Navigator.pop(context);
          },
        )
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Status', style: AppTextStyles.headerStyle),
                SizedBox(height: 22),
                Theme(
                  data: Theme.of(context).copyWith(
                    unselectedWidgetColor: AppColors.cardGrey,
                  ),
                  child: CheckboxGroup(
                    labels: <String>[
                      "Paid",
                      "In process",
                      "Rejected by IQ",
                      "Rejected by Payme",
                    ],
                    checked: _checked,
                    onChange: (bool isChecked, String label, int index) {
                      widget.checkBoxValue = label;
                    },
                    activeColor: Colors.white,
                    checkColor: Colors.black,
                    itemBuilder: (Checkbox cb, Text txt, int i){
                      return Row(
                        children: <Widget>[
                          Row(
                            children: [
                              cb,
                              SizedBox(width: 8),
                              txt,
                            ],
                          ),
                        ],
                      );
                    },
                    onSelected: (List selected) => setState(() {
                      if (selected.length > 1) {
                        selected.removeAt(0);
                      } else {
                      }
                      _checked = selected;
                      print('Checked: $_checked');
                    }),
                  ),
                ),
                SizedBox(height: 30),
                Text('Date', style: AppTextStyles.headerStyle),
                SizedBox(height: 22),
                Container(
                  width: MediaQuery.of(context).size.width*0.7,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: (){
                          _selectFromDate(context);
                        },
                          child: DatePickerWidget(dateText: fromDate)
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
                          child: DatePickerWidget(dateText: toDate),
                        onTap: (){
                          _selectToDate(context);
                        },
                      )
                    ],
                  ),
                )
              ],
            ),
            Column(
              children: [
                Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: CustomButton(
                          buttonText: 'Cancel',
                          color: Color(0xff00A795),
                          buttonColor: Colors.white,
                          onPressed: (){
                            Navigator.pop(context);
                          },
                        )
                      ),
                      SizedBox(width: 17),
                      Expanded(
                        child: CustomButton(
                          buttonText: 'Apply filters',
                          color: Color(0xff00A795),
                          buttonColor: Colors.white,
                          onPressed: (){
                            Navigator.pushNamed(context, HomePage.homePageRoute);
                          },
                        )
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
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
