import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phone_otp_ui/ID_proof.dart';
import 'package:phone_otp_ui/widgets/dob.dart';
import 'package:phone_otp_ui/models/user_model.dart';
import 'package:phone_otp_ui/widgets/textField.dart';

class UserInfromationScreen extends StatefulWidget {
  const UserInfromationScreen({super.key});

  @override
  State<UserInfromationScreen> createState() => _UserInfromationScreenState();
}

class _UserInfromationScreenState extends State<UserInfromationScreen> {
  File? image;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  bool agree = false;
  // var continuecolor;

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
  }

  _enableContinue() {
    // setState(() {
    //   continuecolor = Colors.blue;
    // });
  }

  postDetailsToFirestore(String name, String email) async {
    // calling our firestore
    // calling our model
    // sending these values
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = FirebaseAuth.instance.currentUser;

    UserModel userModel = UserModel();
    // writing all the valus

    userModel.uid = user!.uid;
    userModel.name = name;
    userModel.email = email;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Get.snackbar('User info', 'Info stored');
    Get.to(IDProof());
  }

  @override
  Widget build(BuildContext context) {
    //final isLoading =
    //Provider.of<AuthProvider>(context, listen: true).isLoading;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 3.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  margin: const EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      // name field
                      textFeld(
                        hintText: "Full Name",
                        icon: Icons.account_circle,
                        inputType: TextInputType.name,
                        maxLines: 1,
                        controller: nameController,
                      ),

                      // email
                      textFeld(
                        hintText: "Email ID",
                        icon: Icons.email,
                        inputType: TextInputType.emailAddress,
                        maxLines: 1,
                        controller: emailController,
                      ),

                      // bio
                      textFeld(
                        hintText: "Phone Number",
                        icon: Icons.edit,
                        inputType: TextInputType.number,
                        maxLines: 1,
                        controller: phoneController,
                      ),

                      Row(
                        children: [
                          Material(
                            child: Checkbox(
                              value: agree,
                              onChanged: (value) {
                                setState(() {
                                  agree = value ?? false;
                                });
                              },
                            ),
                          ),
                          const Text(
                            'I have read and accept terms and conditions',
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.90,
                    // child: CustomButton(
                    //   text: "Continue",
                    //   onPressed: () => storeData(),
                    // ),
                    child: ElevatedButton(
                      onPressed: agree
                          ? () async {
                              print(agree);
                              await postDetailsToFirestore(nameController.text,
                                  emailController.text.trim());
                            }
                          : null,
                      child: const Text('Continue'),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
