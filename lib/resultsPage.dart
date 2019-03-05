import 'package:flutter/material.dart';
import 'team.dart';

class ResultsPageRoute extends MaterialPageRoute {
  ResultsPageRoute({String title})
      : super(
          builder: (context) => new ResultsPage(title: title),
        );

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(opacity: animation, child: child);
  }
}

class ResultsPage extends StatefulWidget {
  final String title;

  ResultsPage({Key key, this.title}) : super(key: key);

  _ResultsPageState createState() => _ResultsPageState(title: this.title);
}

class _ResultsPageState extends State<ResultsPage> {
  final String title;
  List<Team> teamDetails;

  _ResultsPageState({this.title});

  @override
  void initState() {
    super.initState();
    teamDetails = <Team>[
      Team(
        members: ['ram', 'sam', 'ram'],
        marks: '70',
        rank: '1',
        isSelected: true,
      ),
      Team(
        members: ['ram', 'sam', 'ram'],
        marks: '60',
        rank: '2',
        isSelected: true,
      ),
      Team(
        members: ['ram', 'sam', 'ram'],
        marks: '40',
        rank: '3',
      ),
      Team(
        members: ['ram', 'sam', 'ram'],
        marks: '20',
        rank: '4',
      ),
      Team(
        members: ['ram', 'sam', 'ram'],
        marks: '70',
        rank: '1',
        isSelected: true,
      ),
      Team(
        members: ['ram', 'sam', 'ram'],
        marks: '60',
        rank: '2',
        isSelected: true,
      ),
      Team(
        members: ['ram', 'sam', 'ram'],
        marks: '40',
        rank: '3',
      ),
      Team(
        members: ['ram', 'sam', 'ram'],
        marks: '20',
        rank: '4',
      ),
      Team(
        members: ['ram', 'sam', 'ram'],
        marks: '70',
        rank: '1',
        isSelected: true,
      ),
      Team(
        members: ['ram', 'sam', 'ram'],
        marks: '60',
        rank: '2',
        isSelected: true,
      ),
      Team(
        members: ['ram', 'sam', 'ram'],
        marks: '40',
        rank: '3',
      ),
      Team(
        members: ['ram', 'sam', 'ram'],
        marks: '20',
        rank: '4',
      ),
      Team(
        members: ['ram', 'sam', 'ram'],
        marks: '70',
        rank: '1',
        isSelected: true,
      ),
      Team(
        members: ['ram', 'sam', 'ram'],
        marks: '60',
        rank: '2',
        isSelected: true,
      ),
      Team(
        members: ['ram', 'sam', 'ram'],
        marks: '40',
        rank: '3',
      ),
      Team(
        members: ['ram', 'sam', 'ram'],
        marks: '20',
        rank: '4',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: new ListView.separated(
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
          return new ResultsContent(team: this.teamDetails[index - 1]);
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider();
        },
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
