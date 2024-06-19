import 'package:cosmomarket/screen/navigation_screen.dart';
import 'package:cosmomarket/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  OtpFieldController otpController = OtpFieldController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
          Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/logo/cosmotech_logo.png",
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Image.asset(
              "assets/logo/img.png",
              width: MediaQuery.of(context).size.width * 0.75,
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Column(
              children: [
                const Text(
                  "OTP",
                  style: TextStyle(
                      color: AppTheme.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                ),
                const Text(
                  "We send you email please check your mail\nand complete OTP code",
                  style: TextStyle(
                      color: AppTheme.primaryColor
                  ),
                  textAlign: TextAlign.center,
                ),
                const Text(
                  "Change Email Address",
                  style: TextStyle(
                      color: AppTheme.primaryColor,
                      decoration: TextDecoration.underline
                  ),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 10.0),
                  child: OTPTextField(
                      controller: otpController,
                      length: 6,
                      width: MediaQuery.of(context).size.width,
                      textFieldAlignment: MainAxisAlignment.spaceAround,
                      fieldWidth: 45,
                      fieldStyle: FieldStyle.box,
                      outlineBorderRadius: 15,
                      style: const TextStyle(fontSize: 17),
                      onChanged: (pin) {
                        debugPrint("Changed: $pin");
                      },
                      onCompleted: (pin) {
                        debugPrint("Completed: $pin");
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                      onPressed: _otpConfirm,
                      child: const Text("Confirm")
                  ),
                )
              ],
            ),
          ]),
        ]));
  }

  void _otpConfirm() {
    Navigator.push(context, MaterialPageRoute(builder: (_) => const NavigationComponent()));
  }
}
