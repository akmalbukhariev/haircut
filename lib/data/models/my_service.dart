
import 'dart:ui';

class MyService{
  final Color color;
  final String text;
  final String price;
  bool isChecked;

  MyService({required this.color, required this.text, this.price = "", this.isChecked = false});
}