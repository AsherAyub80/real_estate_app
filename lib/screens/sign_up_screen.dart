import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:real_estate_app/components/auth_button.dart';
import 'package:real_estate_app/components/sign_in_icon.dart';

class SignUpScreen extends StatefulWidget {
  final Function()? onTap;
  SignUpScreen({super.key, this.onTap});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController signUpEmailCont = TextEditingController();

  TextEditingController passcCont = TextEditingController();

  TextEditingController confrimPassCont = TextEditingController();
  bool isPassVis = true;
  bool isPassVisible = true;

  void userSignUp() async {
    if (confrimPassCont.text == passcCont.text) {
      try {
        // Create user with email and password
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: signUpEmailCont.text,
          password: passcCont.text,
        );

        Navigator.pop(context);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'email-already-in-use') {
          return showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Sign Up Failed'),
              content: Text('The email address is already in use.'),
              actions: <Widget>[
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(e.message ?? 'Unknown error')),
          );
        }
        Navigator.pop(context);
      }
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Sign Up Failed'),
          content: Text('Passwords do not match'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ],
        ),
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30.0, right: 350),
              child: IconButton(
                  onPressed: widget.onTap, icon: Icon(Icons.arrow_back_ios)),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'images/agreement.png',
                  height: 80,
                  width: 80,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Create Your Account',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        controller: signUpEmailCont,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          prefixIcon: Padding(
                            padding:
                                const EdgeInsets.only(top: 10.0, left: 10.0),
                            child: FaIcon(
                              FontAwesomeIcons.solidEnvelope,
                              size: 20,
                              color: Colors.black,
                            ),
                          ),
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade200),
                              borderRadius: BorderRadius.circular(10)),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade200),
                              borderRadius: BorderRadius.circular(10)),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade200),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextField(
                        obscureText: isPassVis,
                        keyboardType: TextInputType.visiblePassword,
                        controller: passcCont,
                        decoration: InputDecoration(
                          suffixIcon: Padding(
                            padding: const EdgeInsets.all(13.0),
                            child: InkWell(
                                onTap: () {
                                  setState(() {
                                    isPassVis = !isPassVis;
                                  });
                                },
                                child: FaIcon(
                                  size: 20,
                                  isPassVis
                                      ? FontAwesomeIcons.solidEyeSlash
                                      : FontAwesomeIcons.solidEye,
                                )),
                          ),
                          hintText: 'Password',
                          prefixIcon: Padding(
                            padding:
                                const EdgeInsets.only(top: 10.0, left: 10.0),
                            child: FaIcon(
                              FontAwesomeIcons.lock,
                              size: 20,
                              color: Colors.black,
                            ),
                          ),
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade200),
                              borderRadius: BorderRadius.circular(10)),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade200),
                              borderRadius: BorderRadius.circular(10)),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade200),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 20),
                      child: TextField(
                        obscureText: isPassVisible,
                        keyboardType: TextInputType.visiblePassword,
                        controller: confrimPassCont,
                        decoration: InputDecoration(
                          suffixIcon: Padding(
                            padding: const EdgeInsets.all(13.0),
                            child: InkWell(
                                onTap: () {
                                  setState(() {
                                    isPassVisible = !isPassVisible;
                                  });
                                },
                                child: FaIcon(
                                  size: 20,
                                  isPassVisible
                                      ? FontAwesomeIcons.solidEyeSlash
                                      : FontAwesomeIcons.solidEye,
                                )),
                          ),
                          hintText: 'Confirm Password',
                          prefixIcon: Padding(
                            padding:
                                const EdgeInsets.only(top: 10.0, left: 10.0),
                            child: FaIcon(
                              FontAwesomeIcons.lock,
                              size: 20,
                              color: Colors.black,
                            ),
                          ),
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade200),
                              borderRadius: BorderRadius.circular(10)),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade200),
                              borderRadius: BorderRadius.circular(10)),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade200),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size / 30,
                    ),
                    AuthButton(
                      size: size,
                      text: 'Sign Up',
                      onTap: userSignUp,
                    ),
                    SizedBox(
                      height: size / 30,
                    ),
                    Text(
                      'Forget the Password?',
                      style: TextStyle(
                          color: Color(0xff246BFD),
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: size / 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 120,
                          child: Divider(
                            indent: 2,
                            endIndent: 2,
                            thickness: 2,
                            height: 2,
                            color: Colors.grey.shade200,
                          ),
                        ),
                        Text(
                          'or continue with',
                          style: TextStyle(
                              color: Colors.grey.shade600,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: 120,
                          child: Divider(
                            indent: 2,
                            endIndent: 2,
                            thickness: 2,
                            height: 2,
                            color: Colors.grey.shade200,
                          ),
                        ),
                      ],
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          icon.length,
                          (index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Image.asset(
                                  icon[index],
                                  height: 10,
                                  width: 10,
                                ),
                              ),
                              height: 60,
                              width: 90,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.grey.shade300),
                                  borderRadius: BorderRadius.circular(12)),
                            ),
                          ),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account?",
                          style: TextStyle(color: Colors.grey.shade600),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        InkWell(
                          onTap: widget.onTap,
                          child: Text('Sign in',
                              style: TextStyle(
                                  color: Color(0xff246BFD),
                                  fontWeight: FontWeight.w500)),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
