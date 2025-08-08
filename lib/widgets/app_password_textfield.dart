import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppPasswordTextField extends StatelessWidget {
  final String hintText;
  final Widget leadingIcon;
  final TextEditingController controller;
  final bool isEnabled;
  final FocusNode focusNode;
  final RxBool isFocused;
  final RxBool isObscure;

  const AppPasswordTextField({
    Key? key,
    required this.hintText,
    required this.leadingIcon,
    required this.controller,
    required this.focusNode,
    required this.isFocused,
    required this.isObscure,
    this.isEnabled = true,
  }) : super(key: key);

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
              child: leadingIcon,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextField(
                controller: controller,
                focusNode: focusNode,
                enabled: isEnabled,
                obscureText: isObscure.value,
                obscuringCharacter: '*',
                decoration: InputDecoration(
                  hintText: hintText,
                  border: InputBorder.none,
                ),
                style: TextStyle(
                  color: isEnabled ? Colors.teal : Colors.grey,
                ),
              ),
            ),
            GestureDetector(
              onTap: () => isObscure.toggle(),
              child: Icon(
                isObscure.value ? Icons.visibility_off : Icons.visibility,
                color: color,
              ),
            ),
          ],
        ),
      );
    });
  }
}
