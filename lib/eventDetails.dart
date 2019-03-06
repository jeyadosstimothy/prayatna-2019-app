import 'package:flutter/material.dart';
import 'eventCard.dart';

class DetailsPageRoute extends MaterialPageRoute {
  DetailsPageRoute(String title, List events, int initPosition,
      {bool showResults = false})
      : super(
          builder: (context) => new DetailsPage(
                title: title,
                events: events,
                initPosition: initPosition,
                showResults: showResults,
              ),
        );

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(opacity: animation, child: child);
  }
}

class DetailsPage extends StatelessWidget {
  final int initPosition;
  final List<Event> events;
  final String title;
  final bool showResults;

  DetailsPage({this.title, this.initPosition, this.events, this.showResults});

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: new Text(this.title)),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).canvasColor,
              Colors.cyan.shade50,
            ],
          ),
        ),
        child: PageView.builder(
          controller: PageController(
              viewportFraction: 0.9, initialPage: this.initPosition),
          itemBuilder: (context, position) {
            return EventCardExpanded(
              event: this.events[position],
              showResults: showResults,
            );
          },
          itemCount: this.events.length,
        ),
      ),
    );
  }
}
