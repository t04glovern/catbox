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
        .decode(json)['results']
        .map((obj) => Cat.fromMap(obj))
        .toList();
  }

  static Cat fromMap(Map map) {
    var name = map['name'];

    return new Cat(
      avatar: map['picture']['large'],
      name: '${_capitalize(name['first'])} ${_capitalize(name['last'])}',
      email: map['email'],
      location: _capitalize(map['location']['state']),
    );
  }

  static String _capitalize(String input) {
    return input.substring(0, 1).toUpperCase() + input.substring(1);
  }
}
