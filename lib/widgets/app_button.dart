import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppButton extends StatelessWidget {
  final String text;
  final RxBool isLoading;
  final VoidCallback onPressed;
  final Widget? leading;
  final Widget? trailing;
  final bool fullWidth;
  final double borderRadius;

  final Color backgroundColor;
  final Color textColor;
  final Color borderColor;

  AppButton._internal({
    Key? key,
    required this.text,
    required RxBool? isLoading,
    required this.onPressed,
    required this.backgroundColor,
    required this.textColor,
    required this.borderColor,
    required this.borderRadius,
    this.leading,
    this.trailing,
    this.fullWidth = false,
  })  : isLoading = isLoading ?? false.obs,
        super(key: key);

  factory AppButton.primary({
    required String text,
    RxBool? isLoading,
    required VoidCallback onPressed,
    Widget? leading,
    Widget? trailing,
    bool fullWidth = false,
    double borderRadius = 40.0,
  }) {
    return AppButton._internal(
      text: text,
      isLoading: isLoading,
      onPressed: onPressed,
      backgroundColor: const Color(0xFF146C76),
      textColor: Colors.white,
      borderColor: Colors.transparent,
      borderRadius: borderRadius,
      leading: leading,
      trailing: trailing,
      fullWidth: fullWidth,
    );
  }

  factory AppButton.secondary({
    required String text,
    RxBool? isLoading,
    required VoidCallback onPressed,
    Widget? leading,
    Widget? trailing,
    bool fullWidth = false,
    double borderRadius = 40.0,
  }) {
    return AppButton._internal(
      text: text,
      isLoading: isLoading,
      onPressed: onPressed,
      backgroundColor: Colors.transparent,
      textColor: const Color(0xFF146C76),
      borderColor: const Color(0xFF146C76),
      borderRadius: borderRadius,
      leading: leading,
      trailing: trailing,
      fullWidth: fullWidth,
    );
  }

  factory AppButton.destructive({
    required String text,
    RxBool? isLoading,
    required VoidCallback onPressed,
    Widget? leading,
    Widget? trailing,
    bool fullWidth = false,
    double borderRadius = 40.0,
  }) {
    return AppButton._internal(
      text: text,
      isLoading: isLoading,
      onPressed: onPressed,
      backgroundColor: Colors.red.shade600,
      textColor: Colors.white,
      borderColor: Colors.transparent,
      borderRadius: borderRadius,
      leading: leading,
      trailing: trailing,
      fullWidth: fullWidth,
    );
  }

  factory AppButton.white({
    required String text,
    RxBool? isLoading,
    required VoidCallback onPressed,
    Widget? leading,
    Widget? trailing,
    bool fullWidth = false,
    double borderRadius = 40.0,
  }) {
    return AppButton._internal(
      text: text,
      isLoading: isLoading,
      onPressed: onPressed,
      backgroundColor: Colors.white,
      textColor: const Color(0xFF146C76),
      borderColor: Colors.transparent,
      borderRadius: borderRadius,
      leading: leading,
      trailing: trailing,
      fullWidth: fullWidth,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => GestureDetector(
      onTap: isLoading.value ? null : onPressed,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        width: fullWidth ? double.infinity : null,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(color: borderColor),
        ),
        child: Center(
          child: isLoading.value
              ? SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(textColor),
            ),
          )
              : Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (leading != null) ...[
                leading!,
                const SizedBox(width: 8),
              ],
              Text(
                text,
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              if (trailing != null) ...[
                const SizedBox(width: 8),
                trailing!,
              ],
            ],
          ),
        ),
      ),
    ));
  }
}
