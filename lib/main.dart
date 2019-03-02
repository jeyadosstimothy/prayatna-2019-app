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
  final events = <Event>[
    Event(
      title: 'Mini Placement',
      tagline: 'Do you have what it takes?',
      time: 'Mar 8, 9am - 12pm',
      venue: 'LHC 301',
      description: 'Hello world Hello world Hello world Hello world',
      contact: '96773207736',
      image: 'assets/images/mini-placement.png',
    ),
    Event(
      title: 'OSPC',
      tagline: 'Clash of the coders',
      time: 'Mar 8, 9am - 12pm',
      venue: 'LHC 302',
      description: 'Hello world Hello world Hello world Hello world',
      contact: '96773207736',
      image: 'assets/images/ospc.png',
    ),
    Event(
      title: "Code 'N Chaos",
      tagline: 'Rise above the rest',
      time: 'Mar 9, 9am - 12pm',
      venue: 'LHC 303',
      description: 'Hello world Hello world Hello world Hello world',
      contact: '96773207736',
      image: 'assets/images/code-n-chaos.jpg',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle titleStyle = theme.textTheme.headline;
    return Scaffold(
      body: new CustomScrollView(slivers: <Widget>[
        SliverAppBar(
          title: Text(
            this.title,
            style: titleStyle,
          ),
          floating: true,
          snap: true,
          forceElevated: true,
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return EventCard(
                event: events[index],
              );
            },
            childCount: events.length,
          ),
        ),
      ]),
    );
  }
}
