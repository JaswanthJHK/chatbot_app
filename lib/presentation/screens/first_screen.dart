import 'package:ai_chatbot/presentation/screens/chat_screen.dart';
import 'package:ai_chatbot/presentation/widgets/custome_appbar.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key, required this.apiKey});

  final linearColor = const LinearGradient(
    colors: [Colors.blueAccent, Colors.redAccent],
  );
  final String? apiKey;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ShaderMask(
                shaderCallback: (bounds) {
                  return linearColor.createShader(
                    Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                  );
                },
                child: const Text(
                  "Good Evenin",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ),
              // ElevatedButton(
              //     onPressed: () {
              //       Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //           builder: (context) =>
              //               ChatScreen(apiKey: apiKey, title: "Chatbot"),
              //         ),
              //       );
              //     },
              //     child: const Text("start"))
            ],
          ),
        ),
      ),
    );
  }
}
