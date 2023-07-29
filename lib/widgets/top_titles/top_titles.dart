import 'package:flutter/material.dart';

class TopTitle extends StatelessWidget {
  final String title, subtitle;
  const TopTitle({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: kTextTabBarHeight + 08,
        ),
        if(title == "Login" || title == "Create Account")
          GestureDetector(child:  const Icon(Icons.arrow_back_ios,color: Colors.black,),
            onTap: (){Navigator.of(context).pop();},),
        const SizedBox(height: 15),
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          subtitle,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        ),
      ],
    );
  }
}
