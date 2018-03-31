import 'dart:convert';
import 'package:meta/meta.dart';

class Cat {
  Cat({
    @required this.avatar,
    @required this.name,
    @required this.location,
    @required this.description,
    @required this.age,
    @required this.stars,
  });

  final String avatar;
  final String name;
  final String location;
  final String description;
  final String age;
  final String stars;

  static List<Cat> allFromResponse(String json) {
    return JSON
        .decode(json)['documents']
        .map((obj) => Cat.fromMap(obj))
        .toList();
  }

  static Cat fromMap(Map map) {

    return new Cat(
      avatar: map['fields']['image_url']['stringValue'],
      name: '${_capitalize(map['fields']['name']['stringValue'])}',
      location: map['fields']['location']['stringValue'],
      description: map['fields']['description']['stringValue'],
      age: map['fields']['age']['integerValue'],
      stars: map['fields']['stars']['integerValue'],
    );
  }

  static String _capitalize(String input) {
    return input.substring(0, 1).toUpperCase() + input.substring(1);
  }
}
