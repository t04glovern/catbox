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
    @required this.cattributes,
  });

  final int id;
  final String name;
  final String description;
  final String avatar;
  final String location;
  final int stars;
  final bool adopted;
  final List<String> pictures;
  final List<String> cattributes;

  //DEPRECATED
//  static List<Cat> allFromResponse(String json) {
//    return JSON
//        .decode(json)['documents']
//        .map((obj) => Cat.fromResponseMap(obj))
//        .toList();
//  }

  static List<Cat> allFromFirebase(Iterable<Map<String, dynamic>> cats) {
    List<Cat> catList = [];
    cats.forEach((cat) {
      catList.add(Cat.fromFirebaseMap(cat));
    });
    return catList;
  }

  //DEPRECATED
//  static Cat fromResponseMap(Map map) {
//    List<String> images = [];
//
//    if(map['fields']['pictures']['arrayValue']['values'] != null) {
//      for(Map<String, dynamic> s in map['fields']['pictures']['arrayValue']['values']) {
//        images.add(s['stringValue']);
//      }
//    }
//
//    return new Cat(
//      id: int.parse(map['fields']['id']['integerValue']),
//      name: map['fields']['name']['stringValue'],
//      description: map['fields']['description']['stringValue'],
//      avatar: map['fields']['image_url']['stringValue'],
//      location: map['fields']['location']['stringValue'],
//      stars: int.parse(map['fields']['stars']['integerValue']),
//      adopted: map['fields']['adopted']['booleanValue'],
//      pictures: images,
//    );
//  }

  static Cat fromFirebaseMap(Map map) {
    List<String> images = [];
    List<String> attributes = [];

    if(map['pictures'] != null) {
      for(String s in map['pictures']) {
        images.add(s);
      }
    }

    if(map['cattributes'] != null) {
      for(String s in map['cattributes']) {
        attributes.add(s);
      }
    }

    return new Cat(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      avatar: map['image_url'],
      location: map['location'],
      stars: map['stars'],
      adopted: map['adopted'],
      pictures: images,
      cattributes: attributes,
    );
  }
}
