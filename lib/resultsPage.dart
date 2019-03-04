import 'package:flutter/material.dart';

class ResultsPageRoute extends MaterialPageRoute {
  ResultsPageRoute({String title})
      : super(
          builder: (context) => new ResultsPage(title: title),
        );

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(opacity: animation, child: child);
  }
}

class ResultsPage extends StatelessWidget {
  final String title;
  ResultsPage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
    );
  }
}
