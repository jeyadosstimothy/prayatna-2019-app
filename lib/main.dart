import 'package:flutter/material.dart';
import 'eventCard.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prayatna',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(title: "Prayatna '19"),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new CustomScrollView(slivers: <Widget>[
        SliverAppBar(
          title: Text(
            this.title,
          ),
          floating: true,
          snap: true,
          forceElevated: true,
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Hero(
                tag: events[index].title,
                child: EventCard(
                  event: events[index],
                  position: index,
                ),
              );
            },
            childCount: events.length,
          ),
        ),
      ]),
    );
  }
}
