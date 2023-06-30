import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:nontonin_app/app/data/interface/base_item_model.dart';

class PeopleModel extends IBaseItemModel {
  bool? adult;
  int? gender;
  int? id;
  // List<KnownFor>? knownFor;
  String? knownForDepartment;
  String? name;
  double? popularity;
  String? profilePath;

  PeopleModel(
      {this.adult,
      this.gender,
      this.id,
      // this.knownFor,
      this.knownForDepartment,
      this.name,
      this.popularity,
      this.profilePath});

  PeopleModel.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    gender = json['gender'];
    id = json['id'];
    // if (json['known_for'] != null) {
    //   knownFor = <KnownFor>[];
    //   json['known_for'].forEach((v) {
    //     knownFor!.add(new KnownFor.fromJson(v));
    //   });
    // }
    knownForDepartment = json['known_for_department'];
    name = json['name'];
    popularity = json['popularity'];
    profilePath = json['profile_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['adult'] = adult;
    data['gender'] = gender;
    data['id'] = id;
    // if (knownFor != null) {
    //   data['known_for'] = knownFor!.map((v) => v.toJson()).toList();
    // }
    data['known_for_department'] = knownForDepartment;
    data['name'] = name;
    data['popularity'] = popularity;
    data['profile_path'] = profilePath;
    return data;
  }

  @override
  String? getDate() {
    return 'Popularitas: $popularity orang';
  }

  @override
  String? getName() {
    return name;
  }

  @override
  String? getPosterUrl() {
    return '${dotenv.env["ASSET_BASE_URL"]}/${profilePath ?? ''}';
  }

  @override
  num? getRating() {
    return null;
  }
}

class KnownFor {
  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  String? mediaType;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;
  String? firstAirDate;
  String? name;
  List<String>? originCountry;
  String? originalName;

  KnownFor(
      {this.adult,
      this.backdropPath,
      this.genreIds,
      this.id,
      this.mediaType,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.posterPath,
      this.releaseDate,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount,
      this.firstAirDate,
      this.name,
      this.originCountry,
      this.originalName});

  KnownFor.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    genreIds = json['genre_ids'].cast<int>();
    id = json['id'];
    mediaType = json['media_type'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
    firstAirDate = json['first_air_date'];
    name = json['name'];
    originCountry = json['origin_country'].cast<String>();
    originalName = json['original_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['adult'] = adult;
    data['backdrop_path'] = backdropPath;
    data['genre_ids'] = genreIds;
    data['id'] = id;
    data['media_type'] = mediaType;
    data['original_language'] = originalLanguage;
    data['original_title'] = originalTitle;
    data['overview'] = overview;
    data['poster_path'] = posterPath;
    data['release_date'] = releaseDate;
    data['title'] = title;
    data['video'] = video;
    data['vote_average'] = voteAverage;
    data['vote_count'] = voteCount;
    data['first_air_date'] = firstAirDate;
    data['name'] = name;
    data['origin_country'] = originCountry;
    data['original_name'] = originalName;
    return data;
  }
}
