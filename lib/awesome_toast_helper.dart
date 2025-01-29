import 'package:flutter/material.dart';

enum ToastType {
  error,
  success,
  warning,
  help,
}

abstract class AwesomeToastHelper {
  static void showHelpToast(
    BuildContext context, {
    String? title,
    String? message,
    ToastType? type,
  }) {
    Color backgroundColor;
    Color backgroundIconColor;
    IconData icon;
    ImageProvider<Object> image;
    switch (type) {
      case ToastType.error:
        backgroundColor = Colors.red;
        backgroundIconColor = Colors.red.shade400;
        icon = Icons.error;
        image = const NetworkImage(
            'https://img.freepik.com/free-vector/oops-doodle-hand-drawn-vector-typography_53876-165815.jpg?semt=ais_hybrid');
        break;
      case ToastType.warning:
        backgroundColor = Colors.yellow;
        backgroundIconColor = Colors.yellow.shade700;
        icon = Icons.warning;
        image = const NetworkImage(
            'https://img.freepik.com/free-vector/science-hazard-sign_24877-82810.jpg?semt=ais_hybrid');
        break;
      case ToastType.success:
        backgroundColor = Colors.green;
        backgroundIconColor = Colors.green.shade400;
        icon = Icons.check_circle;
        image = const NetworkImage(
            'https://img.freepik.com/free-vector/verified-ribbon-check-mark-green_78370-6057.jpg?semt=ais_hybrid');
        break;
      case ToastType.help:
        backgroundColor = Colors.blue;
        backgroundIconColor = Colors.blue.shade700;
        icon = Icons.help;
        image = const NetworkImage(
            'https://img.freepik.com/free-vector/illustration-helping-hands-support-icons_53876-6154.jpg?semt=ais_hybrid');
        break;
      default:
        backgroundColor = Colors.white;
        backgroundIconColor = Colors.white;
        icon = Icons.clear;
        image = const NetworkImage(
            'https://img.freepik.com/free-vector/illustration-helping-hands-support-icons_53876-6154.jpg?semt=ais_hybrid');
        break;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.fixed,
        backgroundColor: Colors.transparent,
        dismissDirection: DismissDirection.horizontal,
        elevation: 0,
        duration: const Duration(seconds: 2),
        content: Stack(
          alignment: AlignmentDirectional.topEnd,
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: const EdgeInsets.all(25),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: backgroundColor,
                image: DecorationImage(
                  image: image,
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    backgroundColor,
                    BlendMode.modulate,
                  ),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title ?? '',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    message ?? '',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: -10,
              bottom: 74,
              child: CustomPaint(
                size: const Size(40, 40),
                painter: ToastBubblePainter(color: backgroundIconColor),
              ),
            ),
            Positioned(
              left: -2,
              bottom: 83,
              child: Icon(icon, color: Colors.white),
            ),
            IconButton(
              onPressed: () =>
                  ScaffoldMessenger.of(context).hideCurrentSnackBar(),
              icon: const Icon(Icons.clear, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

class ToastBubblePainter extends CustomPainter {
  final Color color;

  ToastBubblePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()..color = color;
    final Offset center = Offset(size.width / 2, size.height / 2);
    canvas.drawCircle(center, size.width / 2, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
