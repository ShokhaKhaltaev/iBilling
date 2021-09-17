import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ibilling_app/constants.dart';
import 'package:ibilling_app/views/screens/filters_screen.dart';
import 'package:ibilling_app/widgets/search_widget.dart';

class CustomAppBar extends StatelessWidget implements PreferredSize {
  final String appBarText;
  final bool isAction;
  CustomAppBar({this.appBarText, this.isAction});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backwardsCompatibility: false,
      systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: AppColors.appBarBottomNav),
      backgroundColor: AppColors.appBarBottomNav,
      leading: Image.asset('assets/images/logo.png', height: 24,width: 24),
      titleSpacing: 0,
      title: Text(appBarText, style: AppTextStyles.appBarTitle,),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 15),
          child: Container(
            width: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(child: SvgPicture.asset('assets/icons/Filter.svg'),
                onTap: (){
                  Navigator.pushNamed(context, FiltersScreen.filtersPageRoute);
                }),
                Container(color: Colors.white, height: 20, width: 2),
                GestureDetector(child: SvgPicture.asset('assets/icons/search.svg'),
                onTap: (){
                  showSearch(context: context, delegate: Search());
                }),
              ],
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => Size.fromHeight(56);
}
