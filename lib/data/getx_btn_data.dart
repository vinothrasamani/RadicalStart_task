import 'package:flutter/material.dart';
import 'package:redicalstart_tasks/models/calculator_btn_model.dart';

Color color1 = const Color.fromARGB(255, 229, 190, 255);
Color color2 = const Color.fromARGB(255, 173, 213, 255);
Color color3 = const Color.fromARGB(255, 255, 195, 145);

final buttonData = [
  CalculatorBtnModel(val: '0', color: color1, size: 18),
  CalculatorBtnModel(val: '00', color: color1, size: 22),
  CalculatorBtnModel(val: '.', color: color1, size: 18),
  CalculatorBtnModel(val: '=', color: color3, size: 22),
  CalculatorBtnModel(val: '3', color: color1, size: 18),
  CalculatorBtnModel(val: '2', color: color1, size: 18),
  CalculatorBtnModel(val: '1', color: color1, size: 18),
  CalculatorBtnModel(val: '÷', color: color2, size: 22),
  CalculatorBtnModel(val: '6', color: color1, size: 18),
  CalculatorBtnModel(val: '5', color: color1, size: 18),
  CalculatorBtnModel(val: '4', color: color1, size: 18),
  CalculatorBtnModel(val: '×', color: color2, size: 22),
  CalculatorBtnModel(val: '9', color: color1, size: 18),
  CalculatorBtnModel(val: '8', color: color1, size: 18),
  CalculatorBtnModel(val: '7', color: color1, size: 18),
  CalculatorBtnModel(val: '-', color: color2, size: 22),
  CalculatorBtnModel(val: 'C', color: color3, size: 18),
  CalculatorBtnModel(val: 'DEL', color: color3, size: 14),
  CalculatorBtnModel(val: '%', color: color2, size: 22),
  CalculatorBtnModel(val: '+', color: color2, size: 22),
];
