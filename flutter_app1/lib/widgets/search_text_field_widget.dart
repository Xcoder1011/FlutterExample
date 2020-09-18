import 'package:flutter/material.dart';
import 'package:flutter_app1/util/uu_colors.dart';
///文本搜索框
class SearchTextFieldWidget extends StatelessWidget {
  final ValueChanged<String> onSubmitted;
  final VoidCallback onTab;
  final String hintText;
  final EdgeInsetsGeometry margin;

  SearchTextFieldWidget({Key key, this.hintText, this.onSubmitted, this.onTab, this.margin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin == null ? EdgeInsets.all(0.0) : margin,
      width: MediaQuery.of(context).size.width,
      alignment: AlignmentDirectional.center,
      height: 35.0,
      decoration: BoxDecoration(
          // color: Color.fromARGB(255, 237, 236, 237),
          color: Colors.white,
          borderRadius: BorderRadius.circular(6.0)),
      child: TextField(
        onSubmitted: onSubmitted,
        onTap: onTab,
        cursorColor: UUColos.hex00AD54,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(top: 1),
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: TextStyle(
                fontSize: 13, color: UUColos.hex999999),
            prefixIcon: Icon(
              Icons.search,
              size: 22,
              color: UUColos.hex999999,
            )),
        style: TextStyle(fontSize: 13),
      ),
    );
  }

  getContainer(BuildContext context, ValueChanged<String> onSubmitted) {
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: AlignmentDirectional.center,
      height: 40.0,
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 237, 236, 237),
          borderRadius: BorderRadius.circular(24.0)),
      child: TextField(
        onSubmitted: onSubmitted,
        cursorColor: Color.fromARGB(255, 0, 189, 96),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.zero,
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: TextStyle(fontSize: 20),
            prefixIcon: Icon(
              Icons.search,
              size: 29,
              color: Color.fromARGB(255, 128, 128, 128),
            )),
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
