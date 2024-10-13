import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:redicalstart_tasks/data/getx_btn_data.dart';
import 'package:redicalstart_tasks/widgets/getxCalculator/getx_calculator_btn.dart';
import 'package:redicalstart_tasks/widgets/getxCalculator/getx_calculator_display.dart';

class GetxCalculator extends StatefulWidget {
  const GetxCalculator({super.key});

  @override
  State<GetxCalculator> createState() => _GetxCalculatorState();
}

class _GetxCalculatorState extends State<GetxCalculator> {
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetX Calculator'),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        foregroundColor: Colors.white,
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        return SafeArea(
          child: Column(
            children: [
              GetxCalculatorDisplay(),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: GridView.builder(
                  reverse: true,
                  shrinkWrap: true,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  itemCount: buttonData.length,
                  itemBuilder: (context, index) => GetxCalculatorBtn(
                    item: buttonData[index],
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 1,
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
