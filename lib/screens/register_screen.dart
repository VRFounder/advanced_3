import 'package:advanced_3/screens/home_screen.dart';
import 'package:advanced_3/services/secure_service.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../model/account_model.dart';
import '../model/user_model.dart';
import '../services/prefs_service.dart';
import '../widgets/custom_text_field.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController personController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController confirmPasswordController = TextEditingController();
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          width: width,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Let's Get Started!",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const Text(
                "Create account to Q Allure to get all features",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blueGrey,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: CustomTextField(
                  controller: personController,
                  iconData: Icons.person_outline,
                  hintText: "enter your name and surname...",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: CustomTextField(
                  controller: emailController,
                  iconData: Icons.mail_outline,
                  hintText: "enter your mail...",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: CustomTextField(
                  controller: phoneController,
                  iconData: Icons.phone_iphone_outlined,
                  hintText: "enter your phone number...",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: CustomTextField(
                  controller: passwordController,
                  iconData: Icons.lock_outline_rounded,
                  hintText: "enter your password...",
                  isPassword: true,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: CustomTextField(
                  controller: confirmPasswordController,
                  iconData: Icons.lock_outline_rounded,
                  hintText: "confirm your password...",
                  isPassword: true,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(
                onPressed: () {
                  String email = emailController.text;
                  String name = personController.text;
                  String phone = phoneController.text;
                  String password = passwordController.text;
                  String confirmPassword = confirmPasswordController.text;

                  Account user = Account(name: name, phone: phone, email: email, password: password);
                  SecureService.storeAccount(user);
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(width * 0.45, 50),
                  backgroundColor: Colors.redAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(30.0), // Set the border radius
                  ),
                ),
                child: const Text(
                  "LOG IN",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                "or connect using",
                style: TextStyle(color: Colors.blueGrey),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(width * 0.3, 40),
                      backgroundColor: const Color(0xff39579A),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            10.0), // Set the border radius
                      ),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          FontAwesomeIcons.facebookF,
                          color: Colors.white,
                          size: 15,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Facebook",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(width * 0.3, 40),
                      backgroundColor: const Color(0xffDF4A32),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            10.0), // Set the border radius
                      ),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          FontAwesomeIcons.google,
                          color: Colors.white,
                          size: 15,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Google",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account?",
                    style: TextStyle(color: Colors.blueGrey),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
                    },
                    child: const Text(
                      "Login Here",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
