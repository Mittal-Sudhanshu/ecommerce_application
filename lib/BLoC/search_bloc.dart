import 'package:rxdart/rxdart.dart';

class SearchBloc {
  final _searchText = BehaviorSubject<String>();

  //Getters

  Stream<String> get searchText => _searchText.stream;

  //Setters

  Function(String) get changeSearchText => _searchText.sink.add;

  search() async {
    print(_searchText.valueOrNull);
  }

  void dispose() {
    _searchText.close();
  }
}
