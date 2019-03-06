import 'package:flutter/material.dart';

class Team {
  final String marks, rank;
  final bool isSelected;
  final List<String> members;
  final TextStyle style;

  Team({
    this.members,
    this.marks,
    this.rank,
    this.style,
    this.isSelected = false,
  });

  int length() {
    return members.length;
  }

  List<String> memberList(){
    return this.members;
  }
}
