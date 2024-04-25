import 'dart:async';
import 'package:bloctuto/counter_event.dart';

class CounterBloc {
  int _counter = 0; //Counter Variable

  //We will create a state controller which would be a stream controller (Controller de sorti d'après les explications)
  final _counterStateController = StreamController<int>(); 
  StreamSink<int> get _inCounter => _counterStateController.sink;  //(ceci est un controller privé)
  Stream<int> get counter => _counterStateController.stream;  //(ceci est un controller public)
}
