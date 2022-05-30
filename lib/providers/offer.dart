class Offer{
  String title;
  String category;
  String disponibility;
  String description;
  String price;

 Offer({
    required this.title,
    required this.category,
    required this.disponibility,
   required this.description,
    required this.price,
      }
      );
  factory Offer.fromJson(Map<String, dynamic> json) {
    return Offer(
      category: json['category'],
      disponibility: json['disponibility'],
      description: json['description'],
      price: json['price'],
      title: json['title'],
    );
  }
}