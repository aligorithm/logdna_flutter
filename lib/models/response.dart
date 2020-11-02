//// Response returened by the logDna.log() method. The body is the response body from the ingestion api
class DnaResponse {
  final bool status;
  final String body;

  DnaResponse(this.status, this.body);
}