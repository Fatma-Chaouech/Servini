class Category{
  String title;
  String description;
  String pic;
  //photo?
Category({
    required this.title,
  required this.description,
  required this.pic
});
  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      title: json['title'],
      description: json['description'],
        pic: json['pic']
    );
  }

}