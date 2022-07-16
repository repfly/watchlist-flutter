// To parse this JSON data, do
//
//     final movieResponse = movieResponseFromJson(jsonString);

import 'dart:convert';

MovieResponse movieResponseFromJson(String str) =>
    MovieResponse.fromJson(json.decode(str));

String movieResponseToJson(MovieResponse data) => json.encode(data.toJson());

class MovieResponse {
  MovieResponse({
    required this.title,
    required this.year,
    required this.rated,
    required this.released,
    required this.runtime,
    required this.genre,
    required this.director,
    required this.writer,
    required this.actors,
    required this.plot,
    required this.language,
    required this.country,
    required this.awards,
    required this.poster,
    required this.ratings,
    required this.metascore,
    required this.imdbRating,
    required this.imdbVotes,
    required this.imdbId,
    required this.type,
    required this.boxOffice,
    required this.production,
    required this.website,
    required this.response,
  });

  String title;
  String year;
  String rated;
  String released;
  String runtime;
  String genre;
  String director;
  String writer;
  String actors;
  String plot;
  String language;
  String country;
  String awards;
  String poster;
  List<Rating> ratings;
  String metascore;
  String imdbRating;
  String imdbVotes;
  String imdbId;
  String type;
  String boxOffice;
  String production;
  String website;
  String response;

  factory MovieResponse.fromJson(Map<String, dynamic> json) => MovieResponse(
        title: json["Title"] == null ? null : json["Title"],
        year: json["Year"] == null ? null : json["Year"],
        rated: json["Rated"] == null ? null : json["Rated"],
        released: json["Released"] == null ? null : json["Released"],
        runtime: json["Runtime"] == null ? null : json["Runtime"],
        genre: json["Genre"] == null ? null : json["Genre"],
        director: json["Director"] == null ? null : json["Director"],
        writer: json["Writer"] == null ? null : json["Writer"],
        actors: json["Actors"] == null ? null : json["Actors"],
        plot: json["Plot"] == null ? null : json["Plot"],
        language: json["Language"] == null ? null : json["Language"],
        country: json["Country"] == null ? null : json["Country"],
        awards: json["Awards"] == null ? null : json["Awards"],
        poster: json["Poster"] == null ? null : json["Poster"],
        ratings:
            List<Rating>.from(json["Ratings"].map((x) => Rating.fromJson(x))),
        metascore: json["Metascore"] == null ? null : json["Metascore"],
        imdbRating: json["imdbRating"] == null ? null : json["imdbRating"],
        imdbVotes: json["imdbVotes"] == null ? null : json["imdbVotes"],
        imdbId: json["imdbID"] == null ? null : json["imdbID"],
        type: json["Type"] == null ? null : json["Type"],
        boxOffice: json["BoxOffice"] == null ? null : json["BoxOffice"],
        production: json["Production"] == null ? null : json["Production"],
        website: json["Website"] == null ? null : json["Website"],
        response: json["Response"] == null ? null : json["Response"],
      );

  Map<String, dynamic> toJson() => {
        "Title": title == null ? null : title,
        "Year": year == null ? null : year,
        "Rated": rated == null ? null : rated,
        "Released": released == null ? null : released,
        "Runtime": runtime == null ? null : runtime,
        "Genre": genre == null ? null : genre,
        "Director": director == null ? null : director,
        "Writer": writer == null ? null : writer,
        "Actors": actors == null ? null : actors,
        "Plot": plot == null ? null : plot,
        "Language": language == null ? null : language,
        "Country": country == null ? null : country,
        "Awards": awards == null ? null : awards,
        "Poster": poster == null ? null : poster,
        "Ratings": ratings == null
            ? null
            : List<dynamic>.from(ratings.map((x) => x.toJson())),
        "Metascore": metascore == null ? null : metascore,
        "imdbRating": imdbRating == null ? null : imdbRating,
        "imdbVotes": imdbVotes == null ? null : imdbVotes,
        "imdbID": imdbId == null ? null : imdbId,
        "Type": type == null ? null : type,
        "BoxOffice": boxOffice == null ? null : boxOffice,
        "Production": production == null ? null : production,
        "Website": website == null ? null : website,
        "Response": response == null ? null : response,
      };
}

class Rating {
  Rating({
    required this.source,
    required this.value,
  });

  String source;
  String value;

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        source: json["Source"] == null ? null : json["Source"],
        value: json["Value"] == null ? null : json["Value"],
      );

  Map<String, dynamic> toJson() => {
        "Source": source == null ? null : source,
        "Value": value == null ? null : value,
      };
}
