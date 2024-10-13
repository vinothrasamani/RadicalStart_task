import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.btnName,
    required this.imgName,
    required this.nextPage,
  });

  final String btnName;
  final String imgName;
  final Widget nextPage;

  @override
  Widget build(BuildContext context) {
    Color fontColor = Colors.white;

    void onClick() {
      Navigator.push(context, MaterialPageRoute(builder: (ctx) => nextPage));
    }

    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 8,
      ),
      width: double.infinity,
      child: FilledButton.icon(
          onPressed: onClick,
          style: FilledButton.styleFrom(
              padding: const EdgeInsets.all(15),
              backgroundColor: const Color.fromARGB(255, 66, 12, 111)),
          label: Text(
            btnName,
            style: TextStyle(
              color: fontColor,
              fontSize: 18,
            ),
          ),
          icon: const Icon(Icons.arrow_circle_right_outlined)),
    );
  }
}
