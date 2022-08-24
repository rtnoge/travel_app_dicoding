class DestinationModel {
  String id, title, img_url, location, desc, area, duration, distance, weather;

  int price;
  double rate;

  DestinationModel({
    required this.id,
    this.title = '',
    this.img_url = '',
    this.location = '',
    this.desc = '',
    this.price = 0,
    this.area = '',
    this.rate = 0.0,
    this.duration = '',
    this.distance = '',
    this.weather = '',
  });
}
