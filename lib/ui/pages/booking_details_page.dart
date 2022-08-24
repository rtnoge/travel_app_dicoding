// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app_dicoding/model/transaction_model.dart';
import 'package:travel_app_dicoding/theme.dart';
import 'package:travel_app_dicoding/ui/widgets/button.dart';

class BookingDetails extends StatelessWidget {
  final TransactionModel transaction;
  BookingDetails(this.transaction, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
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
        title: Text('Booking Details',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            )),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(
          bottom: 30,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / 11,
        ),
        height: 60,
        child: CustomButton(
          onPressed: () =>
              Navigator.pushReplacementNamed(context, '/booked_done'),
          title: 'Pay Now',
          radius: 15,
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Container(
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
                              image:
                                  AssetImage(transaction.destination.img_url),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 7),
                              Text(
                                transaction.destination.title,
                                style:
                                    blackTextStyle.copyWith(fontWeight: medium),
                              ),
                              SizedBox(height: 3),
                              Text(
                                transaction.destination.location,
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
                              transaction.destination.rate.toString(),
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
                            Text('Duration Time', style: greyTextStyle),
                            Text(
                              transaction.destination.duration,
                              style:
                                  blackTextStyle.copyWith(fontWeight: medium),
                            ),
                          ],
                        ),
                        SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('For', style: greyTextStyle),
                            Text(
                              "${transaction.amountTraveler.toString()} Traveler",
                              style:
                                  blackTextStyle.copyWith(fontWeight: medium),
                            ),
                          ],
                        ),
                        SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Insurance', style: greyTextStyle),
                            Text(
                              transaction.insurance ? 'YES' : 'NO',
                              style: transaction.insurance
                                  ? greenTextStyle.copyWith(fontWeight: medium)
                                  : GoogleFonts.poppins(
                                      color: Color(0xffFF4B55),
                                    ),
                            ),
                          ],
                        ),
                        SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Refundable', style: greyTextStyle),
                            Text(
                              transaction.refundable ? 'YES' : 'NO',
                              style: transaction.refundable
                                  ? greenTextStyle.copyWith(fontWeight: medium)
                                  : GoogleFonts.poppins(
                                      color: Color(0xffFF4B55),
                                    ),
                            ),
                          ],
                        ),
                        SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Tax & Fee', style: greyTextStyle),
                            Text(
                              '${transaction.taxfee.toString()}%',
                              style:
                                  blackTextStyle.copyWith(fontWeight: medium),
                            ),
                          ],
                        ),
                        SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Price', style: greyTextStyle),
                            Text(
                              '\$${transaction.price.toString()}',
                              style:
                                  blackTextStyle.copyWith(fontWeight: medium),
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
                            Row(
                              children: [
                                Text('Total',
                                    style: blackTextStyle.copyWith(
                                      fontWeight: semiBold,
                                    )),
                                SizedBox(width: 5),
                                Text(
                                  '(with tax and fee)',
                                  style: blackTextStyle.copyWith(
                                      fontSize: 10, fontWeight: medium),
                                ),
                              ],
                            ),
                            Text(
                              '\$${transaction.total}',
                              style:
                                  blackTextStyle.copyWith(fontWeight: semiBold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
