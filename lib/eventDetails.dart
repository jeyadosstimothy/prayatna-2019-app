import 'package:flutter/material.dart';
import 'eventCard.dart';

class EventDetails extends MaterialPageRoute {
  EventDetails(Event event)
      : super(builder: (context) => new DetailsPage(event: event));

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(opacity: animation, child: child);
  }
}

class DetailsPage extends StatelessWidget {
  DetailsPage({this.event});

  final Event event;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: new Text(event.title)),
      body: Column(
        children: <Widget>[
          Text(event.description),
          Text(event.venue),
          Text(event.time),
          Text(event.contact),
        ],
      ),
    );
  }
}
