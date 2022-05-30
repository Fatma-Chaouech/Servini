class Category{
  String title;
  //photo?
Category({
    required this.title
});
  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      title: json['title'],
    );
  }

}