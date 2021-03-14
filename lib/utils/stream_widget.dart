
import 'dart:async';

import 'package:flutter/material.dart';

class StreamWidget {
  final StreamController<Widget> _streamController = StreamController();

  Stream<Widget> get outWidget => _streamController.stream;
  Sink<Widget> get inpWidget => _streamController.sink;

  void close(){
    _streamController.close();
  }
}