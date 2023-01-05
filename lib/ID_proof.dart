import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:phone_otp_ui/personal_details.dart';
import 'package:phone_otp_ui/widgets/dob.dart';
import 'package:phone_otp_ui/widgets/text_heading.dart';

class IDProof extends StatefulWidget {
  const IDProof({super.key});

  @override
  State<IDProof> createState() => _IDProofState();
}

class _IDProofState extends State<IDProof> {
  final formKey = GlobalKey<FormState>();
  String? IDtype;
  PlatformFile? pickedFile;
  PlatformFile? pickedFile2;

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

  Future uploadFile1() async {
    final path =
        'files/${FirebaseAuth.instance.currentUser!.uid}/$IDtype/front';
    final file = File(pickedFile!.path!);

    final ref = FirebaseStorage.instance.ref().child(path);
    ref.putFile(file);
  }

  Future uploadFile2() async {
    final path = 'files/${FirebaseAuth.instance.currentUser!.uid}/$IDtype/back';
    final file = File(pickedFile2!.path!);

    final ref = FirebaseStorage.instance.ref().child(path);
    ref.putFile(file);
  }

  @override
  Widget build(BuildContext context) {
    final AadharController = TextEditingController();
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 3.0),
          child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(
                height: 15,
              ),
              HeadingText(
                text: "DOB and ID Proof",
                fontWeight: FontWeight.bold,
                size: 30,
              ),
              SizedBox(
                height: 15,
              ),
              DobID(),
              Container(
                  width: MediaQuery.of(context).size.width,
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  margin: const EdgeInsets.only(top: 20),
                  child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          RadioListTile(
                            title: Text("Aadhar"),
                            value: "Aadhar",
                            groupValue: IDtype,
                            onChanged: (value) {
                              setState(() {
                                IDtype = value.toString();
                              });
                            },
                          ),
                          RadioListTile(
                            title: Text("PAN"),
                            value: "Pan card",
                            groupValue: IDtype,
                            onChanged: (value) {
                              setState(() {
                                IDtype = value.toString();
                              });
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          IDtype != null
                              ? TextFormField(
                                  decoration: InputDecoration(
                                    labelText: "Enter $IDtype",
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty ||
                                        !RegExp(r'^[a-zA-Z0-9]+$')
                                            .hasMatch(value)) {
                                      return "Enter correct Number";
                                    } else {
                                      return null;
                                    }
                                  })
                              : Container(),
                          SizedBox(height: 10),
                        ],
                      ))),
              ElevatedButton(
                onPressed: () {
                  // if (formKey.currentState!.validate()) {
                  //   // Get.snackbar("Title", "message",
                  //   //     titleText: Text("title"),
                  //   //     messageText: Text("Textt"),
                  //   //     snackPosition: SnackPosition.BOTTOM);
                  selectFile();
                  // }
                },
                child: Text("Select file 1"),
              ),
              if (pickedFile != null)
                Container(
                  height: MediaQuery.of(context).size.height * 1 / 2,
                  child: Image.file(File(pickedFile!.path!),
                      width: double.infinity, fit: BoxFit.scaleDown),
                ),
              ElevatedButton(
                onPressed: () {
                  // if (formKey.currentState!.validate()) {
                  //   // Get.snackbar("Title", "message",
                  //   //     titleText: Text("title"),
                  //   //     messageText: Text("Textt"),
                  //   //     snackPosition: SnackPosition.BOTTOM);
                  selectFile2();
                  // }
                },
                child: Text("Select image 2"),
              ),
              if (pickedFile2 != null)
                Container(
                  child: Image.file(File(pickedFile2!.path!),
                      width: double.infinity, fit: BoxFit.scaleDown),
                ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  // if (formKey.currentState!.validate()) {
                  //   // Get.snackbar("Title", "message",
                  //   //     titleText: Text("title"),
                  //   //     messageText: Text("Textt"),
                  //   //     snackPosition: SnackPosition.BOTTOM);
                  uploadFile1();
                  uploadFile2();
                  Get.snackbar("Title", "message",
                      titleText: Text("title"),
                      messageText: Text("Textt"),
                      snackPosition: SnackPosition.BOTTOM);
                  Get.to(PersDetails());
                  // }
                },
                child: Text("Upload Image"),
              ),
            ]),
          ),
        ),
      ),
    );
  }

  Widget textFeld({
    required String hintText,
    required IconData icon,
    required TextInputType inputType,
    required int maxLines,
    required TextEditingController controller,
    required var validator,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        validator: validator,
        cursorColor: Colors.green,
        controller: controller,
        keyboardType: inputType,
        maxLines: maxLines,
        decoration: InputDecoration(
          prefixIcon: Container(
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.green,
            ),
            child: Icon(
              icon,
              size: 20,
              color: Colors.white,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
          ),
          hintText: hintText,
          alignLabelWithHint: true,
          border: InputBorder.none,
          fillColor: Colors.green.shade50,
          filled: true,
        ),
      ),
    );
  }
}
