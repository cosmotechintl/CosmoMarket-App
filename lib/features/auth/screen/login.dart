import 'package:cosmomarket/features/auth/screen/register.dart';
import 'package:flutter/material.dart';
import '../../../common/styles/theme.dart';
import '../../../core/screen/navigation_screen.dart';

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                    "assets/logo/cosmotech_logo.png",
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.5,
                  height: MediaQuery.of(context).size.height*0.1,
                ),
                Image.asset(
                    "assets/logo/img.png",
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.75,
                  height: MediaQuery.of(context).size.height*0.1,
                ),
              ],
            ),
            const SizedBox(height:20),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextFormField(
                        controller: _emailController,
                        focusNode: _emailFocus,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: const InputDecoration(
                          labelText: "Your Email",
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                        onEditingComplete: () {
                          FocusScope.of(context).requestFocus(_passwordFocus);
                        },
                      ),
                      SizedBox(
                        height: MediaQuery
                            .of(context)
                            .size
                            .width * 0.05,
                      ),
                      SizedBox(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.95,
                        child: TextFormField(
                          controller: _passwordController,
                          focusNode: _passwordFocus,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelText: "Your Password",
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                          onEditingComplete: () {
                            _login();
                          },
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery
                            .sizeOf(context)
                            .width * 0.07,
                      ),
                      ElevatedButton(
                          onPressed: _login,
                          child: const Text('Login')
                      ),
                      SizedBox(
                        height: MediaQuery
                            .sizeOf(context)
                            .width * 0.03,
                      ),

                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30.0
            ),
            const Text(
              "Forgot Password?",
              style: TextStyle(
                color: Color(0xFF548394)
              ),
            ),
            const SizedBox(
              height:30.0
            ),
            Column(
              children: [
                SizedBox(
                  width:MediaQuery.of(context).size.width*0.75,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 2.0,
                          color: Color(0xFFA0A8AB),
                        )
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                            "Or",
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Color(0xFFA0A8AB)
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 2.0,
                          color: Color(0xFFA0A8AB),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    builtSocialMediaButton("google.png"),
                    builtSocialMediaButton("Facebook-logo.png"),
                    builtSocialMediaButton("linkedin-logo.png"),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery
                  .of(context)
                  .size
                  .width * 0.15,
            ),
           InkWell(
             onTap:_register,
             child: RichText(
               text:const TextSpan(
                 text: "Don't have an account? ", // Default style
                 style: TextStyle(
                     fontSize: 14.0,
                     color:Color(0xFFA0A8AB),
                 ),
                 children: <TextSpan>[
                   TextSpan(
                     text: 'Sign Up',
                     style: TextStyle(
                      fontSize: 15.0,
                        color:Color(0xFF22577A),
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
    );
  }

  void _login() {
    // if (_formKey.currentState?.validate() ?? false) {
    //   String email = _emailController.text;
    //   String password = _passwordController.text;
    //   debugPrint("Email: $email, Password: $password");
    // }
    Navigator.pushReplacement(context,
      MaterialPageRoute(
          builder: (_)=>const NavigationComponent()
      )
    );
  }


  Widget builtSocialMediaButton(String img){
      return InkWell(
          child: Card(
              color:AppTheme.bgColor,
              child:Padding(
                padding: const EdgeInsets.all(9.0),
                child: Image.asset(
                  "assets/logo/$img",
                  height: MediaQuery.of(context).size.height*0.05,
                  width: MediaQuery.of(context).size.width*0.1,
                ),
              )
          ),
      );
  } 

  void _register() {
      Navigator.push(context,
          MaterialPageRoute(
          builder:(_)=>const Register()
      )
      );
  }
}
