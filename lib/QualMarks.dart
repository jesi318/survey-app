import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:phone_otp_ui/OtherProf.dart';
import 'package:phone_otp_ui/widgets/textField.dart';
import 'package:phone_otp_ui/widgets/text_heading.dart';

class QualMarks extends StatefulWidget {
  final String? FirstQual;
  final String? SecondQual;
  final String? ThirdQual;
  final String? FourthQual;
  final String? FifthQual;
  const QualMarks({
    super.key,
    required this.FirstQual,
    required this.SecondQual,
    required this.ThirdQual,
    required this.FourthQual,
    required this.FifthQual,
  });

  @override
  State<QualMarks> createState() => _QualMarksState();
}

class _QualMarksState extends State<QualMarks> {
  final FistQualyearcontroller = TextEditingController();
  final SecondQualyearcontroller = TextEditingController();
  final ThirdQualyearcontroller = TextEditingController();
  final FourthQualyearcontroller = TextEditingController();
  final FifthQualyearcontroller = TextEditingController();
  PlatformFile? pickedFile;
  PlatformFile? pickedFile2;
  PlatformFile? pickedFile3;
  PlatformFile? pickedFile4;
  PlatformFile? pickedFile5;

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles();

    if (result == null) return;

    setState(() {
      pickedFile = result.files.first;
    });
  }

  Future selectFile2() async {
    final result = await FilePicker.platform.pickFiles();

    if (result == null) return;

    setState(() {
      pickedFile2 = result.files.first;
    });
  }

  Future selectFile3() async {
    final result = await FilePicker.platform.pickFiles();

    if (result == null) return;

    setState(() {
      pickedFile3 = result.files.first;
    });
  }

  Future selectFile4() async {
    final result = await FilePicker.platform.pickFiles();

    if (result == null) return;

    setState(() {
      pickedFile4 = result.files.first;
    });
  }

  Future selectFile5() async {
    final result = await FilePicker.platform.pickFiles();

    if (result == null) return;

    setState(() {
      pickedFile5 = result.files.first;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Column(
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
            ),

            //First qual upload
            widget.FirstQual != null
                ? Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      HeadingText(
                        text: widget.FirstQual.toString() + " Details",
                        fontWeight: FontWeight.w700,
                        size: 20,
                      ),
                      textFeld(
                          hintText: "Year of Passing",
                          icon: Icons.school,
                          inputType: TextInputType.number,
                          maxLines: 1,
                          controller: FistQualyearcontroller),
                      ElevatedButton(
                          onPressed: selectFile,
                          child: Text("Upload marks card"))
                    ],
                  )
                : Container(),

            //second qual upload
            widget.SecondQual != "NA"
                ? Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      HeadingText(
                        text: widget.SecondQual.toString() + " Details",
                        fontWeight: FontWeight.w700,
                        size: 20,
                      ),
                      textFeld(
                          hintText: "Year of Passing",
                          icon: Icons.school,
                          inputType: TextInputType.number,
                          maxLines: 1,
                          controller: SecondQualyearcontroller),
                      ElevatedButton(
                          onPressed: selectFile2,
                          child: Text("Upload marks card"))
                    ],
                  )
                : Container(),

            //Third qual upload
            widget.ThirdQual != "NA"
                ? Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      HeadingText(
                        text: widget.ThirdQual.toString() + " Details",
                        fontWeight: FontWeight.w700,
                        size: 20,
                      ),
                      textFeld(
                          hintText: "Year of Passing",
                          icon: Icons.school,
                          inputType: TextInputType.number,
                          maxLines: 1,
                          controller: ThirdQualyearcontroller),
                      ElevatedButton(
                          onPressed: selectFile3,
                          child: Text("Upload marks card"))
                    ],
                  )
                : Container(),

            //Fourth Qual upload
            widget.FourthQual != "NA"
                ? Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      HeadingText(
                        text: widget.FourthQual.toString() + " Details",
                        fontWeight: FontWeight.w700,
                        size: 20,
                      ),
                      textFeld(
                          hintText: "Year of Passing",
                          icon: Icons.school,
                          inputType: TextInputType.number,
                          maxLines: 1,
                          controller: FourthQualyearcontroller),
                      ElevatedButton(
                          onPressed: selectFile4,
                          child: Text("Upload marks card"))
                    ],
                  )
                : Container(),

            //Fifth Qual upload

            widget.FifthQual != "NA"
                ? Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      HeadingText(
                        text: widget.FifthQual.toString() + " Details",
                        fontWeight: FontWeight.w700,
                        size: 20,
                      ),
                      textFeld(
                          hintText: "Year of Passing",
                          icon: Icons.school,
                          inputType: TextInputType.number,
                          maxLines: 1,
                          controller: FifthQualyearcontroller),
                      ElevatedButton(
                          onPressed: selectFile3,
                          child: Text("Upload marks card"))
                    ],
                  )
                : Container(),

            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Get.to(otherProf());
                },
                child: Text("Continue"))
          ],
        ),
      )),
    );
  }
}
