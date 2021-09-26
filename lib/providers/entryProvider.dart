import 'package:flutter/material.dart';
import 'package:flutterapp/models/dataentry.dart';

class EntryPro with ChangeNotifier {
  List<Entry> _allEntries = [];

  void setAllEntries(List<Entry> l) {
    _allEntries = List.from(l);
  }

  set addEntry(Entry e) {
    _allEntries.add(e);
    notifyListeners();
  }

  set delEntry(String id) {
    _allEntries.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  List<Entry> get getEntries {
    return List.from(_allEntries);
  }
}
