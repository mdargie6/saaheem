import 'dart:io';

void main() async {
  // Bind the server to localhost on port 8000
  final server = await HttpServer.bind(
    InternetAddress.loopbackIPv4, // 127.0.0.1
    8000,
  );

  print('Server running on http://localhost:8000/');

  // Listen for incoming requests
  await for (HttpRequest request in server) {
    // Log the request details
    print('Request received: ${request.uri}');

    // Extract query parameters (e.g., authorization code)
    if (request.uri.queryParameters.containsKey('code')) {
      final code = request.uri.queryParameters['code'];
      print('Authorization code: $code');
    }

    if (request.uri.path == '/callback') {
      final code = request.uri.queryParameters['code'];
    print('Authorization code: $code');
}


    // Send a response
    request.response
      ..statusCode = HttpStatus.ok
      ..write('Hello from Dart server! Check console for query parameters.')
      ..close();
  }
}