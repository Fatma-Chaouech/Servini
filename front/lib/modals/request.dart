class Request{
  String title;
  String category;
  String disponibility;
  String description;
  String price;
  String username;

  Request({
    required this.title,
    required this.category,
    required this.disponibility,
    required this.description,
    required this.price,
    required this.username
  }
      );
  factory Request.fromJson(Map<String, dynamic> json) {
    return Request(
      category: json['category'],
      disponibility: json['disponibility'],
      description: json['description'],
      price: json['price'],
      title: json['title'],
      username: json['username']
    );
  }
}