import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ibilling_app/views/screens/contracts_screen.dart';
import 'package:ibilling_app/views/screens/history_screen.dart';
import 'package:ibilling_app/views/screens/new_screen.dart';
import 'package:ibilling_app/views/screens/profile_screen.dart';
import 'package:ibilling_app/views/screens/saved_screen.dart';
import 'package:ibilling_app/widgets/custom_appbar.dart';

class HomePage extends StatefulWidget {
  static final homePageRoute = '/';
  final String title;

  HomePage({Key key, this.title})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  String selectedBarType = 'Contracts';
  String _title;
  Color color;
  final List<Widget> _children = [
    Contracts(),
    HistoryScreen(),
    NewScreen(),
    SavedScreen(),
    ProfileScreen(),
  ];

  void changeNavBar(String navBar){
    selectedBarType = navBar;
    setState(() {
      
    });
  }

  @override
  initState(){
    _title = _children[0].toString();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: new Scaffold(
        appBar: CustomAppBar(appBarText: _title, isAction: true),
        body: _children[_currentIndex],
        bottomNavigationBar: SizedBox(
          height: 58,
          child: BottomNavigationBar(
            backgroundColor: Color(0xff141416),
            onTap: onTabTapped,
            currentIndex: _currentIndex,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: SvgPicture.asset('assets/icons/DocumentLight.svg', height: 24,width: 24),
                ),
                title: Text('Contracts', style: TextStyle(fontSize: 10, fontFamily: 'Ubuntu Medium'),),
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: SvgPicture.asset('assets/icons/TimeCircleLight.svg', height: 24,width: 24),
                ),
                title: Text('History', style: TextStyle(fontSize: 10, fontFamily: 'Ubuntu Medium'),),
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: SvgPicture.asset('assets/icons/PlusLight.svg', height: 24,width: 24,),
                ),
                title: Text('New', style: TextStyle(fontSize: 10, fontFamily: 'Ubuntu Medium'),),
              ),
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: SvgPicture.asset('assets/icons/BookmarkLight.svg', height: 24,width: 24),
                  ),
              title: Text('Saved', style: TextStyle(fontSize: 10, fontFamily: 'Ubuntu Medium'),),
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: SvgPicture.asset('assets/icons/ProfileLight.svg', height: 24,width: 24),
                ),
                title: Text('Profile', style: TextStyle(fontSize: 10, fontFamily: 'Ubuntu Medium'),),
              )
            ],
          ),
        ),
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      switch(index) {
        case 0: { _title = 'Contracts'; }
        break;
        case 1: { _title = 'History'; }
        break;
        case 2: { _title = 'New'; }
        break;
        case 3: { _title = 'Saved'; }
        break;
        case 4: { _title = 'Profile'; }
        break;
      }
    });
  }
}