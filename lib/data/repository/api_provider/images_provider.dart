import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:meeting_place_app/models/meeting_place.dart';

class ImageProvider {
  String baseUrl =
      "https://pixabay.com/api/?key=20013995-7bed7eb3ca6b91fba679e6f9a&q=hotels&image_type=photo";

  Future<List<Hits>> fetchImages() async {
    final response = await http.get(baseUrl);
    print("Images>>>>>>${response.body}");
    return parseResponse(response);
  }

  List<Hits> parseResponse(http.Response response) {
    final responseString = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return MeetingPlace.fromJson(responseString).hits;
    } else {
      throw Exception('failed to load images');
    }
  }
}
