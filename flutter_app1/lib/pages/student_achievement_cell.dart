import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/bean/student_achievement_model.dart';
import 'package:flutter_app1/constant/constant.dart';
import 'package:flutter_app1/router/router.dart';
import 'package:flutter_app1/util/uu_colors.dart';
import 'package:flutter_app1/widgets/uu_icon_text_button.dart';

///学员成绩cell
class StudentAchievementCell extends StatefulWidget {
  StudentAchievementModel model;

  StudentAchievementCell(this.model);

  @override
  State<StatefulWidget> createState() => _StudentAchievementCellState();
}

class _StudentAchievementCellState extends State<StudentAchievementCell> {
  @override
  void initState() {
    super.initState();
  }

  void _phoneAct() {
    print("打电话");
  }

  @override
  Widget build(BuildContext context) {
    if (widget.model == null) {
      return Container();
    }
    return GestureDetector(
      child: Flex(
        direction: Axis.horizontal,
        children: <Widget>[
          Flexible(
            flex: 1,
            fit: FlexFit.loose,
            child: Container(
              // color: UUColos.randomColor(), /// todo: Cannot provide both a color and a decoration
              height: 180.0,
              padding: EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  /// todo: Cannot provide both a color and a decoration
                  borderRadius: BorderRadius.circular(6.0)),
              child: Column(
                children: [
                  Container(
                    color: null,
                    height: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween, // 平分分布
                      children: [
                        Row(
                          children: [
                            ClipOval(
                              // 圆角头像
                              child: (widget.model.iconUrl == null)
                                  ? Container()
                                  : Image(
                                image: NetworkImage(widget.model.iconUrl),
                                width: 28,
                                height: 28,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: Constant.MARGIN_PADDING), // 添加间距10
                            Text(
                              // 学员姓名
                              '${widget.model.name}',
                              textAlign: TextAlign.left,
                              textDirection: TextDirection.ltr,
                              style: TextStyle(
                                  color: UUColos.hex333333,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: Constant.MARGIN_PADDING), // 添加间距10
                            (widget.model.phone == null) // 手机号
                                ? Container()
                                : Text(
                              '${widget.model.phone}',
                              textAlign: TextAlign.left,
                              textDirection: TextDirection.ltr,
                              style: TextStyle(
                                  color: UUColos.hex666666, fontSize: 13),
                            ),
                            SizedBox(width: Constant.MARGIN_PADDING), // 添加间距10
                            Container(
                              width: 18,
                              height: 18,
                              child: GestureDetector(
                                child: Image.asset(Constant.imagePath +
                                    'student_info_tel@2x.png'),
                                onTap: _phoneAct,
                              ),
                            )
                          ],
                        ),
                        Container(
                          width: 58,
                          height: 18,
                          child: GestureDetector(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end, // 平分分布
                              children: [
                                Text( // 更多
                                  '更多',
                                  style: TextStyle(
                                      color: UUColos.hex999999,
                                      fontSize: 13),
                                ),
                                SizedBox(width: 3), // 添加间距10
                                Container(
                                  width: 9,
                                  height: 9,
                                  child: Image.asset(Constant.imagePath +
                                      'gray_right_arrow@2x.png', fit: BoxFit.contain),
                                )
                              ],
                            ),
                            onTap: _phoneAct,
                          ),
                        )
                      ],
                    ),
                  ),

                  Container( // 线条
                    height: 0.5,
                    color: UUColos.separateLine,
                  ),
                  Container(
                    width: double.infinity, // 变得和上级视图一样大
                    height: 119,
                    padding: EdgeInsets.only(top: 10, bottom: 20),
                    // color: UUColos.randomColor(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween, // 平分分布
                      children: [
                        Align(
                          child: Text(
                            '科一做题进度： 已做题12题， 共1534题',
                            style: TextStyle(color: UUColos.hex333333, fontSize: 13),
                          ),
                          alignment: Alignment.topLeft,
                        ),
                        Align(
                          child: Text(
                            '科一做题记录：90 | 99 | 90 | 99 | 97 | 99',
                            style: TextStyle(color: UUColos.hex333333, fontSize: 13),
                          ),
                          alignment: Alignment.topLeft,
                        ),
                        Align(
                          child: Text(
                            '科四做题进度： 已做题13题， 共1534题',
                            style: TextStyle(color: UUColos.hex333333, fontSize: 13),
                          ),
                          alignment: Alignment.topLeft,
                        ),
                        Align(
                          child: Text(
                            '科四做题记录：90 | 99 | 90 | 99 | 97 | 99',
                            style: TextStyle(color: UUColos.hex333333, fontSize: 13),
                          ),
                          alignment: Alignment.topLeft,
                        ),
                      ],
                    ) ,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      onTap: () {
        Router.pushNoParams(context, Router.detailPage);
      },
    );
  }
}
