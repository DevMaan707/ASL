import 'package:aslcom/utils/customs/MySIzes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String indicator = "keyboard_voice_rounded";
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    TextEditingController emailController = TextEditingController();
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
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: screenWidth * 0.7,
                        child: TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            hintText: "Username",
                            prefixIcon: Icon(
                              CupertinoIcons.volume_down,
                              size: MySizes(context).standardPadding,
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.keyboard_voice_rounded,
                          color: Colors.red,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: (indicator == "keyboard_voice_rounded")
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          indicator = "keyboard_voice_rounded";
                        });
                      },
                      icon: Icon(Icons.keyboard_voice_rounded))
                  : IconButton(onPressed: () {
                    setState(() {
                      indicator = "";
                    });
              }, icon: Icon(Icons.camera),),
            )
          ],
        ),
      ),
    );
  }
}
