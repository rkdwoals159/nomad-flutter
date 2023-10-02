class WebtoonEpisodeModel {
  final String title, rating, date, id;

  WebtoonEpisodeModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        rating = json['rating'],
        date = json['date'],
        id = json['id'];

}
