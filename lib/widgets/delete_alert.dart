import 'package:flutter/material.dart';
import 'custom_button.dart';

class DeleteAlert extends StatelessWidget {
  final TextEditingController controller;
  DeleteAlert({this.controller});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 16),
      titlePadding: EdgeInsets.only(top: 15),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(6))
      ),
      backgroundColor: Color(0xff2A2A2D),
      title: Container(
        width: MediaQuery.of(context).size.width * 0.95,
        child: Center(
          child: Text('Leave a comment, why are you\n    deleting this contract?', style: TextStyle(
              fontFamily: 'Ubuntu Medium', fontSize: 14, fontWeight: FontWeight.w700, color: Colors.white
          ),),
        ),
      ),
      content: TextFormField(
        controller: controller,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(5),
            filled: true,
            hintText: 'Type a comment',
            hintStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.grey),
            fillColor: Color(0xff5C5C5C),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
            )
        ),
      ),
      contentPadding: EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 20),
      actions: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          height: 45,
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: CustomButton(
                    buttonText: 'Cancel',
                    color: Color(0xff561625),
                    buttonColor: Colors.pink,
                    onPressed: (){

                    },
                  )
              ),
              SizedBox(width: 17),
              Expanded(
                  child: CustomButton(
                    buttonText: 'Done',
                    color: Color(0xff561625),
                    buttonColor: Colors.white,
                    onPressed: (){

                    },
                  )
              )
            ],
          ),
        )
      ],
    );
  }
}
