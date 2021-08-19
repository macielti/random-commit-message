import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:random_commit_message/src/client/what_the_commit_client.dart';

class Commit extends StatefulWidget {
  const Commit();

  @override
  _CommitState createState() => _CommitState();
}

class _CommitState extends State<Commit> {
  String _message = 'Fetch A New Random Message';

  WhatTheCommitClient client = WhatTheCommitClient(); // use a provider

  void fetchRandomMessage() {
    setState(
      () {
        _message = 'Low On Caffeine, Please Forgive The Ugly UI';
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Center(child: Text('What The Commit')),
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Padding(
              padding: EdgeInsets.only(
                top: 36,
                left: 20,
                right: 20,
              ),
              child: Center(
                child: Text(
                  _message,
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Times',
                    fontSize: 24.0,
                  ),
                ),
              )),
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
    );
  }
}
