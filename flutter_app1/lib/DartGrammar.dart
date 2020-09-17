// 导入核心库
import 'dart:html';
import 'dart:io';
import 'dart:math';

// 从外部 Package 中导入库
import 'package:flutter_app1/flexbox_layout.dart';

void main() {
  print('Hello, World!');

  var name = 'wushangkun';
  var year = 2020;
  var array = ['name1', 'name2', 'name3'];
  var dict = {'name': 'Jack', 'age': 28};

  final aListOfStrings = ['one', 'two', 'three'];
  final aSetOfStrings = {'one', 'two', 'three'};
  final aMapOfStringsToInts = {
    'one': 1,
    'two': 2,
    'three': 3,
  };

  /// 手动指定类型：
  final aListOfInts = <int>[];
  final aSetOfInts = <int>{};
  final aMapOfIntToDouble = <int, double>{};

  var string1 = '${3 + 2}'; // '5'
  var string2 = '${"word".toUpperCase()}'; // 'WORD'
  var string3 = '$dict'; // dict.toString() 的值
  var string4 = 'year is $year'; // dict.toString() 的值
  var student = StudentModel('Vincent', 20, 3);
  print(student
      ?.nickname); // student?.nickname 相当于 (student != null) ? student.nickname : null

  /// 避空运算符
  //  ??= 赋值运算符，仅当该变量为空值时才为其赋值：
  int a; // a为空
  // int a = null;   // 在 Dart 中没有“未初始化内存”的概念。所以使用 = null 是多余的。
  a ??= 3;
  print(a); // <-- Prints 3.
  a ??= 5;
  print(a); // <-- Still Prints 3.

  // 避空运算符是 ?? , 如果该运算符左边的表达式返回的是空值，则会计算并返回右边的表达式。
  print(null ?? 12); // <-- Prints 12.
  print(1 ?? 3); // <-- Prints 1.

  if (year >= 2001) {
    print('21世纪');
  }

  for (var n in array) {
    print(n);
  }

  while (year < 2016) {
    year += 1;
  }

  bool function1(int year) {
    return year >= 2001;
  }

  var c = function1(2020);

  // 使用了 => (胖箭头)符号，这是 Dart 中单行函数或方法的简写
  // 在将匿名函数作为参数传递时非常有用
  array.where((name) => name.contains('name1')).forEach((element) {
    print(element);
  });

  bool hasEmpty1 = aListOfStrings.any((string) => string.isEmpty);
  // 等价于
  bool hasEmpty2 = aListOfStrings.any((string) {
    return string.isEmpty;
  });

  /// 要 使用 whereType() 按类型过滤集合。
  var objects = [1, "a", 2, "b", 3];

  // 假设你有一个 list 里面包含了多种类型的对象，但是你指向从它里面获取整型类型的数据

  var ints1 = objects.where(
      (e) => e is int); // ❌ 虽然你想得到一个 Iterable<int>，然而它返回了一个 Iterable<Object>，
  var ints2 = objects
      .where((e) => e is int)
      .cast<int>(); // ❌ 通过添加 cast() 来“修正”上面的错误, 代码冗长，并导致创建了两个包装器，

  var ints3 =
      objects.whereType<int>(); // ✅ 使用 whereType() 简洁，生成所需的 Iterable（可迭代）类型

  var stuff = <dynamic>[1, 2];

  var ints4 = List<int>.from(stuff); // ✅
  var ints5 = stuff.toList().cast<int>(); // ❌

  var reciprocals1 = stuff.map<double>((e) => 1 / e); // ✅
  var reciprocals2 = stuff.map((e) => 1 / e).cast<double>(); // ❌

  /// 避免 使用 cast() 。
  List<int> singletonList(int value) {
    // ✅
    var list = <int>[];
    list.add(value);
    return list;
  }

  List<int> singletonList2(int value) {
    // ❌
    var list = []; // List<dynamic>.
    list.add(value);
    return list.cast<int>(); // cast() 方法返回一个惰性集合（lazy collection）
  }

  void printEvens(List<Object> objects) {
    // ✅
    for (var n in objects) {
      if ((n as int).isEven) print(n);
    }
  }

  void printEven2(List<Object> objects) {
    // ❌
    for (var n in objects.cast<int>()) {
      if (n.isEven) print(n);
    }
  }

  /// 函数

  // 在 Dart 中，就连函数也是对象

  localFunction() {
    // ✅  使用方法定义
  }

  var localFunction2 = () {
    // ❌  而不是把 lambda 赋值给一个变量。
  };

  array.forEach(print);  // ✅  如果你有一个方法，这个方法调用了参数相同的另一个方法

  array.forEach((element) { // ❌  那么，你不需要人为将这个方法包装到一个 lambda 表达式中。
    print(element);
  });

  /// 可选位置参数

  int sumUp(int a, int b, int c) {
    return a + b + c;
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

  /// 可选位置参数永远放在方法参数列表的最后。除非你给它们提供一个默认值，否则默认为 null。
  int sumUpToFive2(int a, [int b = 2, int c = 3, int d = 4, int e = 5]) {
    int sum = a;
    if (b != null) sum += b;
    if (c != null) sum += c;
    if (d != null) sum += d;
    if (e != null) sum += e;
    return sum;
  }

  total = sumUpToFive(1); // <-- total = 15

  /// 可选命名参数

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

  /// 级连 （..）

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

  /// 异步
  const oneSecond = Duration(seconds: 1);
  Future<void> printWithDelay(String message) async {
    await Future.delayed(oneSecond);
    print(message);
  }

  // 上面的方法相当于：
  Future<void> printWithDelay2(String message) {
    return Future.delayed(oneSecond).then((_) {
      print(message);
    });
  }

  Future<void> afterTwoThings(Future<void> first, Future<void> second) { // ✅
    return Future.wait([first, second]);
  }

  Future<void> afterTwoThings2(Future<void> first, Future<void> second) async { // ❌ 不要 在没有有用效果的情况下使用 async
    return Future.wait([first, second]);
  }

  /// 下面这些情况 async 是有用的：

  // 1. 你使用了 await。 (这是一个很明显的例子。)
  Future<void> usesAwait(Future<String> later) async {
    print(await later);
  }
  // 2. 异步的抛出一个异常
  Future<void> asyncError() async {
    throw 'Error!';
  }
  // 3. 你在返回一个值，但是你希望他显式的使用 Future
  Future<void> asyncValue() async => 'value';



  Future<void> createDescriptions(Iterable<String> strs) async {
    for (var str in strs) {
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

      try {
        // 捕获一个异常
        var file = File('$str.txt');
        if (await file.exists()) {
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

  /// 命名构造函数，转发到默认构造函数。
  PeopleModel.unlaunched(String nickname) : this(nickname, 0);
  PeopleModel.custom_name(String nickname) : this(nickname, 0);

  void describe() {
    if (name == null) {
      // 使用 throw 关键字抛出一个异常
      throw StateError('没有名字');
      // throw Exception('没有名字');  // 可以抛出任何非空对象
      // throw '没有名字'
    } else {
      print('my name is $name, I am $age years old.');
    }
  }
}

/// 扩展类（继承）, Dart 支持单继承。
class StudentModel extends PeopleModel {
  int grade;

  StudentModel(String nickname, int age, this.grade) : super(nickname, age);
}

class ExamPeople {
  int score;
  void describeNew() {
    print('考了 $score分');
  }
}

/// 使用 Mixin 的方式继承这个类就可将该类中的功能添加给其它类。
class ExamStudentModel extends PeopleModel with ExamPeople {
  // ExamStudentModel 类中就包含了 score 字段以及 describeNew() 方法。

}

/// 接口和抽象类
// Dart 没有 interface 关键字。相反，所有的类都隐式定义了一个接口。因此，任意类都可以作为接口被实现。
class TeacherModel implements PeopleModel {}

/// abstract : 抽象类可以包含抽象方法（不含方法体的方法）。
abstract class Describeable {
  void describe();
//  任意一个扩展了 Describable 的类都拥有 describeWithEmphasis() 方法，
//  这个方法又会去调用实现类中实现的 describe() 方法。
  void describeWithEmphasis() {
    print('===========================');
    describe();
    print('===========================');
  }
}

/// Getters and setters

class MyClass {
  int _aProperty = 0;
  // 自定义 getter
  int get aProperty => _aProperty;
  // 自定义 setter
  set aProperty(int value) {
    if (value >= 0) {
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

  /// 可选命名参数，默认值为期望值
  MyColor3({this.red = 0, this.green = 0, this.blue = 0});
}

class MyColor4 {
  int red;
  int green;
  int blue;

  /// 可选位置参数，默认值为期望值
  MyColor4([this.red = 0, this.green = 0, this.blue = 0]);
}

void testFunction() {
  final color1 = MyColor1(80, 80, 128);
  final color2 = MyColor2(red: 80, green: 80, blue: 128);
  final color3 = MyColor3(); // 默认值为期望值
  final color4 = MyColor4(); // 默认值为期望值

  /// 实现构造函数时，需要在构造函数体执行之前进行一些初始化。例如，final 修饰的字段必须在构造函数体执行之前赋值。

//   Point.fromJson(Map<String, num> json)
//   : x = json['x'],
//   y = json['y'] {
//   print('In Point.fromJson(): ($x, $y)');
//   }

  /// 初始化列表也是放置断言的便利位置，它仅会在开发期间运行：

  // NonNegativePoint(this.x, this.y)
  //     : assert(x >= 0),
  // assert(y >= 0) {
  // print('I just made a NonNegativePoint: ($x, $y)');
  // }

  final myPoint = Point.origin();

  // 不要 冗余地使用 const , const 关键字是隐式的，不需要写，也不应该。
  const primaryColors = [ ];
}

/// 命名构造方法

class Point {
  num x, y;
  Point(this.x, this.y);

  var value;

  void clear(){
    update(value);
  }

  void update(value) {
    this.value = value;
  }

  /// 允许一个类具有多个构造方法，Dart 支持命名构造方法：
  Point.origin() {
    x = 0;
    y = 0;
  }
}

/// 工厂构造方法 :factory 关键字

class Square extends Shape {}

class Circle extends Shape {

  double radius;

  // Circle({this.radius = 0});

  // 内部可以赋值，外部可以访问的字段
  // “私有成员变量，公开访问函数”的模式
  double get area => pi * radius * radius;
  double get circumference => 2.0 * radius * pi;
}

class Shape {
  Shape();

  /// 能够返回其子类甚至 null 对象
  factory Shape.fromTypeName(String name) {
    if (name == 'square') return Square();
    if (name == 'circle') return Circle();
    print('I don\'t recognize $name');
    return null;
  // }
}

/// 重定向构造方法

class Automobile {
  String make;
  String model;
  int mpg;

  // var value;
  // final List<Document> contents;
  final List<Document> contents = []; // 要 尽可能的在定义变量的时候初始化变量值。

  // 有时一个构造方法仅仅用来重定向到该类的另一个构造方法。
  // 重定向方法没有主体，它在冒号（:）之后调用另一个构造方法。

  Automobile(this.make, this.model, this.mpg);

  Automobile.hybrid(String make, String model) : this(make, model, 60);

  Automobile.fancyHybrid() : this.hybrid('Futurecar', 'Jack');

  // Automobile(value) : value = value, super(value);
}

/// Const 构造方法

class ImmutablePoint {
  // 如果你的类生成的对象永远都不会更改，则可以让这些对象成为编译时常量。
  const ImmutablePoint(this.x, this.y);
  // 定义 const 构造方法并确保所有实例变量都是 final 的。

  /// 使用 final 关键字来创建只读属性。
  final int x;
  final int y;

  static const ImmutablePoint origin = ImmutablePoint(0, 0);
}

/*

// 1. 使用 UpperCamelCase 风格命名类型。
// Classes（类名）、 enums（枚举类型）、 typedefs（类型定义）、以及 type parameters（类型参数）
// 应该把每个单词的首字母都大写（包含第一个单词），不使用分隔符。
typedef Predicate<T> = bool Function(T value);
class SliderMenu { ... }
extension MyFancyList<T> on List<T> { ... }
extension SmartIterable<T> on Iterable<T> { ... }

// 2.在库，包，文件夹，源文件中使用 lowercase_with_underscores 方式命名。
// 要求文件名必须是小写字母。使用分隔符这种形式可以保证命名的可读性。使用下划线作为分隔符可确保名称仍然是有效的Dart标识符

// 要 把 “dart:” 导入语句放到其他导入语句之前。
import 'dart:async';
import 'dart:html';
import 'dart:math' as math;

// 要 把 “package:” 导入语句放到项目相关导入语句之前。
import 'package:bar/bar.dart';
import 'package:foo/foo.dart';

import 'package:angular_components/angular_components' as angular_components;
import 'package:js/js.dart' as js;

// 要 把导出（export）语句作为一个单独的部分放到所有导入语句之后。
export 'src/error.dart';


// 不要使用前缀字母
defaultTimeout ✅    kDefaultTimeout ❌

/// You can use [CodeBlockExample] like this:
///
/// ```
/// var example = CodeBlockExample();
/// print(example.isItGreat); // "Yes."
/// ```

var points = <Point>[];
var addresses = <String, Address>{};
var counts = <int>{};


// 不要 使用 .length 来判断一个集合是否为空。
if (lunchBox.isEmpty) return 'so hungry...';
if (words.isNotEmpty) return words.join(' ');

for (var person in people) {
  ...
} ✅

people.forEach((person) {
  ...
}); ❌

people.forEach(print); ✅

 */
