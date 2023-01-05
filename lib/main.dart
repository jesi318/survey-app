import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:phone_otp_ui/ID_proof.dart';
import 'package:phone_otp_ui/OtherProf.dart';
import 'package:phone_otp_ui/professional_EdQualification.dart';
import 'package:phone_otp_ui/widgets/dob.dart';
import 'package:phone_otp_ui/personal_details.dart';
import 'package:phone_otp_ui/phone.dart';
import 'package:phone_otp_ui/user_information_screen.dart';
import 'package:phone_otp_ui/verify.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(GetMaterialApp(
    initialRoute: 'otherprofed',
    debugShowCheckedModeBanner: false,
    routes: {
      'phone': (context) => MyPhone(),
      'verify': (context) => MyVerify(),
      'home': (context) => UserInfromationScreen(),
      'id': (context) => IDProof(),
      'persdetails': (context) => PersDetails(),
      'profeducation': (context) => ProfEd(),
      'otherprofed': (context) => otherProf(),
    },
  ));
}
