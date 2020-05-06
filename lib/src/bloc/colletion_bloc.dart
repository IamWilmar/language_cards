import 'package:rxdart/rxdart.dart';

class CollectionBloc {
  static final CollectionBloc _singleton = new CollectionBloc._internal();

  factory CollectionBloc() {
    return _singleton;
  }

  CollectionBloc._internal();

  final _collectionController  = BehaviorSubject<String>();
  final _answerAskedController = BehaviorSubject<bool>();

  Stream<String> get collectionStream => _collectionController.stream;
  Stream<bool>   get answerAskStream => _answerAskedController.stream;

  dispose(){
    _collectionController?.close();
    _answerAskedController?.close();
  }

  setCollection(String collection) {
    _collectionController.sink.add(collection);
  }

  answerAsk(bool state) {
    _answerAskedController.sink.add(state);
  }

}