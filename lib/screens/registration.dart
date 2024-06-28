import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile3_midterm/controller/authcontroller.dart';
import 'package:mobile3_midterm/services.dart/waiting_dialog.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  bool _isButtonEnabled = false;
  final _formKey = GlobalKey<FormState>();
  bool obfuscatepass = true;
  bool obfuscatecpass = true;
  late GlobalKey<FormState> formKey;
  late TextEditingController email, password, confirmpassword;
  late FocusNode emailFn, passwordFn, confirmpasswordFn;

  void initState() {
    super.initState();
    formKey = GlobalKey<FormState>();
    email = TextEditingController();
    password = TextEditingController();
    confirmpassword = TextEditingController();
    emailFn = FocusNode();
    passwordFn = FocusNode();
    confirmpasswordFn = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    email = TextEditingController();
    password = TextEditingController();
    confirmpassword = TextEditingController();
    emailFn = FocusNode();
    passwordFn = FocusNode();
    confirmpasswordFn = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Form(
      key: _formKey,
      child: Material(
        child: Stack(
          children: [
            Image.asset(
              'assets/images/logIn/container.png',
              width: double.infinity,
              height: 1095,
              fit: BoxFit.fill,
            ),
            // const Positioned(top: 48, left: 101, child: Text(' ')),
            Center(
              child: Container(
                height: screenHeight * 0.5,
                width: screenWidth * 0.85,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(27),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/logIn/smallContainer.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        'Register',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                          color: const Color(0xFF262626),
                        ),
                      ),
                      const SizedBox(height: 30),
                      TextFormField(
                        onEditingComplete: () {
                          passwordFn.requestFocus();
                        },
                        focusNode: emailFn,
                        controller: email,
                        decoration: decoration.copyWith(
                            labelText: "Email",
                            prefixIcon: const Icon(Icons.person)),
                        validator: MultiValidator([
                          EmailValidator(
                              errorText: "Please select a valid email")
                        ]).call,
                      ),
                      const SizedBox(height: 15),
                      Flexible(
                        child: TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          focusNode: passwordFn,
                          controller: password,
                          onEditingComplete: () {
                            passwordFn.unfocus();
                          },
                          obscureText: obfuscatepass,
                          decoration: decoration.copyWith(
                              labelText: "Password",
                              prefixIcon: const Icon(Icons.lock),
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      obfuscatepass = !obfuscatepass;
                                    });
                                  },
                                  icon: Icon(obfuscatepass
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
                      Flexible(
                        child: TextFormField(
                            keyboardType: TextInputType.visiblePassword,
                            focusNode: confirmpasswordFn,
                            controller: confirmpassword,
                            onEditingComplete: () {
                              passwordFn.unfocus();
                            },
                            obscureText: obfuscatecpass,
                            decoration: decoration.copyWith(
                                labelText: "Confirm Password",
                                prefixIcon: const Icon(Icons.lock),
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        obfuscatecpass = !obfuscatecpass;
                                      });
                                    },
                                    icon: Icon(obfuscatecpass
                                        ? Icons.remove_red_eye_rounded
                                        : CupertinoIcons.eye_slash))),
                            validator: (v) {
                              String? passwordmatched =
                                  password.text == confirmpassword.text
                                      ? null
                                      : "Password did not match";
                              if (passwordmatched != null) {
                                return passwordmatched;
                              } else {
                                MultiValidator([
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
                                ]).call(v);
                              }
                            }),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
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
                              "Register",
                              style: GoogleFonts.inter(
                                color: const Color(0xFFFFFFFF),
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: EdgeInsets.only(left: 25),
                        child: Row(
                          children: [
                            Text(
                              'Already have an account?',
                              style: GoogleFonts.heebo(
                                  color: const Color(0xFF202020),
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14),
                            ),
                            const SizedBox(
                              width: 2,
                            ),
                            TextButton(
                                onPressed: () {
                                  GoRouter.of(context).go('/Login');
                                },
                                child: Text(
                                  "Sign In",
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
    );
  }

  onSubmit() {
    if (_formKey.currentState?.validate() ?? false) {
      WaitingDialog.show(context,
          future: AuthController.I
              .register(email.text.trim(), password.text.trim()));
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
