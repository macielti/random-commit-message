import 'package:flutter/material.dart';
import 'package:random_commit_message/src/screens/ui/commit_widget.dart';

void main() {
  runApp(RandomCommitMessage());
}

class RandomCommitMessage extends StatelessWidget {
  const RandomCommitMessage();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'What The Commit',
      home: Commit(),
    );
  }
}
