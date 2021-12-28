import 'dart:convert';

import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:logdna/models/dna_line.dart';

import 'models/response.dart';

class LogDNA {
  /// logdna ingestion key
  final String apiKey;

  /// logdna app name
  final String appName;

  /// logdna hostname
  final String hostName;
  LogDNA({required this.apiKey, required this.appName, required this.hostName});

  //// Sends the log via the logdna ingest API
  Future<DnaResponse> log(DnaLine line) async {
    final now = DateTime.now().toUtc().millisecondsSinceEpoch;
    try {
      final uri =
          Uri.parse("https://logs.logdna.com/logs/ingest?hostname=$hostName"
              "&now=$now&apikey=$apiKey&appName=$appName");

      http.Response response = await http.post(uri, body: {
        "lines": jsonEncode([line]),
      });

      if (response.statusCode == 200) {
        print(true);
        return DnaResponse(true, response.body);
      } else {
        print(true);
        return DnaResponse(false, response.body);
      }
    } catch (e) {
      debugPrint("DNALogs Error: ${e.toString()}");
      return DnaResponse(false, e.toString());
    }
  }
}
