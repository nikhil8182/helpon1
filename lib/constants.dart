

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


// ignore: camel_case_types
class value extends StatelessWidget {
  value({ @required this.values});
  final String values;

  @override
  Widget build(BuildContext context) {
    return Text(values, style: TextStyle(fontSize: 19, color: Colors.red[500]),);
  }
}

class heading extends StatelessWidget {
  heading({@required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text , style: TextStyle(fontSize: 21,fontWeight: FontWeight.bold),);
  }
}