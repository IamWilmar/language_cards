import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:language_cards/src/models/words_model.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  final CollectionReference wordsColletion =
      Firestore.instance.collection('words');

  Stream<QuerySnapshot> init() {
    return wordsColletion.document(uid).collection('fruits').snapshots();
  }

  List<WordsModel> _wordsListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      WordsModel word = WordsModel(
        category: doc.data['category'] ?? '',
        id: doc.data['id'] ?? '',
        url: doc.data['url'] ?? '',
        wordEn: doc.data['word_en'] ?? '',
        wordEs: doc.data['word_es'] ?? '',
      );
      print(word);
      return word;
    }).toList();
  }

  Stream<List<WordsModel>> obtenerPalabras(String id, String collection) {
    return wordsColletion
        .document(id)
        .collection(collection)
        .snapshots()
        .map(_wordsListFromSnapshot);
  }
}
