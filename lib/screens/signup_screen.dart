import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_flutter/utils/colors.dart';
import 'package:instagram_flutter/widget/text_field_input.dart';
import '../colors/colors.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    _usernameController.dispose();
    //disposes
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(child: Container(), flex: 2),
              //svg image
              SvgPicture.asset('assets/ic_instagram.svg',
                  color: primaryColor, height: 64),
              const SizedBox(height: 24),
              //add circular widget to accept and show our selected file
              Stack(
                children: [
                  CircleAvatar(
                    radius: 64,
                    backgroundImage: NetworkImage(
                        'https://images.unsplash.com/photo-1644618466863-66e27b12aeb4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=688&q=80'),
                  )
                ],
              ),
              const SizedBox(
                height: 24,
              ),

              //text field for username
              TextFieldInput(
                hintText: 'Username',
                textInputType: TextInputType.text,
                textEditingController: _usernameController,
                isPass: false,
              ),
              const SizedBox(height: 24),
              //text field input for email
              TextFieldInput(
                hintText: 'Email Address',
                textInputType: TextInputType.emailAddress,
                textEditingController: _emailController,
                isPass: false,
              ),
              const SizedBox(height: 24),
              //text field input fopr password
              TextFieldInput(
                hintText: 'Password',
                textInputType: TextInputType.text,
                textEditingController: _passwordController,
                isPass: true,
              ),
              const SizedBox(height: 24),
              // textfield for bio
              TextFieldInput(
                hintText: 'Enter your Bio',
                textInputType: TextInputType.text,
                textEditingController: _bioController,
                isPass: false,
              ),
              const SizedBox(height: 24),
              //button login
              InkWell(
                onTap: () {},
                child: Container(
                  child: const Text('Log in'),
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                    color: blueColor,
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Flexible(child: Container(), flex: 2),
              //transitioning to sign up
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    child: const Text("Dont have an account?"),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    child: const Text(
                      "Sign up",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                  ),
                ),
              ])
            ],
          ),
        ),
      ),
    );
  }
}
