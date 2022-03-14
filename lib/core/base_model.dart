import 'package:flutter/material.dart';

enum ViewState { Idle, Busy }

class BaseModel extends ChangeNotifier {
  ViewState _state = ViewState.Idle;

  ViewState get state => _state;

  bool _isPageLoaded = false;

  get isPageLoaded => _isPageLoaded;

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }

  void setIsPageLoaded(bool value) {
    _isPageLoaded = value;
    notifyListeners();
  }
}
