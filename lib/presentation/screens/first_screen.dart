import 'package:ai_chatbot/presentation/screens/chat_screen.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key, required this.apiKey});

  final String? apiKey;

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final linearColor = const LinearGradient(
    colors: [Colors.blueAccent, Colors.redAccent],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  ShaderMask(
                    shaderCallback: (bounds) {
                      return linearColor.createShader(
                        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                      );
                    },
                    child: const Text(
                      "Good Evening",
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(
              flex: 1,
            ),
            Container(
              width: double.infinity,
              height: 250,
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Color.fromARGB(255, 68, 68, 68),
                      offset: Offset(0, -1),
                      blurRadius: 4,
                      spreadRadius: 0.5)
                ],
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                color: Color.fromARGB(255, 12, 18, 20),
              ),
              child:  Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(15.0),
                        child: InkWell(
                          onTap: () {
                         //   Navigator.push(context, MaterialPageRoute(builder: (context) => ChatScreen(apiKey:, title: title),))
                          },
                          child: Text(
                            'Ask anything...',
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w400,
                                color: Color.fromARGB(255, 121, 121, 121)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
