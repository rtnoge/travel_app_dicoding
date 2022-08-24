import 'package:flutter/material.dart';
import 'package:travel_app_dicoding/theme.dart';
import 'package:travel_app_dicoding/ui/widgets/button.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _potraitScreen() {
      return SafeArea(
        child: Center(
          child: ListView(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height / 7,
              bottom: MediaQuery.of(context).size.height / 7,
            ),
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // ),
                  Image.asset(
                    'assets/image_onboarding.png',
                    width: MediaQuery.of(context).size.height / 3.6,
                  ),
                  SizedBox(height: 30),
                  Text(
                    'Explore Destinations',
                    style: blackTextStyle.copyWith(
                        fontSize: 24, fontWeight: semiBold),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Discover the places for your trip in the\nworld and feel great.',
                    textAlign: TextAlign.center,
                    style: greyTextStyle.copyWith(fontSize: 16),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 64),
                    width: 200,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () =>
                          // Navigator.pushNamed(context, '/login'),
                          Navigator.pushReplacementNamed(context, '/main_page'),
                      child: Text(
                        'Get Started',
                        style: whiteTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: medium,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }

    Widget _landscapeScreen() {
      return SafeArea(
        child: Center(
          child: ListView(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height / 6,
              bottom: MediaQuery.of(context).size.height / 4,
            ),
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 3.6,
                    height: MediaQuery.of(context).size.width / 3.6,
                    margin: EdgeInsets.only(bottom: 64),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/image_onboarding.png')),
                    ),
                  ),
                  Text(
                    'Explore Destinations',
                    style: blackTextStyle.copyWith(
                        fontSize: 28, fontWeight: semiBold),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Discover the places for your trip in the\nworld and feel great.',
                    textAlign: TextAlign.center,
                    style: greyTextStyle.copyWith(fontSize: 16),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 65),
                    width: 200,
                    height: 60,
                    child: CustomButton(
                        onPressed: () => Navigator.pushReplacementNamed(
                            context, '/main_page'),
                        radius: 10,
                        title: 'Get Started'),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: (MediaQuery.of(context).orientation == Orientation.portrait)
          ? _potraitScreen()
          : _landscapeScreen(),
    );
  }
}
