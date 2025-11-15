import 'package:flutter/material.dart';

class ThirdScreen extends StatelessWidget {
  final String? message;
  const ThirdScreen({this.message, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 8,
          children: [
            Text("This is the Third Screen"),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Back to Home"),
            ),
            Text('Message: $message'),
          ],
        ),
      ),
    );
  }
}
