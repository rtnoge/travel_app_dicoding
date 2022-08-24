import 'package:travel_app_dicoding/model/destination_model.dart';

class TransactionModel {
  DestinationModel destination;
  int amountTraveler, taxfee, price, total;
  bool insurance, refundable;

  TransactionModel({
    required this.destination,
    this.amountTraveler = 0,
    this.insurance = false,
    this.refundable = false,
    this.taxfee = 0,
    this.price = 0,
    this.total = 0,
  });
}
