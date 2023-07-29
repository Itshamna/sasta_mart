import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sasta_mart/constants/asset_images.dart';
import 'package:sasta_mart/constants/routes.dart';
import 'package:sasta_mart/screens/auth_ui/login/login.dart';
import 'package:sasta_mart/screens/auth_ui/signup/signup.dart';
import 'package:sasta_mart/widgets/primary_button/primary_button.dart';
import 'package:sasta_mart/widgets/top_titles/top_titles.dart';
import 'welcome.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var other = 10;
    return Scaffold(

      body:
      SingleChildScrollView(
        physics: const BouncingScrollPhysics(
          decelerationRate: ScrollDecelerationRate.normal
        ),

        child:
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
                child: TopTitle(
                    title: "                 Sasta Mart ..",
                    subtitle: "Your Ultimate E-commerce Experience")),
            const SizedBox(
              height: 6,
            ),
            Center(
              child: Image.asset(AssetsImages.instance.applogo,scale: 2,
              width: 250,),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  child: const Icon(
                    Icons.facebook_rounded,
                    color: Colors.blue,
                    size: 55,
                  ),
                ),
                const SizedBox(width: 12),
                CupertinoButton(
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  child: Image.asset(
                    AssetsImages.instance.google,
                    scale: 7.0,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            PrimaryButton(
              title: "Login",
              onPressed: () {
                Routes.instance.push( widget:  const Login(),context: context);
              },
            ),
            const SizedBox(
              height: 15.0,
            ),
            PrimaryButton(
              title: "Sign Up",
              onPressed: () {
                Routes.instance.push( widget: const Signup(),context:  context);
              },
            ),
          ],
        ),
      ),
      ),);
  }
}
