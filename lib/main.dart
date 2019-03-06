import 'package:flutter/material.dart';
import 'eventCard.dart';
import 'eventDetails.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prayatna',
      home: HomePage(title: "Prayatna '19"),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  final techEvents = <Event>[
    Event(
      title: 'Amazon Intern Hiring',
      id: 'amz',
      tagline: 'Win Internships at Amazon!',
      time: 'Mar 8, 9am - 1pm (Prelims)',
      venue: 'DCL Lab, CT Dept',
      contact: '9442248023',
      image: 'assets/images/amazon-intern-hiring.jpg',
      teamSize: 'Individual participation',
      color: Colors.orange.shade100,
    ),
    Event(
      title: 'OSPC',
      id: 'ospc',
      tagline: "The Problem solver's Paradise",
      time: 'Mar 8, 9am - 1pm (Prelims)',
      venue: 'LHC',
      contact: '8056027690',
      image: 'assets/images/ospc.png',
      teamSize: 'Max. 2 per team',
      color: Colors.blue.shade100,
    ),
    Event(
      title: 'Mini Placement',
      id: 'mp',
      tagline: 'Simulate your Interviews',
      time: 'Mar 8, 9am - 1pm (Prelims)',
      venue: 'LHC',
      contact: '8220952727',
      image: 'assets/images/mini-placement.png',
      teamSize: 'Individual participation',
      color: Colors.teal.shade100,
    ),
    Event(
      title: "DB Dwellers",
      id: 'dbd',
      tagline: 'Select * from the universe',
      time: 'Mar 8, 9am - 1pm (Prelims)',
      venue: 'LHC',
      contact: '7358681208',
      image: 'assets/images/db-dwellers.jpg',
      teamSize: 'Max. 2 per team',
      color: Colors.brown.shade100,
    ),
    Event(
      title: "Parseltongue",
      id: 'python',
      tagline: 'Express your fluency in Python',
      time: 'Mar 8, 9am - 1pm (Prelims)',
      venue: 'LHC',
      contact: '8680851230',
      image: 'assets/images/parseltongue.jpg',
      teamSize: 'Max. 2 per team',
      color: Colors.orange.shade100,
    ),
    Event(
      title: 'Web Hub',
      id: 'web',
      tagline: "What you see is what you get",
      time: 'Mar 9, 9am - 1pm (Prelims)',
      venue: 'LHC',
      contact: '9962396478',
      image: 'assets/images/web-hub.jpg',
      teamSize: 'Max. 2 per team',
      color: Colors.green.shade100,
    ),
    Event(
      title: "Code 'N Chaos",
      id: 'cnc',
      tagline: 'How well do you handle pressure?',
      time: 'Mar 9, 9am - 1pm (Prelims)',
      venue: 'LHC',
      contact: '9500759938',
      image: 'assets/images/code-n-chaos.jpg',
      teamSize: 'Max. 2 per team',
      color: Colors.grey.shade400,
    ),
    Event(
      title: "OOPS! It's Java!",
      id: 'java',
      tagline: 'Are you a jaw-dropping Java developer?',
      time: 'Mar 9, 9am - 1pm (Prelims)',
      venue: 'LHC',
      contact: '9940191782',
      image: 'assets/images/oops-its-java.jpg',
      teamSize: 'Max. 2 per team',
      color: Colors.orange.shade100,
    ),
  ];

  final nonTechEvents = <Event>[
    Event(
      title: 'Kaleidoscope',
      tagline: 'The Mega Event',
      time: 'Mar 8, 9am - 1pm (Prelims)',
      venue: 'LHC',
      contact: '9087907515',
      image: 'assets/images/kaleidoscope.jpg',
      teamSize: 'Individual participation',
      color: Colors.green.shade100,
    ),
    Event(
      title: 'IPL Auction',
      tagline: 'Bid, Win, Have a Grin',
      time: 'Mar 8, 9am - 1pm (Prelims)',
      venue: 'LHC',
      contact: '7871615411',
      image: 'assets/images/ipl-auction.jpg',
      teamSize: 'Max. 2 per team',
      color: Colors.blue.shade100,
    ),
    Event(
      title: "Gaming",
      tagline: 'Life is short, Game more',
      time: 'Mar 8, 9am - 1pm (Prelims)',
      venue: 'LHC',
      contact: '8903426741',
      image: 'assets/images/gaming.png',
      teamSize: 'Individual Participation',
      color: Colors.grey.shade400,
    ),
    Event(
      title: "Connexions",
      tagline: 'Crack it quicker and collar up as connectors',
      time: 'Mar 8, 9am - 1pm (Prelims)',
      venue: 'LHC',
      contact: '9566146252',
      image: 'assets/images/connexions.png',
      teamSize: 'Max. 2 per team',
      color: Colors.red.shade100,
    ),
    Event(
      title: 'BPlan',
      tagline: "It's always wise to look ahead",
      time: 'Mar 9, 9am - 1pm (Prelims)',
      venue: 'LHC',
      contact: '9500504137',
      image: 'assets/images/bplan.jpg',
      teamSize: 'Max. 2 per team',
      color: Colors.blue.shade100,
    ),
    Event(
      title: "Treasure Hunt",
      tagline: 'Clear Vision holds the key',
      time: 'Mar 9, 9am - 1pm (Prelims)',
      venue: 'LHC',
      contact: '9171889661',
      image: 'assets/images/treasure-hunt.jpg',
      teamSize: 'Max. 3 per team',
      color: Colors.amber.shade100,
    ),
    Event(
      title: 'Math O Mania',
      tagline: 'Do you speak the language of the Gods?',
      time: 'Mar 9, 9am - 1pm (Prelims)',
      venue: 'LHC',
      contact: '8072843284',
      image: 'assets/images/math-o-mania.jpg',
      teamSize: 'Max. 2 per team',
      color: Colors.grey.shade400,
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
                return EventCard(
                  event: techEvents[index],
                  onTap: () {
                    Navigator.push(
                      context,
                      DetailsPageRoute(
                        techEventsTitle,
                        techEvents,
                        index,
                        showResults: true,
                      ),
                    );
                  },
                );
              },
              itemCount: techEvents.length,
            ),
            ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return EventCard(
                  event: nonTechEvents[index],
                  onTap: () {
                    Navigator.push(
                      context,
                      DetailsPageRoute(
                        nonTechEventsTitle,
                        nonTechEvents,
                        index,
                      ),
                    );
                  },
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
