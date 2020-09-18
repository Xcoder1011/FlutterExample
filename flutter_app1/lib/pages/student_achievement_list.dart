import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/bean/search_result_entity.dart';
import 'package:flutter_app1/constant/constant.dart';
import 'package:flutter_app1/http/API.dart';
import 'package:flutter_app1/router/router.dart';
import 'package:flutter_app1/widgets/search_text_field_widget.dart';
import 'package:flutter_app1/util/uu_colors.dart';
import 'package:flutter_app1/constant/constant.dart';
import 'package:flutter/material.dart';

///学员成绩
class StudentAchievementListPage extends StatefulWidget {
  final String searchHintContent = '请输入学员名字或手机号查询成绩';

  @override
  State<StatefulWidget> createState() => _StudentAchievementListPageState();
}

class _StudentAchievementListPageState extends State<StudentAchievementListPage> {
  bool showLoading = false;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('学员成绩'),
      ),
      body: SafeArea(
          child: showLoading
              ? Center(
            child: CupertinoActivityIndicator(),
          )
              : Column(
            children: <Widget>[
              _getTopTipWidget(),
              _getSearchWidget(),
              Expanded(
                  child:ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.only(left: 15,right: 15, bottom: 10),
                        child: _buildRow(WordPair.random()),
                      );
                    },
                    itemCount: 10,
                  ),
              )

              // Expanded(
              //   child: ListView.builder(
              //     itemBuilder: (BuildContext context, int index) {
              //       SearchResultSubject bean =
              //       _searchResultEntity.subjects[index];
              //       return Padding(
              //         padding: EdgeInsets.all(10.0),
              //         child: GestureDetector(
              //           behavior: HitTestBehavior.translucent,
              //           child: _getItem(bean, index),
              //           onTap: () {
              //             Router.push(
              //                 context, Router.detailPage, bean.id);
              //           },
              //         ),
              //       );
              //     },
              //     itemCount: _searchResultEntity.subjects.length,
              //   ),
              // )
            ],
          )),
      backgroundColor: UUColos.hexString("#F5F5F5"),
    );
  }

  Widget _buildRow(WordPair pair) {

    if (pair == null) {
      return Container();
    }
    return GestureDetector(
      child: Flex(
        direction: Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget> [
          Flexible(
            flex: 1,
            fit: FlexFit.loose,
            child: Container(
              // color: UUColos.randomColor(), /// todo: Cannot provide both a color and a decoration
              height: 180.0,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: UUColos.randomColor(), /// todo: Cannot provide both a color and a decoration
                  borderRadius: BorderRadius.circular(6.0)),
              child: Text(
                '模拟考试累计5次，达到95分以上提醒我',
                textAlign: TextAlign.center,
                textDirection: TextDirection.ltr,
                style: TextStyle(
                    color: UUColos.hexFF5C11,
                    fontSize:13
                ),
              ),
            ),
          ),
        ],
      ),
      onTap: () {
        // Router.push(context, Router.detailPage, bean.id);
      },
    );
  }

  ///  1. 顶部tip条
  Widget _getTopTipWidget() {
    return Flex(
      direction: Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget> [
        Flexible(
          flex: 1,
          fit: FlexFit.loose,
          child: Container(
            color: UUColos.hexString('#FF5C11', alpha:0.15),
            height: 25.0,
            alignment: Alignment.center,
            child: Text(
              '模拟考试累计5次，达到95分以上提醒我',
              textAlign: TextAlign.center,
              textDirection: TextDirection.ltr,
              style: TextStyle(
                color: UUColos.hexFF5C11,
                fontSize:13
              ),
            ),
          ),
        ),
      ],
    );
  }

  ///  2. 搜索栏 🔍
  Widget _getSearchWidget() {
    final padding  = Constant.MARGIN_LEFT;
    return Padding(
      padding:
      EdgeInsets.only(left: padding, right: padding, top: 10.0, bottom: 10.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: SearchTextFieldWidget(
              hintText: widget.searchHintContent,
              onSubmitted: (searchContent) {
                showLoading = true;
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _getItem(SearchResultSubject bean, int index) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Card(
          child: Image.network(
            bean.images.medium,
            fit: BoxFit.cover,
            // width: imgW,
            // height: imgH,
          ),
          clipBehavior: Clip.antiAlias,
          elevation: 5.0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0))),
        ),
        Padding(
          padding: EdgeInsets.all(5.0),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(bean.title + '(${bean.year})',
                  style: getStyle(Colors.black, 15.0, bold: true)),
            ],
          ),
        )
      ],
    );
  }

  TextStyle getStyle(Color color, double fontSize, {bool bold = false}) {
    return TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: bold ? FontWeight.bold : FontWeight.normal);
  }
}