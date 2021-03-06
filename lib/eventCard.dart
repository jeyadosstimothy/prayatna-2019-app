import 'package:flutter/material.dart';
import 'resultsPage.dart';

class Event {
  final String title,
      tagline,
      time,
      venue,
      description,
      contact,
      image,
      teamSize,
      id;
  final Color color;
  Event({
    this.title,
    this.tagline,
    this.time,
    this.venue,
    this.description,
    this.contact,
    this.image,
    this.teamSize,
    this.id,
    this.color,
  });
}

class EventCard extends StatelessWidget {
  final Event event;
  final VoidCallback onTap;
  final ShapeBorder shape = const RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(12.0),
      topRight: Radius.circular(12.0),
      bottomLeft: Radius.circular(12.0),
      bottomRight: Radius.circular(12.0),
    ),
  );
  EventCard({Key key, @required this.event, this.onTap})
      : assert(event != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.bottomRight, // near the top right
            radius: 0.7,
            colors: [
              this.event.color, // yellow sun
              Theme.of(context).canvasColor, // blue sky
            ],
            stops: [0.5, 1.0],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Hero(
            tag: this.event.title,
            child: Column(
              children: <Widget>[
                SizedBox(
                  child: Card(
                    // This ensures that the Card's children (including the ink splash) are clipped correctly.
                    clipBehavior: Clip.antiAlias,
                    shape: shape,
                    child: InkWell(
                      onTap: onTap,
                      // Generally, material cards use onSurface with 12% opacity for the pressed state.
                      splashColor: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withOpacity(0.12),
                      // Generally, material cards do not have a highlight overlay.
                      highlightColor: Colors.transparent,
                      child: EventContent(event: event),
                    ),
                  ),
                ),
              ],
            ),
          ),
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
                image: AssetImage(this.event.image),
                fit: BoxFit.cover,
                child: Container(),
              ),
            ),
          ],
        ),
      ),
      // Description and share/explore buttons.
      Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
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
                  this.event.title,
                  style: titleStyle,
                ),
              ),
              // three line description
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  this.event.tagline,
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

class EventCardExpanded extends StatelessWidget {
  final Event event;
  final VoidCallback onTap;
  final bool showResults;
  final ShapeBorder shape = const RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(12.0),
      topRight: Radius.circular(12.0),
      bottomLeft: Radius.circular(12.0),
      bottomRight: Radius.circular(12.0),
    ),
  );
  EventCardExpanded({
    Key key,
    @required this.event,
    this.onTap,
    this.showResults,
  })  : assert(event != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 8.0),
        child: Hero(
          tag: this.event.title,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                child: Card(
                  // This ensures that the Card's children (including the ink splash) are clipped correctly.
                  clipBehavior: Clip.antiAlias,
                  shape: shape,
                  child: InkWell(
                    onTap: onTap,
                    // Generally, material cards use onSurface with 12% opacity for the pressed state.
                    splashColor: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withOpacity(0.12),
                    // Generally, material cards do not have a highlight overlay.
                    highlightColor: Colors.transparent,
                    child: EventContentExpanded(
                      event: event,
                      showResults: showResults,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EventContentExpanded extends StatelessWidget {
  final Event event;
  final bool showResults;

  EventContentExpanded({Key key, @required this.event, this.showResults})
      : assert(event != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle titleStyle =
        theme.textTheme.title.copyWith(color: Colors.black);
    final TextStyle subheadStyle = theme.textTheme.subhead
        .copyWith(color: Colors.black87, fontWeight: FontWeight.bold);
    final TextStyle descriptionStyle =
        theme.textTheme.body1.copyWith(color: Colors.black54);
    final EdgeInsetsGeometry textPadding = const EdgeInsets.only(bottom: 3.0);
    final List<Widget> children = <Widget>[
      Padding(
        padding: textPadding,
        child: Text(
          this.event.title,
          style: titleStyle,
        ),
      ),
      Padding(
        padding: textPadding,
        child: Text(
          this.event.tagline,
          style: descriptionStyle,
        ),
      ),
      Divider(),
      Padding(
        padding: textPadding,
        child: Text(
          'Date & Time',
          style: subheadStyle,
        ),
      ),
      Padding(
        padding: textPadding,
        child: Text(
          this.event.time,
          style: descriptionStyle,
        ),
      ),
      Divider(),
      Padding(
        padding: textPadding,
        child: Text(
          'Venue',
          style: subheadStyle,
        ),
      ),
      Padding(
        padding: textPadding,
        child: Text(
          this.event.venue,
          style: descriptionStyle,
        ),
      ),
      Divider(),
      Padding(
        padding: textPadding,
        child: Text(
          'Team Size',
          style: subheadStyle,
        ),
      ),
      Padding(
        padding: textPadding,
        child: Text(
          this.event.teamSize,
          style: descriptionStyle,
        ),
      ),
    ];
    if (this.showResults) {
      children.add(
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Center(
            child: ButtonTheme(
              minWidth: 185.0,
              height: 45.0,
              child: FlatButton.icon(
                color: Theme.of(context).primaryColor,
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),
                icon: Icon(
                  Icons.assessment,
                  color: Colors.white,
                ),
                label: Text(
                  'View Results',
                  style: subheadStyle.copyWith(
                      color: Colors.white, fontWeight: FontWeight.normal),
                ),
                onPressed: () async {
                  String value = await Navigator.push(
                    context,
                    ResultsPageRoute(
                      title: this.event.title,
                      id: this.event.id,
                    ),
                  );
                  if (value != null) {
                    final snackBar = SnackBar(content: Text(value));
                    // Find the Scaffold in the Widget tree and use it to show a SnackBar
                    Scaffold.of(context).showSnackBar(snackBar);
                  }
                },
              ),
            ),
          ),
        ),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // Photo and title.
        SizedBox(
          height: 174.0,
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                // In order to have the ink splash appear above the image, you
                // must use Ink.image. This allows the image to be painted as part
                // of the Material and display ink effects above it. Using a
                // standard Image will obscure the ink splash.
                child: Ink.image(
                  image: AssetImage(this.event.image),
                  fit: BoxFit.cover,
                  child: Container(),
                ),
              ),
            ],
          ),
        ),
        // Description and share/explore buttons.
        Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
          child: DefaultTextStyle(
            softWrap: false,
            overflow: TextOverflow.ellipsis,
            style: descriptionStyle,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: children,
            ),
          ),
        ),
      ],
    );
  }
}
