import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile3_midterm/controller/authcontroller.dart';
import 'package:mobile3_midterm/services.dart/waiting_dialog.dart';

final _formKey = GlobalKey<FormState>();

class LogIn extends StatefulWidget {
  static const String route = '/login';
  static const String name = 'login';
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  late TextEditingController emailController, passwordController;
  late FocusNode emailFn, passwordFn;

  bool obfuscate = true;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    emailFn = FocusNode();
    passwordFn = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    emailFn = FocusNode();
    passwordFn = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        height: screenHeight,
        width: screenWidth,
        child: Stack(
          children: [
            Image.asset(
              'assets/images/logIn/container.png',
              width: screenWidth,
              height: screenHeight,
              fit: BoxFit.fill,
            ),
            Center(
              child: Stack(
                children: [
                  Container(
                    height: screenHeight * 0.4,
                    width: screenWidth * 0.8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(27),
                      image: const DecorationImage(
                        image: AssetImage(
                            'assets/images/logIn/smallContainer.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Login',
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                color: const Color(0xFF262626),
                              ),
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              onEditingComplete: () {
                                passwordFn.requestFocus();
                              },
                              focusNode: emailFn,
                              controller: emailController,
                              decoration: decoration.copyWith(
                                  labelText: "Email",
                                  prefixIcon: const Icon(Icons.person)),
                              validator: MultiValidator([
                                RequiredValidator(
                                    errorText: "A email is required"),
                                EmailValidator(
                                    errorText: "Please enter a valid email")
                                // PatternValidator(
                                //     r'/^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/',
                                //     errorText: "Please enter a valid email")
                              ]).call,
                            ),
                            const SizedBox(height: 15),
                            Flexible(
                              child: TextFormField(
                                keyboardType: TextInputType.visiblePassword,
                                focusNode: passwordFn,
                                controller: passwordController,
                                onEditingComplete: () {
                                  passwordFn.unfocus();
                                },
                                obscureText: obfuscate,
                                decoration: decoration.copyWith(
                                    labelText: "Password",
                                    prefixIcon: const Icon(Icons.lock),
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            obfuscate = !obfuscate;
                                          });
                                        },
                                        icon: Icon(obfuscate
                                            ? Icons.remove_red_eye_rounded
                                            : CupertinoIcons.eye_slash))),
                                validator: MultiValidator([
                                  RequiredValidator(
                                      errorText: "A password is required"),
                                  MinLengthValidator(8,
                                      errorText:
                                          "Password needs to be atleast 8 characters"),
                                  PatternValidator(
                                    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$ %^&*-]).{8,}$',
                                    errorText:
                                        "password must contain atleast one number, one uppercase letter, 1 lowercase letter,and one special character",
                                  )
                                ]).call,
                              ),
                            ),
                            const SizedBox(height: 15),
                            SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: Material(
                                elevation: 10,
                                shadowColor: Colors.grey.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(10),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    backgroundColor: const Color(0xFF176BCE),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  onPressed: () {
                                    onSubmit();
                                  },
                                  child: Text(
                                    "Login",
                                    style: GoogleFonts.inter(
                                      color: const Color(0xFFFFFFFF),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Padding(
                              padding: EdgeInsets.only(left: 35),
                              child: Row(
                                children: [
                                  Text(
                                    'Not Yet Registered?',
                                    style: GoogleFonts.heebo(
                                        color: const Color(0xFF202020),
                                        fontWeight: FontWeight.normal,
                                        fontSize: 14),
                                  ),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        GoRouter.of(context).go('/Register');
                                      },
                                      child: Text(
                                        "Sign Up",
                                        style: GoogleFonts.heebo(
                                            color: const Color(0xFF176BCE),
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14),
                                      ))
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  onSubmit() {
    if (_formKey.currentState?.validate() ?? false) {
      try {
        WaitingDialog.show(context,
            future: AuthController.I.login(
                emailController.text.trim(), passwordController.text.trim()));
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Invalid username or password")));
      }
    }
  }

  final OutlineInputBorder _baseBorder = const OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey),
    borderRadius: BorderRadius.all(Radius.circular(10)),
  );

  InputDecoration get decoration => InputDecoration(
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      filled: true,
      fillColor: Colors.white,
      errorMaxLines: 3,
      disabledBorder: _baseBorder,
      enabledBorder: _baseBorder.copyWith(
        borderSide: const BorderSide(color: Colors.white, width: 1),
      ),
      focusedBorder: _baseBorder.copyWith(
        borderSide: const BorderSide(color: Colors.blueAccent, width: 1),
      ),
      errorBorder: _baseBorder.copyWith(
        borderSide: const BorderSide(color: Colors.deepOrangeAccent, width: 1),
      ));
}
