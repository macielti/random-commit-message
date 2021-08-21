import 'package:flutter/foundation.dart';

class CommitMessage {
  CommitMessage({@required this.message})
      : assert(message != null && message.isNotEmpty);

  final String message;

  factory CommitMessage.fromDio(dynamic data) {

  }
}
