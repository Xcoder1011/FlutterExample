
// 导入核心库
import 'dart:html';
import 'dart:io';
import 'dart:math';
// 从外部 Package 中导入库
import 'package:flutter/cupertino.dart';
import 'package:flutter_app1/flexbox_layout.dart';

void main() {
  print('Hello, World!');

  var name = 'wushangkun';
  var year = 2020;
  var array = ['name1', 'name2', 'name3'];
  var dict = {'name':'Jack', 'age':28};

  final aListOfStrings = ['one', 'two', 'three'];
  final aSetOfStrings = {'one', 'two', 'three'};
  final aMapOfStringsToInts = {
    'one': 1,
    'two': 2,
    'three': 3,
  };

  // 手动指定类型：
  final aListOfInts = <int>[];
  final aSetOfInts = <int>{};
  final aMapOfIntToDouble = <int, double>{};

  var string1 = '${3+2}';  // '5'
  var string2 = '${"word".toUpperCase()}';  // 'WORD'
  var string3 = '$dict';     // dict.toString() 的值

  var student = StudentModel('Vincent', 20, 3);
  print(student?.nickname); // student?.nickname 相当于 (student != null) ? student.nickname : null



  // 避空运算符
  //  ??= 赋值运算符，仅当该变量为空值时才为其赋值：
  int a;     // a为空
  a ??= 3;
  print(a);   // <-- Prints 3.
  a ??= 5;
  print(a);   // <-- Still Prints 3.

  // 避空运算符是 ?? , 如果该运算符左边的表达式返回的是空值，则会计算并返回右边的表达式。
  print(null ?? 12); // <-- Prints 12.
  print(1 ?? 3); // <-- Prints 1.

  if(year >= 2001) {
    print('21世纪');
  }

  for(var n in array) {
    print(n);
  }

  while(year < 2016){
    year += 1;
  }

  bool function1(int year) {
    return year >= 2001;
  }
  var c = function1(2020);


  // 使用了 => (胖箭头)符号，这是 Dart 中单行函数或方法的简写
  // 在将匿名函数作为参数传递时非常有用
  array.where((name) => name.contains('name1')).forEach((element) { print(element);});
  
  bool hasEmpty1 = aListOfStrings.any((string) => string.isEmpty);
  // 等价于
  bool hasEmpty2 = aListOfStrings.any((string) {
    return string.isEmpty;
  });


  //////// 可选位置参数

  // 位置参数
  int sumUp(int a, int b, int c) {
    return a+b+c;
  }
  int total = sumUp(1, 2, 3);

  // 将这些参数包裹在大括号[]中使其变成可选位置参数：
  int sumUpToFive(int a, [int b, int c, int d, int e]) {
    int sum = a;
    if (b != null) sum += b;
    if (c != null) sum += c;
    if (d != null) sum += d;
    if (e != null) sum += e;
    return sum;
  }
  total = sumUpToFive(2, 3);
  total = sumUpToFive(2, 3, 4, 5, 6);

  // 可选位置参数永远放在方法参数列表的最后。除非你给它们提供一个默认值，否则默认为 null。
  int sumUpToFive2(int a, [int b=2, int c=3, int d=4, int e=5]) {
    int sum = a;
    if (b != null) sum += b;
    if (c != null) sum += c;
    if (d != null) sum += d;
    if (e != null) sum += e;
    return sum;
  }
  total = sumUpToFive(1);  // <-- total = 15

  //////// 可选命名参数

  // 大括号定义可选命名参数，这些参数默认为 null
  void printName(String firstName, String lastName, {String suffix}) {
    print('$firstName $lastName ${suffix ?? ''}');
  }
  printName('Avinash', 'Gupta');
  printName('Poshmeister', 'Moneybuckets', suffix: 'IV');

  // 参数默认为 null，但也可以为其提供默认值。
  void printName2(String firstName, String lastName, {String suffix = ''}) {
    print('$firstName $lastName ${suffix}');
  }

  /// 一个方法不能同时使用 可选位置参数 和 可选命名参数。

  var button = querySelector('#btnAct');
  button.text = 'Go';
  button.classes.add('important');
  button.onClick.listen((event) => window.alert('Confirmed'));

  // 级连 （..）

  // 使用级连能够让代码变得更加简洁，而且你也不再需要 button 变量了。
  querySelector('#btnAct')
    ..text = 'Go'
  ..classes.add('important')
  ..onClick.listen((event) => window.alert('Confirmed'));



  var model1 = PeopleModel('wushangkun', 28);
  // var model1 = PeopleModel.custom_name('wushangkun');
  model1.describe();

  var model2 = StudentModel('Xcoder1011', 28, 3);
  model2.describe();

  // 异步
  const oneSecond = Duration(seconds: 1);
  Future<void> printWithDelay(String message) async {
    await Future.delayed(oneSecond);
    print(message);
  }
  // 上面的方法相当于：
  Future<void> printWithDelay2(String message) {
    return Future.delayed(oneSecond).then((_){
      print(message);
    });
  }

  Future<void> createDescriptions(Iterable<String> strs) async {
    for(var str in strs) {

      // 使用 try、on 以及 catch 关键字来处理异常：

      // try {
      //
      // } on Exception catch (e) {           // on 关键字按类型过滤特定异常
      //   print('Unknown exception: $e');
      // } catch (e) {                        // catch 关键字则能够获取捕捉到的异常对象的引用
      //   print('Something really unknown: $e');
      //   rethrow;                           // 如果你无法完全处理该异常，请使用 rethrow 关键字再次抛出异常
      // } finally {                          // 要执行一段无论是否抛出异常都会执行的代码，请使用 finally
      //   cleanLlamaStalls();
      // }


      try{ // 捕获一个异常
        var file = File('$str.txt');
        if(await file.exists()){
          var modified = await file.lastModified();
          print('文件 $str 已经存在。它上一次的修改时间为 $modified。');
          continue;
        }

        await file.create();
        await file.writeAsString('开始在此文件中描述 $str。');
        
      } on IOException catch (e) {
        print('不能为 $str 创建描述：$e');
      } finally {
        print('做一些销毁工作');
      }
    }
  }

  Stream<String> report(PeopleModel people, Iterable<String> strs) async* {
    for (var str in strs) {
      await Future.delayed(oneSecond);
      yield '${people.realname} 的职业是 $str';
    }
  }
}

class PeopleModel {

  String nickname;
  int age;
  String name;

  // 一个 getter 方法（而不是变量）
  String get realname {
    if (name != null) return name;
    return nickname;
  }

  // 构造函数，带有可以直接为成员变量赋值的语法糖。
  PeopleModel(this.nickname, this.age) {
    // 这里可以实现初始化代码。

  }

  // 命名构造函数，转发到默认构造函数。
  PeopleModel.unlaunched(String nickname) : this(nickname, 0);
  PeopleModel.custom_name(String nickname) : this(nickname, 0);

  void describe(){
    if(name == null) {
    // 使用 throw 关键字抛出一个异常
      throw StateError('没有名字');
      // throw Exception('没有名字');  // 可以抛出任何非空对象
      // throw '没有名字'
    } else {
      print('my name is $name, I am $age years old.');
    }
  }
}

// 扩展类（继承）, Dart 支持单继承。
class StudentModel extends PeopleModel {

  int grade;

  StudentModel(String nickname, int age, this.grade) : super(nickname, age);

}

class ExamPeople {
  int score;
  void describeNew(){
    print('考了 $score分');
  }
}
// 使用 Mixin 的方式继承这个类就可将该类中的功能添加给其它类。
class ExamStudentModel extends PeopleModel with ExamPeople {
  // ExamStudentModel 类中就包含了 score 字段以及 describeNew() 方法。

}

// 接口和抽象类
// Dart 没有 interface 关键字。相反，所有的类都隐式定义了一个接口。因此，任意类都可以作为接口被实现。
class TeacherModel implements PeopleModel {

}

// abstract : 抽象类可以包含抽象方法（不含方法体的方法）。
abstract class Describeable {
  void describe();
//  任意一个扩展了 Describable 的类都拥有 describeWithEmphasis() 方法，
//  这个方法又会去调用实现类中实现的 describe() 方法。
  void describeWithEmphasis(){
    print('===========================');
    describe();
    print('===========================');
  }
}

// Getters and setters

class MyClass{

  int _aProperty = 0;
  // 自定义 getter
  int get aProperty => _aProperty;
  // 自定义 setter
  set aProperty(int value) {
    if(value >= 0){
      _aProperty = value;
    }
  }

  List<int> _values = [];
  void addValue(int value) {
    _values.add(value);
  }

  int get count {
    return _values.length;
  }

}

class MyColor1 {
  int red;
  int green;
  int blue;
  // 在声明构造方法时使用 this.propertyName， 自动完成属性赋值
  MyColor1(this.red, this.green, this.blue);
}

class MyColor2 {
  int red;
  int green;
  int blue;

  // 可选命名参数, 属性名为参数的名称
  MyColor2({this.red, this.green, this.blue});
}

class MyColor3 {
  int red;
  int green;
  int blue;

  // 可选命名参数，默认值为期望值
  MyColor3({this.red = 0, this.green = 0, this.blue = 0});
}

class MyColor4 {
  int red;
  int green;
  int blue;

  // 可选位置参数，默认值为期望值
  MyColor4([this.red = 0, this.green = 0, this.blue = 0]);
}

void testFunction() {

  final color1 = MyColor1(80, 80, 128);
  final color2 = MyColor2(red: 80, green: 80, blue: 128);
  final color3 = MyColor3(); // 默认值为期望值
  final color4 = MyColor4(); // 默认值为期望值

  // 实现构造函数时，需要在构造函数体执行之前进行一些初始化。例如，final 修饰的字段必须在构造函数体执行之前赋值。

//   Point.fromJson(Map<String, num> json)
//   : x = json['x'],
//   y = json['y'] {
//   print('In Point.fromJson(): ($x, $y)');
//   }


  // 初始化列表也是放置断言的便利位置，它仅会在开发期间运行：

  // NonNegativePoint(this.x, this.y)
  //     : assert(x >= 0),
  // assert(y >= 0) {
  // print('I just made a NonNegativePoint: ($x, $y)');
  // }

}

/// 命名构造方法

class Point {
  num x, y;
  Point(this.x, this.y);

  Point.origin() {
    x = 0;
    y = 0;
  }
}




