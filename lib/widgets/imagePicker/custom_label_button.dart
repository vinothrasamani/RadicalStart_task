import 'package:flutter/material.dart';

class CustomLabelButton extends StatelessWidget {
  const CustomLabelButton({
    super.key,
    required this.label,
    required this.iconData,
    required this.onTap,
  });

  final void Function() onTap;
  final String label;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(
        children: [
          IconButton.filled(
            onPressed: onTap,
            padding: const EdgeInsets.all(10),
            icon: Icon(
              iconData,
              size: 30,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            label,
          ),
        ],
      ),
    );
  }
}
