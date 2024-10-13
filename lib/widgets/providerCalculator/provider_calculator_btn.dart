import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:redicalstart_tasks/controllers/provider_calculator_controller.dart';
import 'package:redicalstart_tasks/models/calculator_btn_model.dart';

class ProviderCalculatorBtn extends StatelessWidget {
  const ProviderCalculatorBtn({
    super.key,
    required this.item,
  });
  final CalculatorBtnModel item;

  @override
  Widget build(BuildContext context) {
    final theme = MediaQuery.of(context).platformBrightness == Brightness.dark;
    final providerCalculatorController =
        Provider.of<ProviderCalculatorController>(context);
    final val = item.val;
    List ops = ['%', '+', '-', '×', '÷'];

    Color btnColor(Color color) {
      if (color == const Color.fromARGB(255, 173, 213, 255)) {
        return const Color.fromARGB(255, 71, 19, 112);
      }
      if (color == const Color.fromARGB(255, 255, 195, 145)) {
        return const Color.fromARGB(255, 7, 0, 201);
      }
      return const Color.fromARGB(255, 211, 0, 162);
    }

    return FilledButton(
      onPressed: () {
        if (val.toLowerCase() == 'c') {
          providerCalculatorController.clear();
        } else if (val == '=') {
          providerCalculatorController.evaluate();
        } else if (val.toLowerCase() == 'del') {
          providerCalculatorController.delete();
        } else if (ops.contains(val)) {
          providerCalculatorController.addOperator(val);
        } else {
          providerCalculatorController.addNumber(val);
        }
      },
      style: FilledButton.styleFrom(
        backgroundColor:
            theme ? btnColor(item.color) : item.color.withGreen(100),
      ),
      child: Text(
        item.val,
        style: TextStyle(
            fontSize: item.size, color: theme ? Colors.white : Colors.black),
      ),
    );
  }
}
