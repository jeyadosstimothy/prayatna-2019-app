import 'package:flutter/material.dart';
import 'eventCard.dart';

class DetailsPageRoute extends MaterialPageRoute {
  DetailsPageRoute(String title, List events, int initPosition)
      : super(
          builder: (context) => new DetailsPage(
                title: title,
                events: events,
                initPosition: initPosition,
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

  DetailsPage({this.title, this.initPosition, this.events});

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: new Text(this.title)),
      body: PageView.builder(
        controller: PageController(
            viewportFraction: 0.875, initialPage: this.initPosition),
        itemBuilder: (context, position) {
          return Hero(
            tag: this.events[position].title,
            child: EventCard(
              event: this.events[position],
            ),
          );
        },
        itemCount: this.events.length,
      ),
      // floatingActionButtonLocation:
      //     FloatingActionButtonLocation.centerFloat, //centerDocked
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: () {},
      //   tooltip: 'View Results',
      //   icon: Icon(Icons.assessment), //calendar_view_day, dehaze, equalizer
      //   label: Text('View Results'),
      //   elevation: 2.0,
      // ),
      // bottomNavigationBar: BottomAppBar(
      //   child: new Row(
      //     mainAxisSize: MainAxisSize.max,
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: <Widget>[
      //       IconButton(
      //         icon: Icon(Icons.phone),
      //         onPressed: () {},
      //       ),
      //       IconButton(
      //         icon: Icon(Icons.search),
      //         onPressed: () {},
      //       )
      //     ],
      //   ),
      // ),
    );
  }
}
