import 'package:flutter/material.dart';
import 'package:untitled/app_button.dart';
import 'package:untitled/awesome_toast_helper.dart';

void main() {
  runApp(const AwesomeToast());
}

class AwesomeToast extends StatelessWidget {
  const AwesomeToast({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Awesome Toast',
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text("Flutter Awesome Toast"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 30),
            AppButton(
              type: Type.help,
              onPressed: () => AwesomeToastHelper.showHelpToast(
                context,
                title: 'Need Help?!!',
                message: 'This is a help message',
                type: ToastType.help,
              ),
            ),
            const SizedBox(height: 30),
            AppButton(
              type: Type.warning,
              onPressed: () => AwesomeToastHelper.showHelpToast(
                context,
                title: 'Warning!!!',
                message: 'This is a warning message',
                type: ToastType.warning,
              ),
            ),
            const SizedBox(height: 30),
            AppButton(
              type: Type.success,
              onPressed: () => AwesomeToastHelper.showHelpToast(
                context,
                title: 'Great Work',
                message: 'This is a success message',
                type: ToastType.success,
              ),
            ),
            const SizedBox(height: 30),
            AppButton(
              type: Type.error,
              onPressed: () => AwesomeToastHelper.showHelpToast(
                context,
                title: 'Ohhh, Sorry!!',
                message: 'This is an error message',
                type: ToastType.error,
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
