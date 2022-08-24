import 'package:flutter/material.dart';
import 'package:travel_app_dicoding/model/destination_model.dart';
import 'package:travel_app_dicoding/theme.dart';
import 'package:travel_app_dicoding/ui/widgets/area_cat.dart';
import 'package:travel_app_dicoding/ui/widgets/card.dart';
import 'package:travel_app_dicoding/ui/widgets/shortcut_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _areaAll = true;
  bool _areaAmerica = false;
  bool _areaEurope = false;
  bool _areaAsia = false;
  bool _areaAustralia = false;
  bool _areaOceania = false;

  void _click(String area) {
    setState(() {
      if (area == 'America') {
        _areaAll = false;
        _areaAmerica = true;
        _areaEurope = false;
        _areaAsia = false;
        _areaAustralia = false;
        _areaOceania = false;
      } else if (area == 'Europe') {
        _areaAll = false;
        _areaAmerica = false;
        _areaEurope = !_areaEurope;
        _areaAsia = false;
        _areaAustralia = false;
        _areaOceania = false;
      } else if (area == 'Asia') {
        _areaAll = false;
        _areaAmerica = false;
        _areaEurope = false;
        _areaAsia = true;
        _areaAustralia = false;
        _areaOceania = false;
      } else if (area == 'Australia') {
        _areaAll = false;
        _areaAmerica = false;
        _areaEurope = false;
        _areaAsia = false;
        _areaAustralia = !_areaAustralia;
        _areaOceania = false;
      } else if (area == 'Oceania') {
        _areaAll = false;
        _areaAmerica = false;
        _areaEurope = false;
        _areaAsia = false;
        _areaAustralia = false;
        _areaOceania = !_areaOceania;
      } else {
        _areaAll = !_areaAll;
        _areaAmerica = false;
        _areaEurope = false;
        _areaAsia = false;
        _areaAustralia = false;
        _areaOceania = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget _header() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(left: 35, right: 35, bottom: 32),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 20,
              height: 8,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/icon_line.png'),
                ),
              ),
            ),
            Container(
              width: 27,
              height: 27,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/icon_notification_header.png'),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget _searchBar() {
      return Container(
        width: double.infinity,
        height: 50,
        padding: EdgeInsets.only(left: 25, right: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35),
          color: whiteTextColor,
        ),
        child: Center(
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration.collapsed(
                    hintText: 'Search your trip',
                    hintStyle: greyTextStyle.copyWith(fontSize: 15),
                  ),
                ),
              ),
              Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/button_search.png'),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }

    Widget _areaCat() {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: 35, right: 35, bottom: 21),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Area(
              onTap: () {
                _click('All');
              },
              areaName: 'All',
              style: _areaAll
                  ? greenTextStyle.copyWith(fontSize: 15)
                  : greyTextStyle.copyWith(fontSize: 15),
              color: _areaAll ? primaryColor : Colors.transparent,
            ),
            Area(
              onTap: () {
                _click('America');
              },
              areaName: 'America',
              style: _areaAmerica
                  ? greenTextStyle.copyWith(fontSize: 15)
                  : greyTextStyle.copyWith(fontSize: 15),
              color: _areaAmerica ? primaryColor : Colors.transparent,
            ),
            Area(
              onTap: () {
                _click('Europe');
              },
              areaName: 'Europe',
              style: _areaEurope
                  ? greenTextStyle.copyWith(fontSize: 15)
                  : greyTextStyle.copyWith(fontSize: 15),
              color: _areaEurope ? primaryColor : Colors.transparent,
            ),
            Area(
              onTap: () {
                _click('Asia');
              },
              areaName: 'Asia',
              style: _areaAsia
                  ? greenTextStyle.copyWith(fontSize: 15)
                  : greyTextStyle.copyWith(fontSize: 15),
              color: _areaAsia ? primaryColor : Colors.transparent,
            ),
            Area(
              onTap: () {
                _click('Australia');
              },
              areaName: 'Australia',
              style: _areaAustralia
                  ? greenTextStyle.copyWith(fontSize: 15)
                  : greyTextStyle.copyWith(fontSize: 15),
              color: _areaAustralia ? primaryColor : Colors.transparent,
            ),
            Area(
              onTap: () {
                _click('Oceania');
              },
              areaName: 'Oceania',
              style: _areaOceania
                  ? greenTextStyle.copyWith(fontSize: 15)
                  : greyTextStyle.copyWith(fontSize: 15),
              color: _areaOceania ? primaryColor : Colors.transparent,
            ),
          ],
        ),
      );
    }

    Widget _content() {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: 35, bottom: 30),
        child: Row(
          children: [
            CardDestination(
              DestinationModel(
                id: 'f4351bf5',
                title: 'The River Front Resort',
                img_url: 'assets/thumbnail_2.png',
                location: 'Dallas, United States',
                desc:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Eget sed amet lacus, vulputate tristique lacus. Viverra cursus ut nulla quis ultrices ullamcorper.',
                area: 'America',
                price: 145,
                rate: 4.9,
                duration: '5 Days',
                distance: '3.88 Miles',
                weather: 'Sunny',
              ),
            ),
            CardDestination(
              DestinationModel(
                id: 'ab1192ba',
                title: 'Bermudha Island',
                img_url: 'assets/thumbnail_3.png',
                location: 'Puerto Rico',
                desc:
                    'Ullamcorper consequat velit congue gravida nunc proin lectus neque amet. Lacus, nisi, mauris in vitae feugiat massa massa nisl amet.',
                area: 'Oceania',
                price: 250,
                rate: 4.2,
                duration: '3 Days',
                distance: '78.2 Miles',
                weather: 'Sunny',
              ),
            ),
            CardDestination(
              DestinationModel(
                id: 'f4351bf5',
                title: 'Island The Journey',
                img_url: 'assets/thumbnail_4.png',
                location: 'Phuket, Thailand',
                desc:
                    'Leo, eget vestibulum vitae netus sollicitudin aliquet vel massa pellentesque. Placerat id ornare ullamcorper bibendum. In in quis vulputate egestas eget urna risus suspendisse.',
                area: 'Asia',
                price: 1200,
                rate: 4.5,
                duration: '10 Days',
                distance: '8614 Miles',
                weather: 'Sunny',
              ),
            ),
          ],
        ),
      );
    }

    Widget _shortcut() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(left: 35, right: 35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Popular Categories',
              style: blackTextStyle.copyWith(
                fontSize: 17,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 18,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ShortCut(
                  title: 'Trips',
                  img: 'assets/icon_trips.png',
                ),
                ShortCut(
                  title: 'Hotel',
                  img: 'assets/icon_hotel.png',
                ),
                ShortCut(
                  title: 'Transport',
                  img: 'assets/icon_transport.png',
                ),
                ShortCut(
                  title: 'Events',
                  img: 'assets/icon_events.png',
                ),
              ],
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.only(
              top: 40,
              bottom:
                  (MediaQuery.of(context).orientation == Orientation.portrait)
                      ? MediaQuery.of(context).size.height / 6
                      : MediaQuery.of(context).size.height / 5),
          children: [
            _header(),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(left: 35, right: 35, bottom: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Where Do You\nWant Go',
                    style: blackTextStyle.copyWith(fontSize: 24),
                  ),
                  SizedBox(height: 28),
                  _searchBar(),
                ],
              ),
            ),
            _areaCat(),
            _content(),
            _shortcut(),
          ],
        ),
      ),
    );
  }
}
