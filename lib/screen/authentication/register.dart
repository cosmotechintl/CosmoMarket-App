import 'package:cosmomarket/customWidget/dropdown.dart';
import 'package:datepicker_dropdown/datepicker_dropdown.dart';
import 'package:datepicker_dropdown/order_format.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../customWidget/custom_textfield.dart';
import '../../theme/theme.dart';
import 'login.dart';
import 'otp_screen.dart';

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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top:15.0),
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
                    const SizedBox(height: 50),
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
                                          context: context
                                      )
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width * 0.05,
                                  ),
                                  Expanded(
                                      child: CustomTextField.create(
                                          label: 'Last Name',
                                          controller: _lastnameController,
                                          changeFocus: _mblFocus,
                                          focus: _lastnameFocus,
                                          context: context)),
                                ],
                              ),
                              CustomTextField.create(
                                  label: 'Mobile Number',
                                  controller: _mblNumberController,
                                  changeFocus: _emailFocus,
                                  inputType: TextInputType.number,
                                  focus: _mblFocus,
                                  context: context
                              ),

                              CustomTextField.create(
                                  label: 'Email',
                                  controller: _emailController,
                                  changeFocus: _emailFocus,
                                  inputType: TextInputType.emailAddress,
                                  validator: (value){
                                      if (value == null || value.isEmpty) {
                                      return 'Please enter your email';
                                      }
                                      if (!EmailValidator.validate(value)) {
                                      return 'Enter a valid email address';
                                      }
                                      return null;
                                  },
                                  focus: _emailFocus,
                                  context: context
                              ),
                              SizedBox(
                                  height:MediaQuery.of(context).size.height * 0.03
                              ),
                              TextFormField(
                                controller: _passwordController,
                                focusNode: _passwordFocus,
                                obscureText: true,
                                decoration: const InputDecoration(
                                  label:Text("Password")
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
                                  onPressed: _next,
                                  child: const Text('Next')
                              ),
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
                    text: const TextSpan(
                      text: "Already have an account?", // Default style
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Color(0xFFA0A8AB),
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Login',
                          style: TextStyle(
                              fontSize: 15.0,
                              color: Color(0xFF22577A),
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _next() {
    // if (_registerFormKey.currentState?.validate() ?? false) {
    //   // String email = _firstnameController.text;
    //   // String password = _lastnameController.text;
    //   // debugPrint("Email: $email, Password: $password");
    // }
    Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const RegisterNext()
        )
    );
  }

  void _login() {
    Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const Login())
    );
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
                const SizedBox(height: 20),
                Form(
                    key: _registerNextFormKey,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Select DOB:",
                            style:GoogleFonts.inter(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w700,
                            color:AppTheme.primaryColor
                          )
                          ),
                          SizedBox(
                            height:8.0
                          ),
                          DropdownDatePicker(
                            locale: "en",
                            dateformatorder: OrderFormat.YMD, // default is myd
                            inputDecoration: const InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                borderSide: BorderSide(
                                    color: Color(0xFFA9C5CF)
                                )
                                ),
                                helperText: '',
                                contentPadding: EdgeInsets.all(10.0),
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
                            height: MediaQuery.sizeOf(context).width * 0.02,
                          ),
                          DropDown(
                              items: gender,
                              onChanged: (String? value) {
                                selectedGender = value;
                              },
                              hintText: "Select Gender"),
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
                text: const TextSpan(
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
    if (_registerNextFormKey.currentState?.validate() ?? false) {
      // String email = _firstnameController.text;
      // String password = _lastnameController.text;
      // debugPrint("Email: $email, Password: $password");
      Navigator.push(context, MaterialPageRoute(builder: (_) => const OTPScreen()));
    }
  }
}
