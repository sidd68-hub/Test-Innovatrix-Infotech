import 'dart:convert';

UserResponseData userResponseDataFromJson(String str) =>
    UserResponseData.fromJson(json.decode(str));

String userResponseDataToJson(UserResponseData data) =>
    json.encode(data.toJson());

class UserResponseData {
  final Data data;

  UserResponseData({
    required this.data,
  });

  factory UserResponseData.fromJson(Map<String, dynamic> json) =>
      UserResponseData(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  final Characters characters;

  Data({
    required this.characters,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        characters: Characters.fromJson(json["characters"]),
      );

  Map<String, dynamic> toJson() => {
        "characters": characters.toJson(),
      };
}

class Characters {
  final List<Result> results;

  Characters({
    required this.results,
  });

  factory Characters.fromJson(Map<String, dynamic> json) => Characters(
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Result {
  final String name;
  final String image;
  final String gender;

  Result({
    required this.name,
    required this.image,
    required this.gender,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        name: json["name"],
        image: json["image"],
        gender: json["gender"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
        "gender": gender,
      };
}
