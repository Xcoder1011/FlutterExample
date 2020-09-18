import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/bean/student_achievement_model.dart';
import 'package:flutter_app1/router/router.dart';
import 'package:flutter_app1/util/uu_colors.dart';

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

  @override
  Widget build(BuildContext context) {

    if (widget.model == null) {
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
                '学员名称：${widget.model.name}',
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
}

