import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../home/all_tickets.dart';
import '../styles/app_styles.dart';

class AppDoubleText extends StatefulWidget {
  const AppDoubleText({Key? key, required this.bigText,
    required this.smallText,
    required this.func})
      :super(key: key);
  final String bigText;
  final String smallText;
  final VoidCallback func;
  @override
  State<AppDoubleText> createState() => _AppDoubleTextState();
}

class _AppDoubleTextState extends State<AppDoubleText> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:MainAxisAlignment.spaceBetween,
     children:[
       Text(widget.bigText, style:AppStyles.headLineStyle2),
       InkWell(
         onTap: widget.func,
           child:
           Text(widget.smallText, style:AppStyles.textStyle.copyWith(
    color:AppStyles.primaryColor,
    ),
       ),
       ),
     ],
    );
  }
}
