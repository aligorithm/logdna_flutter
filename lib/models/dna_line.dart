class DnaLine {
  /// Timestamp for the log line
  String timestamp;

  /// Log statement
  String line;

  /// App name
  String app;

  /// Log level (E.g. Debug, Info, Error)
  String level;

  /// the current environment of the application.
  String env;

  ///Meta is a field reserved for custom information associated with a log line.
  ///To add metadata to an API call, specify the meta field under the lines object.
  ///Metadata can be viewed inside that line's context.
  ///WARNING: If inconsistent value types are used, that line's metadata, will not be parsed.
  ///For example, if a line is passed with a meta object, such as meta.myfield of type String, any subsequent lines with meta.myfield must have a String as the value type for meta.myfield.
  ///Source: LogDNA official documentation.
  Map<String, dynamic> meta;

  DnaLine(
      {this.timestamp, this.line, this.app, this.level, this.env, this.meta});

  DnaLine.fromJson(Map<String, dynamic> json) {
    timestamp = json['timestamp'];
    line = json['line'];
    app = json['app'];
    level = json['level'];
    env = json['env'];
    meta = json['meta'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['timestamp'] = this.timestamp;
    data['line'] = this.line;
    data['app'] = this.app;
    data['level'] = this.level;
    data['env'] = this.env;
    if (this.meta != null) {
      data['meta'] = this.meta;
    }
    return data;
  }

  /// Add a custom field to a log line
  addCustomField(CustomField customField) {
    if (this.meta == null) this.meta = Map();
    this.meta.putIfAbsent(customField.name, () => customField.value);
  }
}

/// A custom field added to the DnaLine. It's passed into the ingestion API under the meta field.
class CustomField {
  String name;
  String value;
}

/// DnaLevel is a string indicating the log level. Custom values are allowed.
class DnaLevel {
  static final String info = "INFO";
  static final String error = "ERROR";
  static final String warn = "WARN";
  static final String trace = "TRACE";
  static final String debug = "DEBUG";
  static final String fatal = "FATAL";
}

/// The current environment (e.g. development, production)
class DnaEnv {
  static final String production = "production";
  static final String staging = "staging";
  static final String testing = "testing";
  static final String development = "development";
}
