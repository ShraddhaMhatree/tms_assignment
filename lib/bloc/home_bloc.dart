import 'dart:async';
import 'package:tms_assignment/models/PetsResponse.dart';
import 'package:tms_assignment/repository/pets_repository.dart';

class HomeBloc {
  final _repo = PetsRepository();
  final _controller = StreamController<List<Pets>>.broadcast();

  get breweryList => _controller.stream;

  HomeBloc() {
    getList();
  }

  getList() async {
    List<Pets> list = List();
    list = await _repo.getListFromServer();
    _controller.sink.add(list);

  }

  dispose() {
    _controller.close();
  }
}
