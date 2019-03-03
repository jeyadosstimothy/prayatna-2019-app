import 'package:flutter/material.dart';
import 'eventCard.dart';
import 'eventDetails.dart';

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

  final techEvents = <Event>[
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
    Event(
      title: "DB Dwellers",
      tagline: 'Select * from the universe',
      time: 'Mar 8, 9am - 12pm',
      venue: 'LHC 304',
      description: 'Hello world Hello world Hello world Hello world',
      contact: '96773207736',
      image: 'assets/images/db-dwellers.jpg',
    ),
  ];

  final nonTechEvents = <Event>[
    Event(
      title: 'Kaleidoscope',
      tagline: 'Do you have what it takes?',
      time: 'Mar 8, 9am - 12pm',
      venue: 'LHC 301',
      description: 'Hello world Hello world Hello world Hello world',
      contact: '96773207736',
      image: 'assets/images/kaleidoscope.jpg',
    ),
    Event(
      title: 'Math O Mania',
      tagline: 'Clash of the coders',
      time: 'Mar 8, 9am - 12pm',
      venue: 'LHC 302',
      description: 'Hello world Hello world Hello world Hello world',
      contact: '96773207736',
      image: 'assets/images/math-o-mania.jpg',
    ),
    Event(
      title: "Connexions",
      tagline: 'Rise above the rest',
      time: 'Mar 9, 9am - 12pm',
      venue: 'LHC 303',
      description: 'Hello world Hello world Hello world Hello world',
      contact: '96773207736',
      image: 'assets/images/connexions.png',
    ),
    Event(
      title: "Treasure Hunt",
      tagline: 'Select * from the universe',
      time: 'Mar 8, 9am - 12pm',
      venue: 'LHC 304',
      description: 'Hello world Hello world Hello world Hello world',
      contact: '96773207736',
      image: 'assets/images/treasure-hunt.jpg',
    ),
  ];

  final String techEventsTitle = 'Tech Events',
      nonTechEventsTitle = 'Non Tech Events';
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            this.title,
          ),
          bottom: TabBar(
            tabs: [
              new Tab(
                text: techEventsTitle,
              ),
              new Tab(
                text: nonTechEventsTitle,
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Hero(
                  tag: techEvents[index].title,
                  child: EventCard(
                    event: techEvents[index],
                    onTap: () {
                      Navigator.push(
                        context,
                        DetailsPageRoute(techEventsTitle, techEvents, index),
                      );
                    },
                  ),
                );
              },
              itemCount: techEvents.length,
            ),
            ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Hero(
                  tag: nonTechEvents[index].title,
                  child: EventCard(
                    event: nonTechEvents[index],
                    onTap: () {
                      Navigator.push(
                        context,
                        DetailsPageRoute(
                            nonTechEventsTitle, nonTechEvents, index),
                      );
                    },
                  ),
                );
              },
              itemCount: nonTechEvents.length,
            ),
          ],
        ),
      ),
    );
  }
}
