class AyahModel {
  late int id;
  late String text;
  late String translation;

  AyahModel({
    required this.translation,
    required this.id,
    required this.text,
  });

  AyahModel.fromJson (Map json) {
    id = json["id"];
    text = json["text"];
    translation = json["translation"];
  }

  Map toJson() {
    Map json = {
      "id" : id,
      "text" : text,
      "translation" : translation,
    };
    return json;
  }
  @override
  String toString() {
    return toJson().toString();
  }
}
