// stless short: atless stful

import 'package:flutter/material.dart';

class DestintationWidget extends StatelessWidget {
  DestintationWidget({required this.destinationName});

  final String destinationName;

  @override
  Widget build(BuildContext context) {
    return Text(destinationName);
  }
}
