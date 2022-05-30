class Offer{
  int id;
  String title;
  String createdAt;
  late String? updatedAt;
  late String? deletedAt;
  String category;
  String disponibility;
  double price;

 Offer({
    required this.id,
    required this.title,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.category,
    required this.disponibility,
    required this.price,
      }
      );
  factory Offer.fromJson(Map<String, dynamic> json) {
    return Offer(
      id: json['id'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      deletedAt: json['deletedAt'],
      category: json['category'],
      disponibility: json['disponibility'],
      price: json['price'],
      title: json['title'],
    );
  }
}