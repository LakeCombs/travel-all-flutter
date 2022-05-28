class DataModel {
  String name;
  String img;
  int price;
  int people;
  int stars;
  String description;
  String location;

  DataModel({
    required this.name,
    required this.img,
    required this.description,
    required this.location,
    required this.price,
    required this.stars,
    required this.people,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      name: json['name'],
      img: json['img'],
      price: json['price'],
      people: json['people'],
      stars: json['stars'],
      description: json['description'],
      location: json['location'],
    );
  }
}
