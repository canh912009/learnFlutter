// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

// Define root Widget
void main() => runApp(new HelloRectangle());

class RamdomEnglishWords extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new RamdomEnglishWordsState();
  }
}

// State : nơi chứa các thuộc tính mà thuộc tính đó thay đổi --> giao diện thay đổi theo
// khi mà props của StatefulWidget thay đổi --> build() sẽ đc gọi
// --> mỗi lần giá trị Text(Widget) bên trong thay đổi --> RamdomEnglishWords thay đổi theo
class RamdomEnglishWordsState extends State<RamdomEnglishWords> {
  final _words = <WordPair>[]; //words displayed in ListView, 1 row contains 1 word
  final _checkedWords = new Set<WordPair>(); // set cointains "no duplicate items"

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("List of English words"),
      ),
      body: new ListView.builder(itemBuilder: (context, index) {
        // this is anonymous function
        if(index >= _words.length){
          _words.addAll(generateWordPairs().take(10));
        }

        return _buildRow(_words[index], index);
      }),
    );
  }

  // this Widget for each row
  Widget _buildRow(WordPair wordPair, int index) {
    final color = index % 2 == 0 ? Colors.red : Colors.green;
    final isChecked = _checkedWords.contains(wordPair);

    return new ListTile(
      title: new Text(
        wordPair.asUpperCase,
        style: new TextStyle(fontSize: 19.0, color: color),
      ),
    );
  }
}



class HelloRectangle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "This is my first app",
      home: new RamdomEnglishWords(),
    );
  }
}
