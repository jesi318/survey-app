import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:phone_otp_ui/widgets/textField.dart';
import 'package:phone_otp_ui/widgets/text_heading.dart';
import 'package:phone_otp_ui/widgets/yesno_button.dart';

class otherProf extends StatefulWidget {
  const otherProf({super.key});

  @override
  State<otherProf> createState() => _otherProfState();
}

class _otherProfState extends State<otherProf> {
  List<TextEditingController> controllers = <TextEditingController>[];
  List<TextEditingController> controllers1 = <TextEditingController>[];
  List<TextEditingController> controllers2 = <TextEditingController>[];

  bool otherdegrees = false;
  String otherdegrees_num = '1';
  var items1 = ['1', '2', '3', '4', '5'];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controllers = List.generate(5, (i) => TextEditingController());
    controllers1 = List.generate(5, (i) => TextEditingController());
    controllers2 = List.generate(5, (i) => TextEditingController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                HeadingText(
                  text: "Other Qualifications",
                  fontWeight: FontWeight.bold,
                  size: 30,
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Yesno_Button(
                child: Text("Any other degrees other than nursing"),
                onAnswer: (ans) {
                  if (ans == "No") {
                    setState(() {
                      otherdegrees = false;
                    });
                  } else {
                    setState(() {
                      otherdegrees = true;
                    });
                  }
                }),
            otherdegrees == true
                ? Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("How many?"),
                          DropdownButton(
                              value: otherdegrees_num,
                              items: items1.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  otherdegrees_num = newValue!;
                                });
                              }),
                        ],
                      ),
                      for (var i = 0; i < int.parse(otherdegrees_num); i++)
                        Column(
                          children: [
                            Text("Qualification " + (i + 1).toString()),
                            textFeld(
                              hintText: "Name of qualification",
                              icon: Icons.school,
                              inputType: TextInputType.name,
                              maxLines: 1,
                              controller: controllers[i],
                            ),
                            textFeld(
                              hintText: "Percentage",
                              icon: Icons.school,
                              inputType: TextInputType.numberWithOptions(
                                  decimal: true),
                              maxLines: 1,
                              controller: controllers1[i],
                            ),
                            textFeld(
                              hintText: "Year of passing",
                              icon: Icons.school,
                              inputType: TextInputType.number,
                              maxLines: 1,
                              controller: controllers2[i],
                            ),
                          ],
                        ),
                    ],
                  )
                : Container(),
            ElevatedButton(
                onPressed: () {
                  for (var i = 0; i < int.parse(otherdegrees_num); i++)
                    print(controllers[i].text);
                },
                child: Text("continue"))
          ],
        ),
      )),
    );
  }
}
