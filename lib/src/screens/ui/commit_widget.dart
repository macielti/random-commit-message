import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:random_commit_message/src/client/what_the_commit_client.dart';
import 'package:random_commit_message/src/models/commit_message.dart';

class Commit extends StatefulWidget {
  @override
  _CommitState createState() => _CommitState();
}

class _CommitState extends State<Commit> {
  CommitMessage _commitMessage =
      CommitMessage(message: 'Fetch a random commit message');

  WhatTheCommitClient client = WhatTheCommitClient(); // use a provider

  void fetchRandomMessage() async {
    final commitMessage = await client.fetchMessage();
    setState(
      () {
        _commitMessage = commitMessage;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.white,
      ),
    );

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(
            top: 20,
            left: 20,
            right: 20,
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'What The Commit',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'Times',
                    fontSize: 34.0,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  _commitMessage.message,
                  textAlign: TextAlign.start,
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Times',
                    fontSize: 17.0,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 18,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  textDirection: TextDirection.ltr,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.copy,
                        color: Colors.white,
                        size: 20.0,
                      ),
                      onPressed: () {
                        Clipboard.setData(ClipboardData(text: "your text"));
                        Fluttertoast.showToast(
                            msg: 'Commit message added to your clipboard');
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.autorenew,
                        color: Colors.white,
                        size: 20.0,
                      ),
                      onPressed: () {
                        Fluttertoast.showToast(
                            msg: 'Fetching new random commit message');
                        fetchRandomMessage();
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
