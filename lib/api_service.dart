import 'dart:convert';
import 'package:http/http.dart' as http;

void postData() async {
  final String url = 'https://blooming-depths-22650-881173afc8bc.herokuapp.com/api/rooms';
  final Map<String, dynamic> data = {
    "data": {
      "name": "Test",
      "user": {
        "data": {
          "id": 1
        }
      }
    }
  };

  // Encode the data to JSON format
  final String jsonData = json.encode(data);

  try {
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json', // Set the content-type here
      },
      body: jsonData,
    );

    if (response.statusCode == 200) {
      // Request successful, handle the response data
      print('Request successful: ${response.body}');
    } else {
      // Request failed, handle the error
      print('Request failed with status: ${response.statusCode}');
    }
  } catch (e) {
    // Handle any exceptions that occurred during the request
    print('Error during request: $e');
  }
}


