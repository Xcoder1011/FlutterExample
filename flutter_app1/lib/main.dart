import 'package:flutter/material.dart';

// 导入english_words库
import 'package:english_words/english_words.dart';

// void main() {
//   runApp(MyApp());
// }

// 主函数（main）使用了 (=>) 符号，这是 Dart 中单行函数或方法的简写
void main() => runApp(MyApp());

//应用程序继承了 StatelessWidget，这将会使应用本身也成为一个 widget。在 Flutter 中，几乎所有都是 widget，
//包括对齐 (alignment)、填充 (padding) 和布局 (layout)。
class MyApp extends StatelessWidget {
  @override
  // 一个 widget 的主要工作是提供一个 build() 方法来描述如何根据其他较低级别的 widgets 来显示自己。
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
         // 主题外观
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'wushangkun'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _counter = 0;

  final wordPair = WordPair.random();

  // 添加一个 _suggestions 列表保存单词对
  final List<WordPair> _suggestions = <WordPair>[];

  // 这个集合存储用户喜欢（收藏）的单词对
  final Set<WordPair> _saved =  Set<WordPair>();

  // 添加一个 _biggerFont 变量来增大字体大小。
  final TextStyle _biggerFont = TextStyle(fontSize: 18.0);

  Widget _buildSuggestions() {
    // 工厂匿名回调函数
    // 两个参数 BuildContext 和行迭代器 i
    return ListView.builder(
        padding: EdgeInsets.all(16.0),
        // 对于每个建议的单词对都会调用一次 itemBuilder，然后将单词对添加到 ListTile 行中。
        itemBuilder: (context, i) {
          // 在每一列之前，添加一个1像素高的分隔线 widget。
          if (i.isOdd) return Divider();

          // 在偶数行，该函数会为单词对添加一个 ListTile row，在奇数行，该函数会添加一个分割线的 widget，来分隔相邻的词对。
          final index = i ~/ 2; // 语法 i ~/ 2 表示 i 除以 2，但返回值是整形（向下取整）
          if (index >= _suggestions.length) {
            // 如果是列表中最后一个单词对，接着再生成10个单词对，然后添加到列表。
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    // 检查确保单词对还没有添加到收藏夹中。
    final bool alreadySaved = _saved.contains(pair);

    return  ListTile(
      title:  Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      // 每一行加一个心形 ❤️图标️
      trailing:  Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        // 响应式风格的框架中，调用 setState() 会为 State 对象触发 build() 方法，从而导致对 UI 的更新
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Scaffold 是 Material 库中提供的一个 widget，它提供了默认的导航栏、标题和包含主屏幕 widget 树的 body 属性。
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          // 跳转到新页面（路由［route］）
           IconButton(icon: const Icon(Icons.list), onPressed: _pushToSaved)
        ],
      ),

      body: _buildSuggestions(),

      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //       Text(
      //         'You have clicked the button this many times:',
      //       ),
      //       Text(
      //         // 语言包引用， 大驼峰式命名法
      //         wordPair.asPascalCase,
      //         style: Theme.of(context).textTheme.headline6,
      //       ),
      //
      //       // 引用 一个 stateful widget（有状态的 widget）—— RandomWords
      //       // RandomWords(),
      //
      //       Text(
      //         '$_counter',
      //         style: Theme.of(context).textTheme.headline4,
      //       ),
      //     ],
      //   ),
      // ),

      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        // onPressed: () { print('FAB pressed.'); },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,

      // floatingActionButtonLocation:
      //     AlmostEndFloatFabLocation(offsetX: 0.0, offsetY: 0.0),
    );
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
      _suggestions.insert(0, WordPair.random());
    });
  }

  void _pushToSaved() {
    // 导航器管理应用程序的路由栈。
    // 将路由推入（push）到导航器的栈中，将会显示更新为该路由页面。
    // 从导航器的栈中弹出（pop）路由，将显示返回到前一个路由。
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          final Iterable<ListTile> tiles = _saved.map(
                (WordPair pair) {
              return ListTile(
                title: Text(
                  pair.asPascalCase,
                  style: _biggerFont,
                ),
              );
            },
          );

          // ListTile 的 divideTiles() 方法在每个 ListTile 之间添加 1 像素的分割线。
          // 该 divided 变量持有最终的列表项，并通过 toList()方法非常方便的转换成列表显示。

          final List<Widget> divided =
          ListTile.divideTiles(tiles: tiles, context: context).toList();
          return Scaffold(
            appBar: AppBar(
              title: const Text('我喜欢的'),
            ),
            body: ListView(children: divided),
          );
        },
      ),
    );
  }
}
