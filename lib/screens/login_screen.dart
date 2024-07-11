import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive/hive.dart';
import 'package:real_estate_app/components/auth_button.dart';
import 'package:real_estate_app/components/sign_in_icon.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class LoginScreen extends StatefulWidget {
  final Function()? onTap;
  const LoginScreen({super.key, this.onTap});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passController = TextEditingController();

  bool isChecked = false;

  bool isPassVisible = true;

  @override
  void initState() {
    super.initState();
    initHive();
  }

  void userSignIn() async {
    showDialog(
      context: context,
      builder: (context) => Center(child: CircularProgressIndicator()),
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passController.text.trim(),
      );
      Navigator.pop(context); // Dismiss the loading dialog
      // Handle successful sign-in, navigate to the next screen or do other actions
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context); // Dismiss the loading dialog
      String errorMessage =
          'Sign-In failed. Please check your credentials and try again.';
      if (e.code == 'user-not-found') {
        errorMessage = 'No user found with this email.';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Wrong password provided for this user.';
      }
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Sign-In Failed'),
          content: Text(errorMessage),
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
    } catch (e) {
      Navigator.pop(context); // Dismiss the loading dialog
      // Handle other exceptions
      print('Error occurred: $e');
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Sign-In Failed'),
          content: Text('Error occurred, please try again.'),
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

  void initHive() async {
    final appDocumentDir =
        await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);
    await Hive.openBox('logindata');

    final box = Hive.box('logindata');
    final savedEmail = box.get('email', defaultValue: '');
    final savedPassword = box.get('password', defaultValue: '');

    if (savedEmail.isNotEmpty && savedPassword.isNotEmpty) {
      emailController.text = savedEmail;
      passController.text = savedPassword;
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
        child: Padding(
          padding: const EdgeInsets.only(
            top: 100,
          ),
          child: Column(
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
                'Login to Your Account',
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
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(top: 10.0, left: 10.0),
                          child: FaIcon(
                            FontAwesomeIcons.solidEnvelope,
                            size: 20,
                            color: Colors.black,
                          ),
                        ),
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade200),
                            borderRadius: BorderRadius.circular(10)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade200),
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade200),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextField(
                      obscureText: isPassVisible,
                      keyboardType: TextInputType.visiblePassword,
                      controller: passController,
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
                        hintText: 'Password',
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(top: 10.0, left: 10.0),
                          child: FaIcon(
                            FontAwesomeIcons.lock,
                            size: 20,
                            color: Colors.black,
                          ),
                        ),
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade200),
                            borderRadius: BorderRadius.circular(10)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade200),
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade200),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            isChecked = !isChecked;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Color(0xff246BFD),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: isChecked
                                ? Icon(
                                    Icons.check,
                                    size: 20.0,
                                    color: Colors.white,
                                  )
                                : Icon(
                                    Icons.check_box_outline_blank,
                                    size: 20.0,
                                    color: Color(0xff246BFD),
                                  ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Remember me',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size / 30,
                  ),
                  AuthButton(
                    size: size,
                    onTap: userSignIn,
                    text: 'Sign in',
                  ),
                  SizedBox(
                    height: size / 30,
                  ),
                  Text(
                    'Forget the Password?',
                    style: TextStyle(
                        color: Color(0xff246BFD), fontWeight: FontWeight.w500),
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
                                border: Border.all(color: Colors.grey.shade300),
                                borderRadius: BorderRadius.circular(12)),
                          ),
                        ),
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Dont't have an account?",
                        style: TextStyle(color: Colors.grey.shade600),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      InkWell(
                        onTap: widget.onTap,
                        child: Text('Sign Up',
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
        ),
      ),
    );
  }
}
