import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:language_cards/src/models/examples_model.dart';
import 'package:language_cards/src/models/grammar_model.dart';
import 'package:language_cards/src/models/verbs_model.dart';
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

  List<VerbsModel> _verbsListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      VerbsModel word = VerbsModel(
        example: doc.data['example'] ?? '',
        infinitive: doc.data['infinitive'] ?? '',
        pastParticiple: doc.data['past_participle'] ?? '',
        simplePast: doc.data['simple_past'] ?? '',
        verbEs: doc.data['verb_es'] ?? '',
      );
      print(word);
      return word;
    }).toList();
  }

  GrammarModel _grammarListFromSnapshot(DocumentSnapshot snapshot) {
    GrammarModel grammar = GrammarModel(
      estructure: snapshot.data['estructure'],
      explanation: snapshot.data['explanation'],
    );
    return grammar;
  }

  ExamplesModel _exampleListFromSnapshot(DocumentSnapshot snapshot) {
    ExamplesModel examples = ExamplesModel(
      afirmacion    : snapshot.data['afirmacion'],
      interrogacion : snapshot.data['interrogacion'],
      negacion      : snapshot.data['negacion'],
    );
    return examples;
  }

  Stream<List<WordsModel>> obtenerPalabras(String id, String collection) {
    return wordsColletion
        .document(id)
        .collection(collection)
        .snapshots()
        .map(_wordsListFromSnapshot);
  }

  Stream<List<VerbsModel>> obtenerVerbos(String id, String collection) {
    return wordsColletion
        .document(id)
        .collection(collection)
        .snapshots()
        .map(_verbsListFromSnapshot);
  }

  Stream<GrammarModel> obtenerGramatica(String id, String collection) {
    return wordsColletion
        .document(id)
        .collection(collection)
        .document('grammar_rules')
        .snapshots()
        .map(_grammarListFromSnapshot);
  }

    Stream<ExamplesModel> obtenerEjemplos(String id, String collection) {
    return wordsColletion
        .document(id)
        .collection(collection)
        .document('examples')
        .snapshots()
        .map(_exampleListFromSnapshot);
  }
}
