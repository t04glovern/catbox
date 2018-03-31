import 'dart:convert';
import 'package:meta/meta.dart';

class Cat {
  Cat({
    @required this.avatar,
    @required this.name,
    @required this.email,
    @required this.location,
  });

  final String avatar;
  final String name;
  final String email;
  final String location;

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
      email: map['fields']['description']['stringValue'],
      location: map['fields']['age']['integerValue'],
    );
  }

  static String _capitalize(String input) {
    return input.substring(0, 1).toUpperCase() + input.substring(1);
  }
}
