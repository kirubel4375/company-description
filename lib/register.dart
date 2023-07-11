import 'package:company_description/constants.dart';
import 'package:company_description/widgets/custome_input.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class RegisterScreen extends StatefulWidget {
  final void Function(MyRoutePath)? onNavigate;

  const RegisterScreen({super.key, this.onNavigate});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isObscure = true;
  IconData iconData = Icons.visibility;
  void toggleIconData() {
    isObscure = !isObscure;
    if (isObscure) {
      iconData = Icons.visibility;
    } else {
      iconData = Icons.visibility_off;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 13.5),
              CustomInputField(
                controller: phoneController,
                hintText: "Phone number",
                inputType: TextInputType.phone,
              ),
              const SizedBox(height: 13.5),
              CustomInputField(
                controller: emailController,
                hintText: "Enter your email",
                inputType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 13.5),
              CustomInputField(
                controller: passwordController,
                hintText: "Password",
                isObscure: isObscure,
                toggleVisibility: toggleIconData,
                iconData: iconData,
              ),
              const SizedBox(height: 13.5),
              InkWell(
                onTap: () {
                  authController.createUser(emailController.text,
                    passwordController.text, phoneController.text, nameController.text);

                },
                splashColor: Colors.blue,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  width: size.width * .65,
                  height: 50.0,
                  child: const Center(
                    child: Text(
                      "Sign up",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 13.5),
            ],
          ),
        ),
      ),
    );
  }
}
