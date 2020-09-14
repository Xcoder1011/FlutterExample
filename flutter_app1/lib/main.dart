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
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter1'),
      // home: RandomWords(),
    );
  }
}

// Stateless widgets 是不可变的，这意味着它们的属性不能改变 —— 所有的值都是 final。

// Stateful widgets 持有的状态可能在 widget 生命周期中发生变化，实现一个 stateful widget 至少需要两个类：
// 1）一个 StatefulWidget 类；
// 2）一个 State 类，StatefulWidget 类本身是不变的，但是 State 类在 widget 生命周期中始终存在。
class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

// 创建自己的状态类
class _RandomWordsState extends State<RandomWords> {
  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return Text(
      wordPair.asPascalCase,
      style: Theme.of(context).textTheme.headline4,
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

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    // Scaffold 是 Material 库中提供的一个 widget，它提供了默认的导航栏、标题和包含主屏幕 widget 树的 body 属性。
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[
            Text(
              'You have clicked the button this many times:',
            ),
            Text(
              // 语言包引用， 大驼峰式命名法
              wordPair.asPascalCase,
              style: Theme.of(context).textTheme.headline6,
            ),

            // 引用 一个 stateful widget（有状态的 widget）—— RandomWords
            RandomWords(),

            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
