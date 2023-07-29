import 'package:flutter/material.dart';
import 'package:sasta_mart/screens/auth_ui/welcome/welcome.dart';
import '../constants/asset_images.dart';
import '../constants/routes.dart';
import '../widgets/top_titles/top_titles.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  get bold => null;

  changeScreen() {
    Future.delayed(const Duration(seconds: 5), () {
      Routes.instance.push(widget: const Welcome(), context: context);
    });
  }

  @override
  void initState() {
    changeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var tagline;

    return Scaffold(
        body: SingleChildScrollView(
      physics: const BouncingScrollPhysics(
          decelerationRate: ScrollDecelerationRate.normal),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.only(top: 35)),
            Image.asset(
              AssetsImages.instance.welcomeImage,
              scale: 1,
            ),
            const TopTitle(
                title: "     Welcome To Sasta Mart !! \n",
                subtitle: "Your Ultimate E-commerce Experience"),
            Image.asset(
              AssetsImages.instance.appIcon,
            ),
          ],
        ),
      ),
    ));
  }
}
//Splash Screen is Completed!!
