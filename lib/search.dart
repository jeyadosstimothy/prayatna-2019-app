import 'package:flutter/material.dart';
import 'team.dart';
import 'resultsPage.dart';

class DataSearch extends SearchDelegate<String> {
  List<int> resultsList = new List<int>();

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(backgroundColor: Colors.blue, cursorColor: Colors.white, hintColor: Colors.white, textSelectionColor: Colors.white);
  }
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return new ListView.separated(
      itemCount: resultsList.length + 1,
      itemBuilder: (BuildContext context, int index) {
        if (resultsList.length >= 1) {
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
          return new ResultsContent(team: teamDetails[resultsList[index - 1]]);
        }
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider();
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    resultsList = [];
    if (query.isNotEmpty) {
      for (var index = 0; index < teamDetails.length; index++) {
        List<String> memberList = teamDetails[index].memberList();
        print(memberList);
        memberList.forEach((member) {
          if (member.toLowerCase().startsWith(query) && member != null) {
            resultsList.add(index);
          }
        });
      }
      resultsList.toSet().toList();

      return new ListView.separated(
        itemCount: resultsList.length + 1,
        itemBuilder: (BuildContext context, int index) {
          if (resultsList.length >= 1) {
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
            return new ResultsContent(
                team: teamDetails[resultsList[index - 1]]);
          }
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider();
        },
      );
    } else {
      return Text("");
    }
  }
}
