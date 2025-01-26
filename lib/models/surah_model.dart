import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

SurahModel alFatiha = SurahModel(
    id: 1,
    name: "الفاتحة",
    transliteration: "Al-Fatihah",
    translation: "The Opener",
    type: "meccan",
    totalVerses: 7
);

class SurahModel {
  late int id;
  late String name;
  late String translation;
  late String transliteration;
  late String type;
  late int totalVerses;

  SurahModel({
        required this.id,
        required this.translation,
        required this.name,
        required this.totalVerses,
        required this.transliteration,
        required this.type,
      });
  SurahModel.fromJson(Map json) {
    id = json["id"];
    name = json["name"];
    transliteration = json["transliteration"];
    type = json["type"];
    totalVerses = json["total_verses"];
    translation = json["translation"];
  }
  Map toJson() {
    Map json = {
      "id" : id,
      "transliteration" : transliteration,
      "name" : name,
      "type" : type,
      "total_verses" : totalVerses,
      "translation" : translation,
    };
    return json;
  }
  @override
  String toString() {
    return toJson().toString();
  }
}

Future<SurahModel> getLastRead() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  String? res = prefs.getString("last-read");
  if (res == null) {
    await saveLastRead(alFatiha);
    return alFatiha;
  } else {
    SurahModel surah = SurahModel.fromJson(json.decode(res));
    return surah;
  }
}

Future<void> saveLastRead(SurahModel surah) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  String data = json.encode(surah.toJson());
  await prefs.setString("last-read", data);
}
Future<List<SurahModel>> getAllSurah() async {
  String data = await rootBundle.loadString("assets/surah.json");
  List listJson = List.from(json.decode(data));
  List<SurahModel> surah =
  listJson.map((json) => SurahModel.fromJson(json)).toList();
  return surah;
}