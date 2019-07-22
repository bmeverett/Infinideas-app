import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'themes.dart';
import 'styles.dart';

class About extends StatelessWidget {
  final bool isDarkTheme;

  _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  About({Key key, @required this.isDarkTheme}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('About'),
            backgroundColor: getAppBarBackground(isDarkTheme)),
        body: Container(
            margin: const EdgeInsets.all(30.0),
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: Text('Infinite feed of ideas 💡',
                      style: getStyleAboutText(isDarkTheme)),
                ),
                Text(''),
                Text(
                    'This app has been built with Flutter for learning purpose (Learning Lab Challenge)',
                    style: getStyleAboutText(isDarkTheme)),
                Text(''),
                Expanded(
                    child: ListView(
                  children: <Widget>[
                    InkWell(
                        onTap: () {
                          _launchURL('https://learn.uno');
                        },
                        child: Container(
                          margin: MARGIN_ABOUT_LINK,
                          child: const Text('⚗️ Learning Lab'),
                        )),
                    InkWell(
                        onTap: () {
                          _launchURL('https://infinideas.learn.uno/?contact');
                        },
                        child: Container(
                          margin: MARGIN_ABOUT_LINK,
                          child: const Text('💡 Ask for a feature'),
                        )),
                    InkWell(
                        onTap: () {},
                        child: Container(
                          margin: MARGIN_ABOUT_LINK,
                          child: const Text('🔓 Restore TextBlast Premium'),
                        )),
                  ],
                ))
              ],
            )));
  }
}
