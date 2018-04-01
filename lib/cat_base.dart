import 'package:cloud_firestore/cloud_firestore.dart';

void test() async {
  final base = new CatBase();
  final cats = await base.getAllCats();
  cats.forEach((cat) {
    print(cat);
  });
}

class CatBase {
  getAllCats() async {
    final documentList = await Firestore.instance.collection('cats').getDocuments();
    return documentList.documents.map((cat) => cat.data);
  }
}
