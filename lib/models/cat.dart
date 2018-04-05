import 'package:meta/meta.dart';

// TODO: Restructure, use active Firestore object?
class Cat {
  final String documentId;
  final int catId;
  final String name;
  final String description;
  final String avatar;
  final String location;
  int stars;
  final bool adopted;
  final List<String> pictures;
  final List<String> cattributes;

  Cat({
    @required this.documentId,
    @required this.catId,
    @required this.name,
    @required this.description,
    @required this.avatar,
    @required this.location,
    @required this.stars,
    @required this.adopted,
    @required this.pictures,
    @required this.cattributes,
  });
}
