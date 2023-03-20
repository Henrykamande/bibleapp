// To parse this JSON data, do
//
//     final bibleResponse = bibleResponseFromJson(jsonString);

import 'dart:convert';

BibleResponse bibleResponseFromJson(String str) => BibleResponse.fromJson(json.decode(str));

String bibleResponseToJson(BibleResponse data) => json.encode(data.toJson());

class BibleResponse {
    BibleResponse({
        required this.resultState,
        required this.resultCode,
        required this.resultDesc,
        required this.responseData,
    });

    bool resultState;
    int resultCode;
    String resultDesc;
    List<Bible> responseData;

    factory BibleResponse.fromJson(Map<String, dynamic> json) => BibleResponse(
        resultState: json["ResultState"],
        resultCode: json["ResultCode"],
        resultDesc: json["ResultDesc"],
        responseData: List<Bible>.from(json["ResponseData"].map((x) => Bible.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "ResultState": resultState,
        "ResultCode": resultCode,
        "ResultDesc": resultDesc,
        "ResponseData": List<dynamic>.from(responseData.map((x) => x.toJson())),
    };
}

class Bible {
    Bible({
        this.id,
        required this.categoryId,
        required this.bibleName,
        required this.packageName,
         this.createdAt,
        this.updatedAt,
    });

    int? id;
    int categoryId;
    String bibleName;
    String packageName;
    DateTime? createdAt;
    DateTime? updatedAt;

    factory Bible.fromJson(Map<String, dynamic> json) => Bible(
        id: json["id"],
        categoryId: json["category_id"],
        bibleName: json["bible_name"],
        packageName: json["packageName"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "category_id": categoryId,
        "bible_name": bibleName,
        "packageName": packageName,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
    };
}
