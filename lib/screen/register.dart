import 'package:cosmomarket/customWidget/DropDown.dart';
import 'package:cosmomarket/screen/otp_screen.dart';
import 'package:datepicker_dropdown/datepicker_dropdown.dart';
import 'package:datepicker_dropdown/order_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../customWidget/customTextField.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _mblNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _firstnameFocus = FocusNode();
  final FocusNode _lastnameFocus = FocusNode();
  final FocusNode _mblFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
                SizedBox(height: 20),
                Form(
                    key: _registerFormKey,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                  child: CustomTextField.create(
                                      label: 'First Name',
                                      controller: _firstnameController,
                                      changeFocus: _lastnameFocus,
                                      focus: _firstnameFocus,
                                      context: context)),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.05,
                              ),
                              Expanded(
                                  child: CustomTextField.create(
                                      label: 'Last Name',
                                      controller: _lastnameController,
                                      changeFocus: _lastnameFocus,
                                      focus: _firstnameFocus,
                                      context: context)),
                            ],
                          ),
                          CustomTextField.create(
                              label: 'Mobile Number',
                              controller: _mblNumberController,
                              changeFocus: _emailFocus,
                              focus: _mblFocus,
                              context: context),
                          CustomTextField.create(
                              label: 'Email',
                              controller: _emailController,
                              changeFocus: _emailFocus,
                              focus: _emailFocus,
                              context: context),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.03),
                          TextFormField(
                            controller: _passwordController,
                            focusNode: _passwordFocus,
                            decoration: InputDecoration(
                              labelText: "Password",
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0)),
                                  borderSide:
                                      BorderSide(color: Color(0xFFA9C5CF))),
                              contentPadding: EdgeInsets.all(15.0),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'password is empty';
                              }
                              return null;
                            },
                            onEditingComplete: () {
                              _next();
                            },
                          ),
                          SizedBox(
                            height: MediaQuery.sizeOf(context).width * 0.07,
                          ),
                          ElevatedButton(
                              onPressed: _next, child: const Text('next')),
                        ],
                      ),
                    ))
              ],
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).width * 0.04,
            ),
            GestureDetector(
              onTap: _login,
              child: RichText(
                text: TextSpan(
                  text: "Already have an account? ", // Default style
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Color(0xFFA0A8AB),
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'login',
                      style: TextStyle(
                          fontSize: 15.0,
                          color: Color(0xFF22577A),
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _next() {
    if (_registerFormKey.currentState?.validate() ?? false) {
      // String email = _firstnameController.text;
      // String password = _lastnameController.text;
      // debugPrint("Email: $email, Password: $password");
    }
    Navigator.push(context, MaterialPageRoute(builder: (_) => RegisterNext()));
  }

  void _login() {

  }
}

class RegisterNext extends StatefulWidget {
  const RegisterNext({super.key});

  @override
  State<RegisterNext> createState() => _RegisterNextState();
}

class _RegisterNextState extends State<RegisterNext> {
  final GlobalKey<FormState> _registerNextFormKey = GlobalKey<FormState>();


  String? selectedGender;

  String? selectedBloodGroup;


  int _selectedDay=14;

  int _selectedYear=1980;

  int _selectedMonth=DateTime.now().month;

  @override
  Widget build(BuildContext context) {
    List<String> gender = ["male", "Female", "others"];
    List<String> bloodGroups = [
      'A+',
      'A-',
      'B+',
      'B-',
      'AB+',
      'AB-',
      'O+',
      'O-'
    ];
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
                SizedBox(height: 20),
                Form(
                    key: _registerNextFormKey,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Select your date of birth",
                                      style: TextStyle(fontWeight: FontWeight.bold)
                                  ),
                          DropdownDatePicker(
                            locale: "en",
                            dateformatorder: OrderFormat.YMD, // default is myd
                            inputDecoration: InputDecoration(
                                enabledBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                borderSide: BorderSide(
                                    color: Color(0xFFA9C5CF)
                                )
                                ),
                                helperText: '',
                                contentPadding: const EdgeInsets.all(8.0),
                            ),
                            isFormValidator: true,
                            startYear: 1900,
                            endYear: 2020,
                            width: 10,
                            selectedDay: _selectedDay,
                            selectedMonth: _selectedMonth,
                            selectedYear: _selectedYear,
                            onChangedDay: (value) {
                              _selectedDay = int.parse(value!);
                              debugPrint('onChangedDay: $value');
                            },
                            onChangedMonth: (value) {
                              _selectedMonth = int.parse(value!);
                              debugPrint('onChangedMonth: $value');
                            },
                            onChangedYear: (value) {
                              _selectedYear = int.parse(value!);
                              debugPrint('onChangedYear: $value');
                            }
                          ),
                          SizedBox(
                            height: MediaQuery.sizeOf(context).width * 0.05,
                          ),
                          Text(
                            "Select Gender",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: MediaQuery.sizeOf(context).width * 0.05,
                          ),
                          DropDown(
                              items: gender,
                              onChanged: (String? value) {
                                selectedGender = value;
                              },
                              hintText: "Select gender"),
                          SizedBox(
                            height: MediaQuery.sizeOf(context).width * 0.05,
                          ),
                          Text(
                            "Select Blood Group",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: MediaQuery.sizeOf(context).width * 0.05,
                          ),
                          DropDown(
                              items: bloodGroups,
                              onChanged: (String? value) {
                                selectedBloodGroup = value;
                              },
                              hintText: "Select Blood Group"),
                          SizedBox(
                            height: MediaQuery.sizeOf(context).width * 0.05,
                          ),
                          ElevatedButton(
                              onPressed: _create,
                              child: const Text('Create New Account?')),
                        ],
                      ),
                    ))
              ],
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).width * 0.04,
            ),
            GestureDetector(
              onTap: _login,
              child: RichText(
                text: TextSpan(
                  text: "Already have an account? ", // Default style
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Color(0xFFA0A8AB),
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'login',
                      style: TextStyle(
                          fontSize: 15.0,
                          color: Color(0xFF22577A),
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _login() {

  }

  void _create() {
    Navigator.push(context, MaterialPageRoute(builder: (_) => OTPScreen()));
  }
}
