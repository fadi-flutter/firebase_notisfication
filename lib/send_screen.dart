import 'package:flutter/material.dart';

class SendScreen extends StatelessWidget {
  const SendScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Send Message'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const TextField(),
          const TextField(),
          const TextField(),
          const SizedBox(height: 20),
          ElevatedButton(onPressed: () {}, child: const Text('Send Message'))
        ],
      ),
    );
  }
}
