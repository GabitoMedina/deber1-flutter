

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
// import 'package:list_spanish_words/list_spanish_words.dart';
void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random Names ',
      home: RandomWords(),  
    );
  }
  
}

class _RandomWordsState extends State<RandomWords> {
  final _suggest = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  
  Widget _buildSuggest() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return const Divider(); /*2*/

          final index = i ~/ 2; /*3*/
          if (index >= _suggest.length) {
            _suggest.addAll(generateWordPairs().take(10)); /*4*/
          }
          return _buildRow(_suggest[index]);
        });
  }
  
  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Startup Name Generator'),
      ),
      body: _buildSuggest(),
    );
  }

}


class RandomWords extends StatefulWidget {
  @override
  State<RandomWords> createState() => _RandomWordsState();
}
