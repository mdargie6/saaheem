import 'package:http/http.dart' as http;
import 'dart:convert'; // For JSON handling

class HttpService {
  final String baseUrl;
  final String accessToken;

  HttpService({required this.baseUrl, required this.accessToken});

  Future<dynamic> get(String endpoint, {Map<String, String>? headers}) async {
    final url = Uri.parse('$baseUrl$endpoint');
    try {
      final response = await http.get(url, headers: headers);
      return _handleResponse(response);
    } catch (error) {
      throw Exception('GET request failed: $error');
    }
  }

  Future<dynamic> post(String endpoint, {Map<String, String>? headers}) async {
    final url = Uri.parse('$baseUrl$endpoint');
    try {
      final response = await http.post(url, headers: headers);
      return _handleResponse(response);
    } catch (error) {
      throw Exception('POST request failed: $error');
    }
  }

    dynamic _handleResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      final out = jsonDecode(response.body);
      print(out);
      return out;
    } else {
      throw Exception('HTTP Error: ${response.statusCode} - ${response.reasonPhrase}');
    }
  }

    Future<void> fetchSongById(String songId) async {
    // final url = Uri.parse('api.genius.com/songs/$songId');
    final url = Uri.https('api.genius.com', 'search/$songId');

    final headers = {
      'Authorization': 'Bearer $accessToken',
      "Access-Control-Allow-Origin": "*",
      'Content-Type': 'application/json',
      'Accept': '*/*',
    };

    try {
      final response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print('Song Data: ${data['response']['song']}');
      } else {
        print('Error: ${response.statusCode} - ${response.body}');
      }
    } catch (error) {
      print('Error occurred: $error');
    }
  }
}

// void fetchPosts() async {
//   final HttpService httpService = HttpService(baseUrl: 'https://jsonplaceholder.typicode.com/');

//   try {
//     final posts = await httpService.get('/posts');
//     print('Fetched Posts: $posts');
//   } catch (error) {
//     print('Error: $error');
//   }
// }

// void fetchPlaylists(String accessToken) async {
//   final url = Uri.parse('https://api.spotify.com/v1/me/playlists');
//   final headers = {
//     'Authorization': 'Bearer $accessToken',
//   };

//   try {
//     final response = await http.get(url, headers: headers);

//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);
//       print('Playlists: $data');
//     } else {
//       print('Error: ${response.statusCode} - ${response.body}');
//     }
//   } catch (error) {
//     print('Error occurred: $error');
//   }
// }

void main() {

  const String baseUrl = 'https://api.genius.com/';
  
  final accessToken = '8MH07wQg4NXFozsWgVb8nYLAUBk-6Bk9GlYRq3THfPlCeJ1RqcXkYet9WT-J93_s';
  final headers = {
    'Authorization' : 'Bearer 8MH07wQg4NXFozsWgVb8nYLAUBk-6Bk9GlYRq3THfPlCeJ1RqcXkYet9WT-J93_s'
    };

  final endpoint = 'search?q=lenderman';
  final url = Uri.parse('$baseUrl$endpoint');

  // http.get(url, headers: headers);

  // // final authService = HttpService(baseUrl:baseUrl, accessToken:auth_code);
  final geniusService = HttpService(baseUrl:baseUrl, accessToken:accessToken);

  geniusService.get('search?q=lenderman', headers: headers);

}


