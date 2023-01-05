import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class otherProf extends StatefulWidget {
  const otherProf({super.key});

  @override
  State<otherProf> createState() => _otherProfState();
}

class _otherProfState extends State<otherProf> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [],
        ),
      )),
    );
  }
}
