import 'dart:convert';

class AppFormData {
    final Data? data;
    final List<List<String>>? files;

    AppFormData({
        this.data,
        this.files,
    });

    AppFormData copyWith({
        Data? data,
        List<List<String>>? files,
    }) => 
        AppFormData(
            data: data ?? this.data,
            files: files ?? this.files,
        );

    factory AppFormData.fromRawJson(String str) => AppFormData.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AppFormData.fromJson(Map<String, dynamic> json) => AppFormData(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        files: json["files"] == null ? [] : List<List<String>>.from(json["files"]!.map((x) => List<String>.from(x.map((x) => x)))),
    );

    Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "files": files == null ? [] : List<dynamic>.from(files!.map((x) => List<dynamic>.from(x.map((x) => x)))),
    };
}

class Data {
    final String? nameStr;
    final String? nameBool;
    final String? nameInt;

    Data({
        this.nameStr,
        this.nameBool,
        this.nameInt,
    });

    Data copyWith({
        String? nameStr,
        String? nameBool,
        String? nameInt,
    }) => 
        Data(
            nameStr: nameStr ?? this.nameStr,
            nameBool: nameBool ?? this.nameBool,
            nameInt: nameInt ?? this.nameInt,
        );

    factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        nameStr: json["nameStr"],
        nameBool: json["nameBool"],
        nameInt: json["nameInt"],
    );

    Map<String, dynamic> toJson() => {
        "nameStr": nameStr,
        "nameBool": nameBool,
        "nameInt": nameInt,
    };
}
