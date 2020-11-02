import 'dart:convert';

import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:logdna/models/dna_line.dart';
import 'package:http/http.dart' as http;
import 'models/response.dart';

class LogDNA {
  final String apiKey;
  final String appName;
  final String hostName;
  LogDNA({@required this.apiKey, this.appName, this.hostName});

  Future<DnaResponse> log(DnaLine line) async {
    try {
      http.Response response = await http.post(
          'https://logs.logdna.com/logs/ingest?hostname=${this.hostName}&now=now&apikey=${this.apiKey}&appName=${this.appName}',
          body: {
            "lines": jsonEncode([line])
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
