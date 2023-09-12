import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class RamdomWord extends StatefulWidget {
  @override
  RamdomWordState createState() => RamdomWordState();
}

class RamdomWordState extends State<RamdomWord> {
  final ramdomWordData = <WordPair>[];
  final saveWordPair = Set<WordPair>();
  Widget _buildList() {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemBuilder: (context, item) {
          if (item.isOdd) return Divider();

          final index = item ~/ 2;
          if (index >= ramdomWordData.length) {
            ramdomWordData.addAll(generateWordPairs().take(10));
          }
          return _buildRow(ramdomWordData[index]);
        });
  }

  Widget _buildRow(WordPair word) {
    final alreadSaved = saveWordPair.contains(word);
    return ListTile(
      title: Text(word.asPascalCase, style: TextStyle(fontSize: 18)),
      trailing: Icon(alreadSaved ? Icons.favorite : Icons.favorite_border,
          color: alreadSaved ? Colors.red : null),
      onTap: () {
        setState(() {
          if (alreadSaved) {
            saveWordPair.remove(word);
          } else {
            saveWordPair.add(word);
          }
        });
      },
    );
  }

  void ListSave() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      final Iterable<ListTile> titles = saveWordPair.map((WordPair word) {
        return ListTile(
            title: Text(word.asPascalCase, style: TextStyle(fontSize: 18)));
      });
      final List<Widget> divide =
          ListTile.divideTiles(tiles: titles, context: context).toList();

      return Scaffold(
        appBar: AppBar(
          title: Text('Save Favorites'),
        ),
        body: ListView(children: divide),
      );
    }));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ramdom Word'),
        actions: <Widget>[
          IconButton(onPressed: ListSave, icon: Icon(Icons.list))
        ],
      ),
      body: _buildList(),
    );
  }
}
