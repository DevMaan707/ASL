import 'dart:convert';
import 'package:http/http.dart' as http;

class ActionX {
  Future<List<String>> getAction(String text) async {
    List<String> defaults = ["how-are-you", "good-morning"];
    List<String> present = [
      "hello",
      "good-morning",
      "how-are-you",
      "yes",
      "no"
    ];
    print("Hello!");

    try {
      var res = await http.post(
        Uri.parse("http://3.86.147.91:3000/action"),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({"text": text}),
      );
      print("Result => ${res.body}");

      var text1 = res.body ?? "";
      if (text1.isEmpty) {
        return [];
      } else {
        List<String> resp = text1.split("-");

        List<String> result = [];
        String currentPhrase = '';

        for (var phrase in resp) {
          if (currentPhrase.isEmpty) {
            currentPhrase = phrase;
          } else {
            currentPhrase = '$currentPhrase-$phrase';
          }

          if (defaults.contains(currentPhrase)) {
            result.add(currentPhrase);
            currentPhrase = '';
          } else if (!defaults.any(
              (defaultPhrase) => defaultPhrase.startsWith(currentPhrase))) {
            result.add(currentPhrase);
            currentPhrase = phrase;
          }
        }

        if (currentPhrase.isNotEmpty) {
          result.add(currentPhrase);
        }

        List<String> formattedResult = [];
        for (var phrase in result) {
          if (present.contains(phrase.trim())) {
            formattedResult.add(phrase);
          }
        }
        List<String> r = [];
        for (var i in formattedResult) {
          r.add("assets/videos/" + i.trim() + ".mp4");
        }

        return r;
      }
    } catch (error) {
      print("ERROR ************************************ $error");
      return [];
    }
  }
}
