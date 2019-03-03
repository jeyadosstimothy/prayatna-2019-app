import 'package:flutter/material.dart';
import 'eventDetails.dart';

class Event {
  final String title, tagline, time, venue, description, contact, image;
  Event({
    this.title,
    this.tagline,
    this.time,
    this.venue,
    this.description,
    this.contact,
    this.image,
  });
}

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

class EventCard extends StatelessWidget {
  final Event event;
  final int position;
  final ShapeBorder shape = const RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(12.0),
      topRight: Radius.circular(12.0),
      bottomLeft: Radius.circular(12.0),
      bottomRight: Radius.circular(12.0),
    ),
  );
  EventCard({Key key, @required this.event, @required this.position})
      : assert(event != null),
        assert(position != null),
        super(key: key);

  // This height will allow for all the Card's content to fit comfortably within the card.
  static const double height = 298.0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: height,
              child: Card(
                // This ensures that the Card's children (including the ink splash) are clipped correctly.
                clipBehavior: Clip.antiAlias,
                shape: shape,
                child: InkWell(
                  onTap: () {
                    print('Card was tapped');
                    Navigator.push(context, EventDetails(position));
                  },
                  // Generally, material cards use onSurface with 12% opacity for the pressed state.
                  splashColor:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.12),
                  // Generally, material cards do not have a highlight overlay.
                  highlightColor: Colors.transparent,
                  child: EventContent(event: event),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EventContent extends StatelessWidget {
  final Event event;

  EventContent({Key key, @required this.event})
      : assert(event != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle titleStyle =
        theme.textTheme.title.copyWith(color: Colors.black);
    final TextStyle descriptionStyle = theme.textTheme.subhead;
    final List<Widget> children = <Widget>[
      // Photo and title.
      SizedBox(
        height: 184.0,
        child: Stack(
          children: <Widget>[
            Positioned.fill(
              // In order to have the ink splash appear above the image, you
              // must use Ink.image. This allows the image to be painted as part
              // of the Material and display ink effects above it. Using a
              // standard Image will obscure the ink splash.
              child: Ink.image(
                image: AssetImage(event.image),
                fit: BoxFit.cover,
                child: Container(),
              ),
            ),
          ],
        ),
      ),
      // Description and share/explore buttons.
      Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
        child: DefaultTextStyle(
          softWrap: false,
          overflow: TextOverflow.ellipsis,
          style: descriptionStyle,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  event.title,
                  style: titleStyle,
                ),
              ),
              // three line description
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  event.tagline,
                  style: descriptionStyle.copyWith(color: Colors.black54),
                ),
              ),
            ],
          ),
        ),
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }
}
