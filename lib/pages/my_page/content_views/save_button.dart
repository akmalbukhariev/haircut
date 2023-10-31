
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget saveButton({required double w, Color col = Colors.red}) {
  return SizedBox(
    width: w,
    child: ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
          backgroundColor: col,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          )
      ),
      child: const Text("Saqlash"),
    ),
  );
}