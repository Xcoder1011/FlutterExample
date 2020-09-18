import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/pages/student_achievement_list.dart';
import 'webview_widget.dart';
import 'package:flutter_app1/pages/student_achievement_detail.dart';

class Router {
  static const homePage = 'app://';
  static const detailPage = 'app://DetailPage';
  static const playListPage = 'app://VideosPlayPage';
  static const searchPage = 'app://SearchPage';
  static const photoHero = 'app://PhotoHero';
  static const personDetailPage = 'app://PersonDetailPage';

      Widget _getPage(String url, dynamic params) {
        if (url.startsWith('https://') || url.startsWith('http://')) {
          return WebViewPage(url, params: params);
        } else {
          switch (url) {
        case detailPage:
        case homePage:
        case playListPage:
        case searchPage:
          return SearchPage(searchHintContent: params);
        // case photoHero:
        //   return PhotoHeroPage(
        //       photoUrl: params['photoUrl'], width: params['width']);
        // case personDetailPage:
        //   return PersonDetailPage(params['personImgUrl'], params['id']);
      }
    }
    return null;
  }

  Router.pushNoParams(BuildContext context, String url) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return _getPage(url, null);
    }));
  }

  Router.push(BuildContext context, String url, dynamic params) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return _getPage(url, params);
    }));
  }
}
