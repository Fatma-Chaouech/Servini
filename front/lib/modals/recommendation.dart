class Recommendation{
  String giver;
  String receiver;
  double rating;
  //photo?
  Recommendation({
    required this.giver,
    required this.receiver,
    required this.rating
  });
  factory Recommendation.fromJson(Map<String, dynamic> json) {
    return Recommendation(
        giver: json['giver'],
        receiver: json['receiver'],
        rating: json['rating']
    );
  }

}