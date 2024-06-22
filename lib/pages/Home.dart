import 'package:aslcom/controllers/action.dart';
import 'package:aslcom/pages/Camera.dart';
import 'package:aslcom/pages/VideoPlayer.dart';
import 'package:aslcom/utils/customs/MySIzes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
  bool indicator = false;
  TextEditingController textController = TextEditingController();
  ActionX actionX = ActionX();
  List<String> res = [];
  ValueNotifier<List<String>> animNotifier = ValueNotifier<List<String>>(["assets/videos/idle.mp4"]); // default idle animation

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
  void _updateAnimations(List<String> animations) {
    animNotifier.value = animations;
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
  print("HOMEEE");
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        width: screenWidth*0.8,
                        height: screenHeight * 0.85,
                        decoration: const BoxDecoration(
                          color: Colors.black12,
                        ),
                        child: ValueListenableBuilder<List<String>>(
                          valueListenable: animNotifier,
                          builder: (context, anim, _) {
                            return VideoPlayerWidget(anim: anim);
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: screenWidth * 0.7,
                            child: TextFormField(
                              onEditingComplete: () async {
                                print("Calling..");
                                res = await actionX.getAction(textController.text ?? "");
                                print(res);
                                _updateAnimations(res);
                              },
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
                            onPressed: () async {
                              print("Calling..");
                              res = await actionX.getAction(textController.text ?? "");
                              print(res);
                              _updateAnimations(res);
                            },
                            icon: Icon(Icons.send),
                          ),
                          IconButton(
                            onPressed: () {
                              _speechToText.isListening ? _stopListening() : _startListening();
                            },
                            icon: Icon(_speechToText.isListening ? Icons.stop : Icons.mic),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 50.0, right: 15),
                child: PopupMenuButton<bool>(
                  padding: EdgeInsets.zero,
                  icon: Container(
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: const Icon(
                        Icons.mic,
                        color: Colors.red,
                        size: 20,
                      ),
                    ),
                  ),
                  itemBuilder: (context) {
                    return [
                      PopupMenuItem(
                        value: !indicator,
                        child: Icon(indicator ? Icons.mic : Icons.camera),
                      ),
                    ];
                  },
                  onSelected: (value) {
                    setState(() {
                      indicator = value;
                    });
                    if (indicator) {
                      Get.to(const Camera());
                    } else {
                      Get.to(const Home());
                    }
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  }

