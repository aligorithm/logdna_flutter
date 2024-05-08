import 'dart:convert' show jsonEncode;

import 'package:http/http.dart' as http;
import 'package:logdna/models/dna_line.dart';

import 'models/response.dart';

class LogDNA {
  /// Ingestion key
  final String apiKey;

  /// The hostname of the source
  final String hostName;

  LogDNA({
    required this.apiKey,
    required this.hostName,
  });

  //// Sends the log via the logdna ingest API
  Future<DnaResponse> log(DnaLine line) async {
    final now = DateTime.now().toUtc().millisecondsSinceEpoch;
    try {
      final uri = Uri.parse(
        "https://logs.logdna.com/logs/ingest?hostname=$hostName"
        "&now=$now&apikey=$apiKey",
      );

      http.Response response = await http.post(uri,
          body: jsonEncode({
            "lines": [line]
          }),
          headers: {"Content-Type": "application/json", "Accept": "application/json"});

      if (response.statusCode == 200) {
        return DnaResponse(true, response.body);
      } else {
        return DnaResponse(false, response.body);
      }
    } catch (e) {
      return DnaResponse(false, e.toString());
    }
  }
}
