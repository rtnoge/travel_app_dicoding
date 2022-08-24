import 'package:flutter/material.dart';
import 'package:travel_app_dicoding/model/destination_model.dart';
import 'package:travel_app_dicoding/theme.dart';
import 'package:travel_app_dicoding/ui/pages/add_traveler_page.dart';
import 'package:travel_app_dicoding/ui/widgets/button.dart';
import 'package:travel_app_dicoding/ui/widgets/overview_item.dart';

class DetailsPage extends StatelessWidget {
  final DestinationModel destination;
  const DetailsPage(this.destination, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _buttonBook() {
      return Container(
        height: 60,
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.symmetric(
          horizontal: 30,
        ),
        child: Row(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '\$${destination.price}',
                  style: blackTextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: medium,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  '/ per person',
                  style: blackTextStyle.copyWith(
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
              ],
            ),
            Expanded(
              child: Container(
                width: (MediaQuery.of(context).size.width / 2) - 35,
                // width: 150,
                height: 53,
                child: CustomButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddTraveler(destination))),
                  title: 'Book Now',
                  radius: 50,
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget _potraitScreen() {
      return SafeArea(
        child: Stack(
          children: [
            Image.asset(
              destination.img_url,
              width: double.infinity,
              height: (MediaQuery.of(context).size.height / 2) + 25,
              fit: BoxFit.cover,
            ),
            SingleChildScrollView(
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.only(
                  top: (MediaQuery.of(context).size.height / 2) - 25,
                ),
                padding: EdgeInsets.only(
                  top: 35,
                  left: 30,
                  right: 30,
                  bottom: 17,
                ),
                // height: (MediaQuery.of(context).size.height / 2) + 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                destination.title,
                                style: blackTextStyle.copyWith(
                                    fontSize: 20, fontWeight: semiBold),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                destination.location,
                                style: greyTextStyle,
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 20,
                              height: 20,
                              margin: EdgeInsets.only(right: 5),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/icon_star.png'),
                                ),
                              ),
                            ),
                            Text(
                              destination.rate.toString(),
                              style: greyTextStyle.copyWith(
                                fontSize: 15,
                                fontWeight: medium,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(vertical: 20),
                      child: Divider(
                        color: greyTextColor.withOpacity(0.5),
                        height: 1,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Overview',
                          style: blackTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: medium,
                          ),
                        ),
                        SizedBox(height: 12),
                        Text(
                          destination.desc,
                          style: greyTextStyle.copyWith(
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(height: 40),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            OverviewItem(
                              title: 'Duration',
                              duration: destination.duration,
                              icon: Icons.access_time_filled,
                              color: Color(0xff009BFF),
                            ),
                            OverviewItem(
                              title: 'Distance',
                              duration: destination.distance,
                              icon: Icons.location_on,
                              color: primaryColor,
                            ),
                            OverviewItem(
                              title: 'Weather',
                              duration: destination.weather,
                              icon: Icons.sunny,
                              color: Color(0xffFF9900),
                            ),
                          ],
                        ),
                        SizedBox(height: 25),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: 35,
                  left: ((MediaQuery.of(context).size.height / 2) - 23) / 14),
              child: GestureDetector(
                onTap: () {
                  print('back to main_page');
                  Navigator.pushNamed(context, '/main_page');
                },
                child: Container(
                  width: ((MediaQuery.of(context).size.height / 2) - 23) / 12,
                  height: ((MediaQuery.of(context).size.height / 2) - 23) / 12,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/arrow_left_light.png'),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget _landscapeScreen() {
      return SafeArea(
        child: Row(
          children: [
            Stack(
              children: [
                Image.asset(
                  destination.img_url,
                  width: (MediaQuery.of(context).size.width / 2) - 23,
                  height: MediaQuery.of(context).size.height,
                  fit: BoxFit.cover,
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: 35,
                      left:
                          ((MediaQuery.of(context).size.width / 2) - 23) / 14),
                  child: GestureDetector(
                    onTap: () {
                      print('back to main_page');
                      Navigator.pushNamed(context, '/main_page');
                    },
                    child: Container(
                      width:
                          ((MediaQuery.of(context).size.width / 2) - 23) / 12,
                      height:
                          ((MediaQuery.of(context).size.width / 2) - 23) / 12,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/arrow_left_light.png'),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SingleChildScrollView(
              child: Container(
                width: (MediaQuery.of(context).size.width / 2) + 23,
                height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.only(
                  top: 30,
                  left: ((MediaQuery.of(context).size.width / 2) + 23) / 15,
                  right: ((MediaQuery.of(context).size.width / 2) + 23) / 15,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                destination.title,
                                style: blackTextStyle.copyWith(
                                    fontSize: 18, fontWeight: semiBold),
                              ),
                              Text(
                                destination.location,
                                style: greyTextStyle,
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 18,
                              height: 18,
                              margin: EdgeInsets.only(right: 5),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/icon_star.png'),
                                ),
                              ),
                            ),
                            Text(
                              destination.rate.toString(),
                              style: greyTextStyle.copyWith(
                                fontSize: 12,
                                fontWeight: medium,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(vertical: 20),
                      child: Divider(
                        color: greyTextColor.withOpacity(0.5),
                        height: 1,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Overview',
                          style: blackTextStyle.copyWith(
                            fontWeight: medium,
                          ),
                        ),
                        SizedBox(height: 12),
                        Text(
                          destination.desc,
                          style: greyTextStyle.copyWith(),
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(height: 25),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            OverviewItem(
                              title: 'Duration',
                              duration: destination.duration,
                              icon: Icons.access_time_filled,
                              color: Color(0xff009BFF),
                            ),
                            OverviewItem(
                              title: 'Distance',
                              duration: destination.distance,
                              icon: Icons.location_on,
                              color: primaryColor,
                            ),
                            OverviewItem(
                              title: 'Weather',
                              duration: destination.weather,
                              icon: Icons.sunny,
                              color: Color(0xffFF9900),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: whiteTextColor,
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: _buttonBook(),
      body: (MediaQuery.of(context).orientation == Orientation.portrait)
          ? _potraitScreen()
          : _landscapeScreen(),
    );
  }
}
