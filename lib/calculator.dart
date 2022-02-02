import 'package:flutter/material.dart';

class Calculator {
  List<String> a = []; //list of array

  final RegExp regExp = RegExp(
      "[+\\-x÷]"); //regular expression for checking if string contains any of the operator

  void add(String added) {
    if (a.isEmpty) {
      //this if statement check if the list of array ids empty
      if (!regExp.hasMatch(added)) {
//this if statement also check if the value added to the list is not any of the regularExpression
        a.add(added);
        // this statement append the value to the list
      }
    } else if (regExp.hasMatch(a.last)) {
      if (!RegExp("[+\\-x÷.]").hasMatch(added)) {
        a.add(added);
      }
    } else {
      if (regExp.hasMatch(added)) {
        if (!RegExp(".").hasMatch(a.last)) ;
        a.add(added);
      } else {
        a.last += added;
      }
    }
  }

  String getString() {
    String str = "";
    a.forEach((String el) {
      str += el;
    });
    return str;
  }

  double getResult() {
    if (regExp.hasMatch(a.last)) a.removeLast();
    if (a.last.lastIndexOf(".") == a.last.length - 1) {
      a.last = a.last.substring(0, a.length - 1);
    }

    for (int i = 0; i < a.length; i++) {
      if (a[i] == "x") {
        a[i - 1] = "${double.parse(a[i - 1]) * double.parse(a[i + 1])}";
        a.removeAt(i);
        a.removeAt(i);
        i--;
      } else if (a[i] == "÷") {
        if (double.parse(a[i + 1]) == 0) {
          throw DivideByZeroException();
        }
        a[i - 1] = "${double.parse(a[i - 1]) / double.parse(a[i + 1])}";
        a.removeAt(i);
        a.removeAt(i);
        i--;
      }
    }
    for (int i = 0; i < a.length; i++) {
      if (a[i] == "+") {
        a[i - 1] = "${double.parse(a[i - 1]) + double.parse(a[i + 1])}";
        a.removeAt(i);
        a.removeAt(i);
        i--;
      } else if (a[i] == "-") {
        a[i - 1] = "${double.parse(a[i - 1]) - double.parse(a[i + 1])}";
        a.removeAt(i);
        a.removeAt(i);
        i--;
      }
    }
    if (a.length != 1) throw Error();
    return double.parse(a[0]);
  }

  void deleteOne() {
    if (a.length > 0) {
      if (a.last.length > 1) {
        a.last = a.last.substring(0, a.last.length - 1);
      } else {
        a.removeLast();
      }
    }
  }

  void deleteAll() => a = [];
}

class DivideByZeroException implements Exception {}
