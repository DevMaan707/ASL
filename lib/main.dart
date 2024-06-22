import 'package:aslcom/pages/Splash.dart';
import 'package:aslcom/utils/Themes/CustomTheme.dart';
import  'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const ASLCom());
}

class ASLCom extends StatelessWidget {
  const ASLCom({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Berserk Devs',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      supportedLocales: const [Locale('en', '')],
      theme: CustomTheme.darkTheme(context),
      darkTheme: CustomTheme.darkTheme(context),
      home: const Splash(),
    );
  }
}
