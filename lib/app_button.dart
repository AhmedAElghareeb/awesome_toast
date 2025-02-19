import 'package:flutter/material.dart';

enum Type {
  error,
  success,
  warning,
  help,
}

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    this.onPressed,
    this.buttonTitle,
    this.buttonTextColor,
    required this.type,
  });

  final VoidCallback? onPressed;
  final String? buttonTitle;
  final Color? buttonTextColor;
  final Type type;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        backgroundColor: (type == Type.error)
            ? Colors.red
            : (type == Type.success)
                ? Colors.green
                : (type == Type.warning)
                    ? Colors.yellow
                    : (type == Type.help)
                        ? Colors.blue
                        : Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        minimumSize: const Size(double.infinity, 50),
        animationDuration: const Duration(milliseconds: 500),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Text(
        (type == Type.error)
            ? 'Show Error'
            : (type == Type.success)
                ? 'Show Success'
                : (type == Type.warning)
                    ? 'Show Warning'
                    : (type == Type.help)
                        ? 'Show Help'
                        : '',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: buttonTextColor ?? Colors.white,
        ),
      ),
    );
  }
}
