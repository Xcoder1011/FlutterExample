
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/flexbox_layout.dart';
import 'package:flutter_app1/pages/group_page.dart';
import 'package:flutter_app1/pages/student_achievement_list.dart';

class ContainerPage extends StatefulWidget {
  ContainerPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    print('createState _ContainerPageState');
    return _ContainerPageState();
  }
}

class TabItem {
  String name, normalIcon, selectedIcon;
  TabItem(this.name, this.normalIcon, this.selectedIcon);
}

class _ContainerPageState extends State<ContainerPage> {

  int selectedIndex = 0;
  List<Widget> pages;

  List<BottomNavigationBarItem> bottomBarItems;

  final defaultItemColor = Color.fromARGB(255, 125, 125, 125);
  final items = [
    TabItem('首页', 'assets/images/tab_home_normal@2x.png' ,'assets/images/tab_home_selected@2x.png'),
    TabItem('我的', 'assets/images/tab_mine_normal@2x.png' ,'assets/images/tab_mine_selected@2x.png'),
  ];

  @override
  void initState() {
    super.initState();

    if(pages == null){
      pages = [
        MyHomePage(title: '学员成绩'),
        StudentAchievementListPage(),
        // GroupPage()
      ];
    }

    if(bottomBarItems == null) {
      bottomBarItems = items.map((item) => BottomNavigationBarItem(
        icon: Image.asset(
          item.normalIcon,
          width: 30.0,
          height: 30.0,
        ),
        title: Text(
          item.name,
          style: TextStyle(fontSize: 10.0),
        ),
        activeIcon: Image.asset(
          item.selectedIcon, width: 30.0, height: 30.0
        ),
      )).toList();
    }
  }

  @override
  void didUpdateWidget(ContainerPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget _ContainerPageState');
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _getPagesWidget(0),
          _getPagesWidget(1),
        ],
      ),
      backgroundColor: Color.fromARGB(255, 248, 248, 248),
      bottomNavigationBar: BottomNavigationBar(
        items: bottomBarItems,
        onTap: (int index) {
          setState(() {
            selectedIndex = index;
          });
        },
        iconSize: 24,
        currentIndex: selectedIndex,
        //选中后
        fixedColor: Color.fromARGB(255, 0, 188, 96),
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  // Stack（层叠布局）+Offstage组合,解决状态被重置的问题
  Widget _getPagesWidget(int index) {
    return Offstage(
      offstage: selectedIndex != index,
      child: TickerMode(
        enabled: selectedIndex == index,
        child: pages[index],
      ),
    );
  }
}