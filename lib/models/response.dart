class DnaResponse {
  /// Success or failure of the request
  final bool status;

  /// Response body or error
  final String body;

  /// Response returened by the logDna.log() method. The body is the response body from the ingestion api
  DnaResponse(this.status, this.body);
}
