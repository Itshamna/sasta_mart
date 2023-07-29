import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sasta_mart/screens/auth_ui/home/home.dart';
import 'package:sasta_mart/screens/auth_ui/login/login.dart';

import '../../../constants/constants.dart';
import '../../../constants/routes.dart';
import '../../../firebase_helper/firebase_auth_helper/firebase_auth_helper.dart';
import '../../../widgets/top_titles/top_titles.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  bool isshowPass = true;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body:
      SingleChildScrollView(child:
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TopTitle(
                  title: "Create Account", subtitle: "Welcome to Sasta Mart.."),
              SizedBox(
                height: mediaQuery.size.width * 0.05,
              ),
              TextFormField(
                controller: name,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                    hintText: "Name", prefixIcon: Icon(Icons.person)),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: email,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: "Email",
                  prefixIcon: Icon(Icons.email_rounded),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: phone,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                    hintText: "Phone", prefixIcon: Icon(Icons.call_rounded)),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: password,
                keyboardType: TextInputType.visiblePassword,
                obscureText: isshowPass,
                decoration: InputDecoration(
                  hintText: "Create Password  ",
                  prefixIcon: Icon(Icons.lock_outline_rounded),
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
                height: 15,
              ),
              const SizedBox(
                height: 5,
              ),
              const SizedBox(
                height: 3,
              ),
              ElevatedButton(
                onPressed: () async {
                  bool isValidated = signUpVaildation(email.text, password.text, name.text,phone.text);
                  if (isValidated) {
                    bool isLogined = await FirebaseAuthHelper.instance
                        .signUp(email.text, password.text, context);
                    if (isLogined) {
                      Routes.instance.pushAndRemoveUntil(
                          widget: HomePage(), context: context);
                    }
                }
                },
                child: const Align(
                  alignment: Alignment.center,
                  child: Text("CREATE ACCOUNT"),
                ),
              ),
              SizedBox(height: 5,),
              Center(child:
              Text("Already Have an Account",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
              ),
              Center(
                child: ElevatedButton(
                    onPressed: () {
                      Routes.instance
                          .push(widget: const Login(), context: context);
                    },
                    child: const Text("LOGIN")),
              )
            ],
          ),
        ),
      ),
      ), );
  }
}
