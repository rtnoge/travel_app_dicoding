import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:travel_app_dicoding/theme.dart';
import 'package:travel_app_dicoding/ui/pages/home_page.dart';
import 'package:travel_app_dicoding/ui/pages/maintenance_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var _currIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget _customBottomBar() {
      return LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth <= 290) {
          return Container(
            height: 65,
            width: MediaQuery.of(context).size.width - (2 * 24),
            margin: EdgeInsets.symmetric(horizontal: 35),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
            ),
            child: GNav(
              onTabChange: (value) => setState(() {
                _currIndex = value;
                print("index saat ini $_currIndex");
              }),
              color: greyTextColor, // unselected icon color
              activeColor: whiteTextColor, // selected icon and text color
              iconSize: 20,
              tabBorderRadius: 15,
              // tabMargin:
              //     EdgeInsets.symmetric(horizontal: 10), // tab button icon size
              tabBackgroundColor: primaryColor, // selected tab background color
              padding:
                  EdgeInsets.only(top: 14, bottom: 14, left: 10, right: 10),
              textStyle: whiteTextStyle.copyWith(
                  fontSize: 12), // navigation bar padding
              tabs: [
                GButton(
                  icon: Icons.home,
                ),
                GButton(
                  icon: Icons.book,
                ),
                GButton(
                  icon: Icons.notifications,
                ),
                GButton(
                  icon: Icons.settings,
                )
              ],
            ),
          );
        } else {
          return Container(
            height: 65,
            width: MediaQuery.of(context).size.width - (2 * 24),
            margin: EdgeInsets.symmetric(horizontal: 35),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
            ),
            child: GNav(
              onTabChange: (value) => setState(() {
                _currIndex = value;
                print("index saat ini $_currIndex");
              }),
              color: greyTextColor, // unselected icon color
              activeColor: whiteTextColor, // selected icon and text color
              iconSize: 17,
              tabBorderRadius: 20,
              // tabMargin:
              //     EdgeInsets.symmetric(horizontal: 10), // tab button icon size
              tabBackgroundColor: primaryColor, // selected tab background color
              padding: EdgeInsets.only(top: 14, bottom: 14, left: 8, right: 6),
              textStyle: whiteTextStyle.copyWith(
                  fontSize: 12), // navigation bar padding
              tabs: [
                GButton(
                  icon: Icons.home,
                  text: ' Home',
                ),
                GButton(
                  icon: Icons.book,
                  text: ' Booked',
                ),
                GButton(
                  icon: Icons.notifications,
                  text: ' Notification',
                ),
                GButton(
                  icon: Icons.settings,
                  text: ' Settings',
                )
              ],
            ),
          );
        }
      });
    }

    Widget _content(int _currIndex) {
      switch (_currIndex) {
        case 0:
          return HomePage();
        case 1:
          return MaintenancePage('Booked');
        case 2:
          return MaintenancePage('Notification');
        case 3:
          return MaintenancePage('Settings');
        default:
          return HomePage();
      }
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: backgroundColor,
      body: _content(_currIndex),
      floatingActionButton: _customBottomBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
