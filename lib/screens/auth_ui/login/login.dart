import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sasta_mart/constants/constants.dart';
import 'package:sasta_mart/firebase_helper/firebase_auth_helper/firebase_auth_helper.dart';
import 'package:sasta_mart/screens/auth_ui/home/home.dart';
import 'package:sasta_mart/screens/auth_ui/signup/signup.dart';
import 'package:sasta_mart/widgets/top_titles/top_titles.dart';

import '../../../constants/routes.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isshowPass = true;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(

        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TopTitle(title: "Login", subtitle: "Welcome to Sasta Mart.."),
            SizedBox(
              height: mediaQuery.size.width * 0.05,
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,

              obscureText: false,
              decoration: const InputDecoration(
                  hintText: "Email", prefixIcon: Icon(Icons.email_rounded)),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              keyboardType: TextInputType.visiblePassword,
              obscureText: isshowPass,
              decoration: InputDecoration(
                hintText: "Password",
                prefixIcon: const Icon(Icons.lock_outline_rounded),
                suffixIcon: CupertinoButton(
                  onPressed: () {
                    setState(() {
                      isshowPass = !isshowPass;
                    });
                  },
                  padding: EdgeInsets.zero,
                  child: const Icon(
                    Icons.visibility_rounded,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Align(
              alignment: Alignment.topRight,
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () async {
                bool isValidated = loginVaildation(email.text, password.text);
                if (isValidated) {
                  bool isLogined = await FirebaseAuthHelper.instance
                      .login(email.text, password.text, context);
                  if (isLogined) {
                    Routes.instance.pushAndRemoveUntil(
                        widget: HomePage(), context: context);
                  }
                }
              },
              child: const Align(
                alignment: Alignment.center,
                child: Text("LOGIN"),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            const Center(
              child: Text("Don't Have an Account?"),
            ),
            CupertinoButton(
              onPressed: () {
                Routes.instance.push(widget: const Signup(), context: context);
              },
              child: Center(
                child: Text(
                  "Create an Account",
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
