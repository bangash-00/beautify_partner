import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppSimpleTextField extends StatelessWidget {
  final String hintText;
  final Widget icon;
  final TextEditingController controller;
  final bool isEnabled;
  final FocusNode focusNode;
  final RxBool isFocused;

  const AppSimpleTextField({
    super.key,
    required this.hintText,
    required this.icon,
    required this.controller,
    required this.focusNode,
    required this.isFocused,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    focusNode.addListener(() => isFocused.value = focusNode.hasFocus);

    return Obx(() {
      final color = isFocused.value ? Colors.teal : Colors.grey;
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: isEnabled ? Colors.white : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: color),
        ),
        child: Row(
          children: [
            IconTheme(
              data: IconThemeData(color: color),
              child: icon,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextField(
                controller: controller,
                focusNode: focusNode,
                enabled: isEnabled,
                decoration: InputDecoration(
                  hintText: hintText,
                  border: InputBorder.none,

                ),
                style: TextStyle(
                  color: isEnabled ? Colors.teal : Colors.grey,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
