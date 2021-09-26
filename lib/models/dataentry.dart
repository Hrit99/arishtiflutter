import 'package:flutter/material.dart';

class Entry {
  String id;
  String name;
  String contact;
  String address;
  Entry({
    @required this.address,
    @required this.contact,
    @required this.name,
    @required this.id,
  });
}
