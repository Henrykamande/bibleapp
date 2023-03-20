// To parse this JSON data, do
//
//     final bibleOb = bibleObFromJson(jsonString);

import 'dart:convert';

BibleOb bibleObFromJson(String str) => BibleOb.fromJson(json.decode(str));

String bibleObToJson(BibleOb data) => json.encode(data.toJson());

class BibleOb {
    BibleOb({
        required this.packageName,
        required this.bibleName,
        required this.category,
        required this.imageLink,

    });

    String packageName;
    String bibleName;
    String category;
    String imageLink;

    factory BibleOb.fromJson(Map<String, dynamic> json) => BibleOb(
        packageName: json["packageName"],
        bibleName: json["bibleName"],
        category: json["category"],
        imageLink: json["imageLink"]
    );

    Map<String, dynamic> toJson() => {
        "packageName": packageName,
        "bibleName": bibleName,
        "category": category,
        "imageLink": imageLink,
    };
}
