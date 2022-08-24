import 'package:flutter/material.dart';
import 'package:travel_app_dicoding/model/destination_model.dart';
import 'package:travel_app_dicoding/model/transaction_model.dart';
import 'package:travel_app_dicoding/theme.dart';
import 'package:travel_app_dicoding/ui/pages/booking_details_page.dart';
import 'package:travel_app_dicoding/ui/widgets/button.dart';

class AddTraveler extends StatefulWidget {
  final DestinationModel destination;
  const AddTraveler(this.destination, {Key? key}) : super(key: key);

  @override
  State<AddTraveler> createState() => _AddTravelerState();
}

class _AddTravelerState extends State<AddTraveler> {
  int _amount = 1;

  void _addAmount() {
    setState(() {
      _amount++;

      if (_amount > 10) {
        _amount = 10;
      }
      print(_amount);
    });
  }

  void _minusAmount() {
    setState(() {
      _amount--;

      if (_amount == 0) {
        _amount = 1;
      }

      print(_amount);
    });
  }

  void _continueBook() {
    int price = widget.destination.price * _amount;
    int total = price + (price * 0.25).toInt();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => BookingDetails(
                  TransactionModel(
                    destination: widget.destination,
                    amountTraveler: _amount,
                    insurance: true,
                    refundable: false,
                    taxfee: 25,
                    price: price,
                    total: total,
                  ),
                )));
  }

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget _appBar() {
      return AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Image.asset(
            'assets/icon_arrow_left.png',
            width: 27,
            height: 26,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Add Traveler',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            )),
      );
    }

    Widget _buttonBooking() {
      return Container(
        margin: EdgeInsets.only(
          // top: 464,
          bottom: 30,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / 11,
        ),
        height: 60,
        child: CustomButton(
            onPressed: _continueBook, radius: 15, title: 'Continue to Booking'),
      );
    }

    Widget _potraitScreen() {
      return SafeArea(
        child: Container(
          margin: EdgeInsets.only(
              top: 38,
              left: MediaQuery.of(context).size.width / 11,
              right: MediaQuery.of(context).size.width / 11,
              bottom: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                // height: 86,
                margin: EdgeInsets.only(bottom: 23),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 13),
                child: Row(
                  children: [
                    Container(
                      width: 66,
                      height: 66,
                      margin: EdgeInsets.only(right: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13),
                        image: DecorationImage(
                            image: AssetImage(
                              widget.destination.img_url,
                            ),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 7),
                          Text(
                            widget.destination.title,
                            style: blackTextStyle.copyWith(fontWeight: medium),
                          ),
                          SizedBox(height: 3),
                          Text(
                            widget.destination.location,
                            style: greyTextStyle.copyWith(
                                fontSize: 12, fontWeight: light),
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
                          margin: EdgeInsets.only(right: 2),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/icon_star.png'),
                            ),
                          ),
                        ),
                        Text(
                          widget.destination.rate.toString(),
                          style: greyTextStyle.copyWith(
                            fontSize: 15,
                            fontWeight: medium,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 13),
                decoration: BoxDecoration(
                  color: whiteTextColor,
                  borderRadius: BorderRadius.circular(13),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Traveler Amount', style: greyTextStyle),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                print('minus amount traveler');
                                _minusAmount();
                              },
                              child: Container(
                                width: 16,
                                height: 16,
                                margin: EdgeInsets.only(right: 7),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('assets/icon_minus.png'),
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              _amount.toString(),
                              style:
                                  blackTextStyle.copyWith(fontWeight: medium),
                            ),
                            GestureDetector(
                              onTap: () {
                                print('add amount traveler');
                                _addAmount();
                              },
                              child: Container(
                                width: 16,
                                height: 16,
                                margin: EdgeInsets.only(left: 7),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('assets/icon_plus.png'),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(vertical: 25),
                      child: Divider(
                        color: greyTextColor.withOpacity(0.5),
                        height: 1,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Subtotal', style: greyTextStyle),
                        Text(
                          '\$${widget.destination.price * _amount}',
                          style: blackTextStyle.copyWith(fontWeight: medium),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget _landscapeScreen() {
      return SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(
                top: 38,
                left: MediaQuery.of(context).size.width / 11,
                right: MediaQuery.of(context).size.width / 11,
                bottom: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  // height: 86,
                  margin: EdgeInsets.only(bottom: 23),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 13),
                  child: Row(
                    children: [
                      Container(
                        width: 66,
                        height: 66,
                        margin: EdgeInsets.only(right: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          image: DecorationImage(
                              image: AssetImage(
                                widget.destination.img_url,
                              ),
                              fit: BoxFit.cover),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 7),
                            Text(
                              widget.destination.title,
                              style:
                                  blackTextStyle.copyWith(fontWeight: medium),
                            ),
                            SizedBox(height: 3),
                            Text(
                              widget.destination.location,
                              style: greyTextStyle.copyWith(
                                  fontSize: 12, fontWeight: light),
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
                            margin: EdgeInsets.only(right: 2),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/icon_star.png'),
                              ),
                            ),
                          ),
                          Text(
                            widget.destination.rate.toString(),
                            style: greyTextStyle.copyWith(
                              fontSize: 15,
                              fontWeight: medium,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 13),
                  decoration: BoxDecoration(
                    color: whiteTextColor,
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Traveler Amount', style: greyTextStyle),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  print('minus amount traveler');
                                  _minusAmount();
                                },
                                child: Container(
                                  width: 16,
                                  height: 16,
                                  margin: EdgeInsets.only(right: 7),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image:
                                          AssetImage('assets/icon_minus.png'),
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                _amount.toString(),
                                style:
                                    blackTextStyle.copyWith(fontWeight: medium),
                              ),
                              GestureDetector(
                                onTap: () {
                                  print('add amount traveler');
                                  _addAmount();
                                },
                                child: Container(
                                  width: 16,
                                  height: 16,
                                  margin: EdgeInsets.only(left: 7),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage('assets/icon_plus.png'),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(vertical: 25),
                        child: Divider(
                          color: greyTextColor.withOpacity(0.5),
                          height: 1,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Subtotal', style: greyTextStyle),
                          Text(
                            '\$${widget.destination.price * _amount}',
                            style: blackTextStyle.copyWith(fontWeight: medium),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: _appBar(),
      bottomNavigationBar: _buttonBooking(),
      body: (MediaQuery.of(context).orientation == Orientation.portrait)
          ? _potraitScreen()
          : _landscapeScreen(),
    );
  }
}
