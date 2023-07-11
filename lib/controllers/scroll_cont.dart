import 'package:flutter/material.dart';

class Cont extends ChangeNotifier {
  final ScrollController _controller = ScrollController();
  ScrollController get controller => _controller;
  void scrollTo() async{
    await _controller.animateTo(
      1200.0,
      duration: const Duration(seconds: 2),
      curve: Curves.fastOutSlowIn,
    );
    notifyListeners();
  }
}