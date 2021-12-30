# logdna

A simple logdna client for Flutter. Logging made easy.

[LogDNA](https://logdna.com) is a log management platform that integrates with many platforms. All logs are accessible in a centralized dashboard with features such as analysis, monitoring, filters and alerts.

## Getting Started

To get started, create an account on [logdna.com](https://logdna.com) and get your ingestion API key. The set up process is straightforward. Here's a link to the quickstart guide (https://docs.logdna.com/docs/logdna-quick-start-guide).

## Installing the package

Add this to your project's `pubspec.yaml` file

```yaml
dependencies:
  logdna: ^1.1.2
```

Run `flutter pub get`


## Usage

Import the package to your Dart code

```dart
import 'package:logdna/logdna.dart';
```


Instantiate the LogDna object

```dart
logDna = LogDNA(
        apiKey: "YOUR_API_KEY",
        hostName: "HOSTNAME");
```
        
        
Add logs using the logDna object.

```dart
logDna.log(DnaLine(
      timestamp: DateTime.now().toUtc().millisecondsSinceEpoch.toString(),
      line: "event happened",
      level: DnaLevel.debug,
      app "APP NAME"
      env: DnaEnv.production,
      meta: {
        "custom field":"custom value",
        "custom field 2": "custom value 2"
      }
    ));
 ```


Alternatively, you can create the log line separately and pass it into the log method.

```dart
line = DnaLine(
      timestamp: DateTime.now().toUtc().millisecondsSinceEpoch.toString(),
      line: "event happened",
      level: DnaLevel.debug,
      app: "APP NAME"
      env: DnaEnv.production,
      meta: {
        "custom field":"custom value",
        "custom field 2": "custom value 2"
      }
    );
```
    
 You can add custom values after creating the 'DnaLine' instance.
 
 ```dart
 line.addCustomField(CustomField(name:"custom name", value: "Custom value"));
 ```


You've pushed your log to LogDNA! Check your LogDNA dashboard. Your new log line should appear.
