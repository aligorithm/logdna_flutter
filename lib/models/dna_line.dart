class DnaLine {
  String timestamp;
  String line;
  String app;
  String level;
  String env;
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

  addCustomField(CustomField customField){
    if (this.meta == null) this.meta = Map();
    this.meta.putIfAbsent(customField.name, () => customField.value);
  }
}

class CustomField {
  String name;
  String value;
}

class DnaLevel {
  static final String info = "INFO";
  static final String error = "ERROR";
  static final String warn = "WARN";
  static final String trace = "TRACE";
  static final String debug = "DEBUG";
  static final String fatal = "FATAL";
}

class DnaEnv {
  static final String production = "production";
  static final String staging = "staging";
  static final String testing = "testing";
  static final String development = "development";
}