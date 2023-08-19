// ignore_for_file: public_member_api_docs, sort_constructors_first
class GameRatingModel {
  String username;
  int rating;
  String comment;
  DateTime timeStamp;
  GameRatingModel({
    required this.username,
    required this.rating,
    required this.comment,
    required this.timeStamp
  });

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'rating': rating,
      'comment': comment,
      'timeStamp': timeStamp.toIso8601String(), 
    };
  }

  factory GameRatingModel.fromJson(Map<String, dynamic> json) {
    return GameRatingModel(
      username: json['username'],
      rating: json['rating'],
      comment: json['comment'],
      timeStamp: DateTime.parse(json['timeStamp']), 
    );
  }
}
