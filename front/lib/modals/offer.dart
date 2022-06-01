

class Offer{
  String title;
  String category;
  String disponibility;
  String description;
  String price;
  String username;

 Offer({
    required this.title,
    required this.category,
    required this.disponibility,
   required this.description,
    required this.price,
   required this.username
      }
      );
  factory Offer.fromJson(Map<String, dynamic> json) {
    return Offer(
      category: json['category'],
      disponibility: json['disponibility'],
      description: json['description'],
      price: json['price'],
      title: json['category']['title'],
        username: json['user']['username']
    );
  }
}