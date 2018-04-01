import 'dart:convert';
import 'package:meta/meta.dart';

class Cat {
  Cat({
    @required this.id,
    @required this.name,
    @required this.description,
    @required this.avatar,
    @required this.location,
    @required this.stars,
    @required this.adopted,
    @required this.pictures,
  });

  final int id;
  final String name;
  final String description;
  final String avatar;
  final String location;
  final int stars;
  final bool adopted;
  final List<String> pictures;

  static List<Cat> allFromResponse(String json) {
    return JSON
        .decode(json)['documents']
        .map((obj) => Cat.fromMap(obj))
        .toList();
  }

  static Cat fromMap(Map map) {
    List<String> images = [];

    if(map['fields']['pictures']['arrayValue']['values'] != null) {
      for(Map<String, dynamic> s in map['fields']['pictures']['arrayValue']['values']) {
        images.add(s['stringValue']);
      }
    }

    return new Cat(
      id: int.parse(map['fields']['id']['integerValue']),
      name: map['fields']['name']['stringValue'],
      description: map['fields']['description']['stringValue'],
      avatar: map['fields']['image_url']['stringValue'],
      location: map['fields']['location']['stringValue'],
      stars: int.parse(map['fields']['stars']['integerValue']),
      adopted: map['fields']['adopted']['booleanValue'],
      pictures: images,
    );
  }
}
