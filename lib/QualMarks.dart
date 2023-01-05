import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:phone_otp_ui/widgets/text_heading.dart';

class QualMarks extends StatefulWidget {
  final String? FirstQual;
  final String? SecondQual;
  final String? ThirdQual;
  final String? FourthQual;
  const QualMarks({
    super.key,
    required this.FirstQual,
    required this.SecondQual,
    required this.ThirdQual,
    required this.FourthQual,
  });

  @override
  State<QualMarks> createState() => _QualMarksState();
}

class _QualMarksState extends State<QualMarks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            widget.FirstQual != null
                ? Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          HeadingText(
                            text: "Details about ",
                            fontWeight: FontWeight.bold,
                            size: 30,
                          ),
                        ],
                      ),
                      HeadingText(
                        text: "Qualifications",
                        fontWeight: FontWeight.bold,
                        size: 30,
                      ),
                    ],
                  )
                : Container()
          ],
        ),
      )),
    );
  }
}
