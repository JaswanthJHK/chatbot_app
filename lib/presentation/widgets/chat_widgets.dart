import 'package:ai_chatbot/presentation/widgets/messege_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:image_picker/image_picker.dart';

class ChatWidget extends StatefulWidget {
  final String? apiKey;
  const ChatWidget({super.key, required this.apiKey});

  @override
  State<ChatWidget> createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {
  late final GenerativeModel _model;
  late final ChatSession _chat;

  final ScrollController _scrollController = ScrollController();

  bool _loading = false;

  final FocusNode _textFieldFocus = FocusNode();
  final TextEditingController _textController = TextEditingController();
  final List<({Image? image, String? text, bool fromUser})> _generatedContent =
      [];

  @override
  void initState() {
    _model = GenerativeModel(
      model: 'gemini-1.5-flash-latest',
      apiKey: widget.apiKey ?? '',
    );
    _chat = _model.startChat();
    super.initState();
  }

  void _scrollDown() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 750),
        curve: Curves.easeOutCirc,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: widget.apiKey?.isNotEmpty ?? false
                ? ListView.builder(
                    controller: _scrollController,
                    itemCount: _generatedContent.length,
                    itemBuilder: (context, index) {
                      final content = _generatedContent[index];

                      return MessageWidget(
                        text: content.text,
                        image: content.image,
                        isFromUser: content.fromUser,
                      );
                    },
                  )
                : ListView(
                    children: const [Text("Nothing found....")],
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    onSubmitted: _sendMessege,
                    autofocus: true,
                    focusNode: _textFieldFocus,
                    controller: _textController,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(15),
                      hintText: "Ask something...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 171, 222, 244),
                            width: 2,
                          )),
                    ),
                  ),
                ),
                const SizedBox.square(
                  dimension: 15,
                ),
                IconButton(
                  onPressed: () {
                    _pickImage();
                  },
                  icon: const Icon(Icons.image_outlined),
                ),
                if (!_loading)
                  IconButton(
                    onPressed: () {
                      _sendMessege(_textController.text);
                      _textController.clear();
                     
                    },
                    icon: const Icon(Icons.send_outlined),
                  )
                else
                  const CircularProgressIndicator()
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<void> _sendMessege(String messege) async {
    setState(() {
      _loading = true;
    });

    try {
      _generatedContent.add(
        (image: null, text: messege, fromUser: true),
      );

      final response = await _chat.sendMessage(
        Content.text(messege),
      );
      final text = response.text;
      _generatedContent.add(
        (image: null, text: text, fromUser: false),
      );

      if (text == null) {
        showError("No response from Gemini");
      } else {
        setState(() {
          _loading = false;
          _scrollDown();
        });
      }
    } catch (e) {
      showError(
        e.toString(),
      );
      setState(() {
        _loading = false;
      });
    } finally {
      _textController.clear();
      setState(() {
        _loading = false;
      });
      _textFieldFocus.requestFocus();
    }
  }

  Future<dynamic> showError(String messege) {
    return showDialog(
        context: context,
        builder: (context) {
          return _showErrorMessege(messege, context);
        });
  }

  AlertDialog _showErrorMessege(String messege, BuildContext context) {
    return AlertDialog(
      title: const Text("Something Went Wrong------------------"),
      content: SingleChildScrollView(
        child: SelectableText(messege),
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("Ok"))
      ],
    );
  }

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _loading = true;
      });
      try {
        final bytes = await image.readAsBytes();
        final content = [
          Content.multi(
            [
              TextPart(_textController.text),
              DataPart('image.jpeg', bytes),
            ],
          ),
        ];
        _generatedContent.add(
          (
            text: _textController.text,
            image: Image.memory(bytes),
            fromUser: true,
          ),
        );
        var response = await _model.generateContent(content);
        var text = response.text;
        _generatedContent.add(
          (image: null, text: text, fromUser: false),
        );
        if (text == null) {
          showError("No response from Geminiiiii");
        } else {
          setState(() {
            _loading = false;
            _scrollDown();
          });
        }
      } catch (e) {
        showError(
          e.toString(),
        );
        setState(() {
          _loading = false;
        });
      } finally {
        _textController.clear();
        setState(() {
          _loading = false;
        });
        _textFieldFocus.requestFocus();
      }
    }
  }
}
