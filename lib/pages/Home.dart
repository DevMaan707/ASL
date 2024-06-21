import 'package:aslcom/pages/VideoPlayer.dart';
import 'package:aslcom/utils/customs/MySIzes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  String wordsSpoken = "";
  String indicator = "keyboard_voice_rounded";
  TextEditingController textController = TextEditingController();
  @override
  void initState() {
    super.initState();
    initSpeech();
  }

  void initSpeech() async {
    _speechEnabled = await _speechToText.initialize();
    setState(() {});
  }

  void _startListening() async {
    await _speechToText.listen(onResult: _onSpeechResult);
  }

  void _onSpeechResult(result) {
    setState(() {
      wordsSpoken = "${result.recognizedWords}";
      textController.text = wordsSpoken;
      print(wordsSpoken);
    });
  }

  void _stopListening() async {
    await _speechToText.stop();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              child: Column(
                children: [
                  Container(
                    width: screenWidth,
                    height: screenHeight * 0.85,
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                    ),
                    child: const VideoPlayerWidget(anim:["assets/videos/idle.mp4"]),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: screenWidth * 0.7,
                        child: TextFormField(
                          controller: textController,
                          decoration: InputDecoration(
                            hintText: "Edit the text..",
                            prefixIcon: Icon(
                              CupertinoIcons.volume_down,
                              size: MySizes(context).standardPadding,
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          _speechToText.isListening ? _stopListening : _startListening;
                        },
                        icon: Icon(
                            _speechToText.isListening ? Icons.stop : Icons.mic
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.only(top:40),
                child: (indicator == "keyboard_voice_rounded")
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            indicator = "keyboard_voice_rounded";
                          });
                        },
                        icon: const Icon(Icons.keyboard_voice_rounded))
                    : IconButton(onPressed: () {
                      setState(() {
                        indicator = "";
                      });
                }, icon: const Icon(Icons.camera),),
              ),
            )
          ],
        ),
      ),
    );
  }
}
