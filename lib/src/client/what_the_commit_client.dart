import 'package:random_commit_message/src/models/commit_message.dart';
import 'package:web_scraper/web_scraper.dart';

class WhatTheCommitClient {
  WhatTheCommitClient();

  Future<CommitMessage> fetchMessage() async {
    final webScraper = WebScraper('http://whatthecommit.com');
    await webScraper.loadWebPage('/');
    final element =
        webScraper.getElement('#content > p:nth-child(1)', []).first;

    return CommitMessage(message: element['title']);
  }
}
