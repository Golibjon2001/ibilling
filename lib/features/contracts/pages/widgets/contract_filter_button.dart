
import 'package:flutter/material.dart';
class ContractFilterButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final TextStyle style;
  final Color color;
  const ContractFilterButton({Key? key, required this.onTap, required this.text, required this.style,required this.color}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap,
      child: Container(
        height: 40,
        width: 164,
        decoration: BoxDecoration(
          color:color,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Center(
          child: Text(
            text,style:style
          ),
        ),
      ),
    );
  }
}
