import 'package:flutter/material.dart';
import 'package:ibilling/assets/colors/colors.dart';
class ContractUserinfo extends StatelessWidget {
  final String title;
  final String description;
  const ContractUserinfo({Key? key, required this.title, required this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text:TextSpan(text:"$title  " , style:const TextStyle(color: white, fontWeight: FontWeight.w500),
          children: [
            TextSpan(
              text:
              description,
              style:const TextStyle(
                color: grey,
              ),
            )
          ]),
    );
  }
}
