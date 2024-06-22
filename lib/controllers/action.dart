import 'dart:convert';
import 'package:http/http.dart' as http;

class ActionX {
  Future<List<String>> getAction(String text) async {
    List<String> defaults = ["how-are-you", "good-morning"];
    List<String> present = ["hello", "good-morning", "how-are-you", "yes", "no"];
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
          if (currentPhrase.isEmpty) {
            currentPhrase = phrase;
          } else {
            currentPhrase = '$currentPhrase-$phrase';
          }

          // Check if the current phrase is in defaults
          if (defaults.contains(currentPhrase)) {
            result.add(currentPhrase);
            currentPhrase = '';
          } else if (!defaults.any((defaultPhrase) =>
              defaultPhrase.startsWith(currentPhrase))) {
            // If no default phrase starts with currentPhrase, finalize currentPhrase
            result.add(currentPhrase);
            currentPhrase = phrase;
          }
        }
        // Add any remaining part
        if (currentPhrase.isNotEmpty) {
          result.add(currentPhrase);
        }

        // Filter and format the result to keep only elements present in the 'present' list
        List<String> formattedResult = [];
        for (var phrase in result) {
          if (present.contains(phrase.trim())) {
            formattedResult.add(phrase);
          }
        }
        List<String> r = [];
        for(var i in formattedResult){
          r.add("assets/videos/"+i.trim()+".mp4");
        }

        return r;
      }
    } catch (error) {
      print("ERROR ************************************ $error");
      return [];
    }
  }
}
