// To parse this JSON data, do
//
//     final trendingsResponse = trendingsResponseFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

TrendingsResponse trendingsResponseFromJson(String str) => TrendingsResponse.fromJson(json.decode(str));

String trendingsResponseToJson(TrendingsResponse data) => json.encode(data.toJson());

class TrendingsResponse {
    TrendingsResponse({
        required this.page,
        required this.results,
        required this.totalPages,
        required this.totalResults,
    });

    final int page;
    final List<Result> results;
    final int totalPages;
    final int totalResults;

    factory TrendingsResponse.fromJson(Map<String, dynamic> json) => TrendingsResponse(
        page: json["page"],
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
    );

    Map<String, dynamic> toJson() => {
        "page": page,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
    };
}

class Result {
    Result({
        required this.backdropPath,
        required this.id,
        required this.title,
        required this.overview,
        required this.posterPath,
        required this.genreIds,
        required this.releaseDate,
        required this.video,
        required this.voteAverage,
        required this.voteCount,
    });

    final String backdropPath;
    final int id;
    final String title;
    final String overview;
    final String posterPath;
    final List<int> genreIds;
    final DateTime releaseDate;
    final bool video;
    final double voteAverage;
    final int voteCount;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        backdropPath: json["backdrop_path"],
        id: json["id"],
        title: json["title"],
        overview: json["overview"],
        posterPath: json["poster_path"],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        releaseDate: DateTime.parse(json["release_date"]),
        video: json["video"],
        voteAverage: json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
    );

    Map<String, dynamic> toJson() => {
        "backdrop_path": backdropPath,
        "id": id,
        "title": title,
        "overview": overview,
        "poster_path": posterPath,
        "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
        "release_date": "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
    };
}

enum MediaType { MOVIE }

final mediaTypeValues = EnumValues({
    "movie": MediaType.MOVIE
});



class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
