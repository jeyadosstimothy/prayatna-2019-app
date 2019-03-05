import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';
import 'team.dart';

abstract class HttpRequestContract {
  String getEventId();
  void onLoadResultsComplete(List<Team> teams, int selected);
  void onLoadResultsError(String errorMessage);
}

class HttpRequest {
  final HttpRequestContract view;
  HttpRequest(this.view);

  void loadResults() async {
    try {
      await InternetAddress.lookup('google.com');
    } on SocketException catch (_) {
      this.view.onLoadResultsError('Connect to Internet and try again!');
      return;
    }

    String url = 'http://34.73.200.44/getResult';
    String body = '{"event": "${this.view.getEventId()}"}';

    print('Sending request to server');
    http
        .post(Uri.encodeFull(url),
            headers: {
              "Accept": "application/json",
              HttpHeaders.contentTypeHeader: 'application/json'
            },
            body: body)
        .then((response) {
      print('Request Body: ' + body);
      print('Response: ' + response.body.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        List responseList = (json.decode(response.body) as List);
        int selected = responseList.removeLast()['selected'];
        List<Team> teams = responseList.map((team) {
          return Team(
            rank: team['rank'].toString(),
            members: team['names'],
            marks: team['marks'].toString(),
            isSelected: (team['rank'] < selected) ? true : false,
          );
        }).toList();
        this.view.onLoadResultsComplete(teams, selected);
      } else {
        this.view.onLoadResultsError(response.body.toString());
      }
    }).catchError((error) {
      print(error);
      this.view.onLoadResultsError('Unexpected error occured');
    });
  }
}
