import 'package:flutter/material.dart';

class LineTableModel {
  String name;
  dynamic value;
  MaterialColor? rowColor;

  LineTableModel({required this.name, required this.value, this.rowColor});
}
