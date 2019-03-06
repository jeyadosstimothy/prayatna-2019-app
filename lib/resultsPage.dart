import 'package:flutter/material.dart';
import 'team.dart';
import 'request.dart';
import 'search.dart';

List<Team> teamDetails;

class ResultsPageRoute extends MaterialPageRoute<String> {
  ResultsPageRoute({String title, String id})
      : super(
          builder: (context) => new ResultsPage(title: title, id: id),
        );

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(opacity: animation, child: child);
  }
}

class ResultsPage extends StatefulWidget {
  final String title, id;

  ResultsPage({Key key, this.title, this.id}) : super(key: key);

  _ResultsPageState createState() => _ResultsPageState(
        title: this.title,
        id: this.id,
      );
}

class _ResultsPageState extends State<ResultsPage>
    implements HttpRequestContract {
  final String title, id;
  bool resultsReady;
  HttpRequest request;

  _ResultsPageState({this.title, this.id});

  @override
  void initState() {
    super.initState();
    resultsReady = false;
    teamDetails = List<Team>();
    request = HttpRequest(this);
    request.loadResults();
  }

  String getEventId() => this.id;

  void onLoadResultsComplete(List<Team> teams, int selected) {
    setState(() {
      teamDetails = teams;
      resultsReady = true;
    });
  }

  void onLoadResultsError(String errorMessage) {
    Navigator.pop(context, errorMessage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: DataSearch());
            },
          )
        ],
      ),
      body: resultsReady
          ? new ListView.separated(
              itemCount: teamDetails.length + 1,
              itemBuilder: (BuildContext context, int index) {
                if (index == 0) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: ResultsContent(
                      team: Team(
                        rank: 'Rank',
                        members: <String>['Team Members'],
                        marks: 'Score',
                        style: Theme.of(context).textTheme.subtitle,
                      ),
                    ),
                  );
                }
                return new ResultsContent(team: teamDetails[index - 1]);
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider();
              },
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}

class ResultsContent extends StatelessWidget {
  final Team team;

  ResultsContent({Key key, @required this.team})
      : assert(team != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = this.team.style;

    final members = List<Widget>.from(team.members.map((name) => Center(
          child: Text(name, style: textStyle),
        )));
    final marksColumn = <Widget>[
      Center(child: Text("${team.marks}", style: textStyle)),
    ];
    if (team.isSelected) {
      marksColumn.add(Center(child: Text('Selected', style: textStyle)));
    }
    return Column(children: <Widget>[
      Row(children: <Widget>[
        SizedBox(
          width: 60,
          child: Center(
            child: Text("${team.rank}", style: textStyle),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            textBaseline: TextBaseline.alphabetic,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: members,
          ),
        ),
        SizedBox(
          width: 80,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: marksColumn,
          ),
        ),
      ]),
    ]);
  }
}
