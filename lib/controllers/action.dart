import 'dart:convert';
import 'package:http/http.dart' as http;

class ActionX {
  Future<List<String>> getAction(String text) async {
    List<String> defaults = ["how-are-you", "good-morning"];
    print("Hello!");
    try {
      var res = await http.post(
        Uri.parse("http://34.226.148.89:3000/action"),
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
        // Split the response by the delimiter '-'
        List<String> resp = text1.split("-");

        // Ensure the phrases in the defaults list are not altered
        List<String> result = [];
        String currentPhrase = '';

        for (var phrase in resp) {
          currentPhrase = currentPhrase.isEmpty ? phrase : '$currentPhrase-$phrase';

          if (defaults.contains(currentPhrase)) {
            result.add(currentPhrase);
            currentPhrase = '';
          } else if (!defaults.any((defaultPhrase) => defaultPhrase.startsWith(currentPhrase))) {
            result.add(phrase);
            currentPhrase = '';
          }
        }
        if (currentPhrase.isNotEmpty) {
          result.add(currentPhrase);
        }
        List<String> x = [];
        for (var i in result){
          x.add("assets/videos/"+i.trim()+".mp4");
    }

        return x;
      }
    } catch (error) {
      print("ERROR *********************************************************$error");
      return [];
    }
  }
}
