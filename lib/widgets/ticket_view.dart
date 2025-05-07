import 'package:flutter/material.dart';
import 'package:ticket_app/widgets/app_column_text_layout.dart';
import 'package:ticket_app/widgets/app_layoutbuilder_widget.dart';
import 'package:ticket_app/widgets/text_style_fourth.dart';
import 'package:ticket_app/widgets/text_style_third.dart';

import '../styles/app_styles.dart';
import 'big_circle.dart';
import 'big_dot.dart';

class TicketView extends StatefulWidget {
  final Map<String, dynamic> ticket;
  final bool wholeScreen;
  final bool? isColor;
  const TicketView({super.key, required this.ticket, this.wholeScreen=false,this.isColor});

  @override
  State<TicketView> createState() => _TicketViewState();
}

class _TicketViewState extends State<TicketView> {
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width*0.85,
      height: 189,
      child: Container(
        margin: EdgeInsets.only(right: widget.wholeScreen==true?0:16),
        child: Column(
          children: [
            //blue part of the ticket
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: widget.isColor==null? AppStyles.ticketBlue:AppStyles.ticketColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(21),
                    topRight: Radius.circular(21))
              ),
              child: Column(
                children:[
                  //show departure and destination with icons first line
                  Row(
                    children:[
                      TextStyleThird(text: widget.ticket["from"]["code"],isColor: widget.isColor,),
                      Expanded(child:Container()),
                      BigDot(isColor: widget.isColor,),
                      Expanded(child:Stack
                        (children:[
                        SizedBox(
                          height: 24,
                          child: AppLayoutBuilderWidget(randomDivider:6,)
                        ),
                        Center(child: Transform.rotate(angle: 1.5,
                        child:
                        Icon(
                            Icons.local_airport_rounded, color: widget.isColor ==null
                            ? Colors.white: AppStyles.planeSecondColor)),),
                      ])),
                      BigDot(isColor: widget.isColor,),
                      Expanded(child:Container()),
                      TextStyleThird(text:widget.ticket["to"]["code"],
                      isColor: widget.isColor,
                      ),
                    ],
                  ),
                  const SizedBox(height:3,),
                  //show departure and destination names with time
                  Row(
                    children:[
                      SizedBox(
                        width:100,
                        child: TextStyleFourth(text: widget.ticket["from"]["name"],
                          isColor: widget.isColor,
                        ),
                      ),
                      Expanded(child:Container()),
                      TextStyleFourth(text: widget.ticket["flying_time"],
                        isColor: widget.isColor,
                      ),
                      Expanded(child:Container()),
                      SizedBox(
                        width:100,
                        child: TextStyleFourth(text: widget.ticket["to"]["name"],align: TextAlign.end,
                          isColor: widget.isColor,
                        ),
                        )
                    ],
                  ),
                ],
              )

            ),
            //circles and dots
            Container(
              color: widget.isColor==null? AppStyles.ticketOrange:AppStyles.ticketColor,
              child:  Row(
                children:[
                  BigCircle(isRight:false,
                  isColor: widget.isColor,
                  ),
                  Expanded(child: AppLayoutBuilderWidget(randomDivider: 16,width:6,
                          isColor:widget.isColor
                  )),
                  BigCircle(isRight:true,
                    isColor: widget.isColor,
                  )
                ]
              )
            ),
            //orange part of the ticket
            Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: widget.isColor==null? AppStyles.ticketOrange:AppStyles.ticketColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(widget.isColor==null?21:0),
                        bottomRight: Radius.circular(widget.isColor==null?21:0))
                ),
                child: Column(
                  children:[
                    //show departure and destination with icons first line
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:[
                        AppColumnTextLayout(
                          topText: widget.ticket["date"],
                          bottomText: "DATE",
                          alignment: CrossAxisAlignment.start,
                          isColor: widget.isColor,
                        ),
                        AppColumnTextLayout(
                          topText: widget.ticket["departure_time"],
                          bottomText: "Departure time",
                          alignment: CrossAxisAlignment.center,
                          isColor: widget.isColor,
                        ),
                        AppColumnTextLayout(
                          topText: widget.ticket["number"].toString(),
                          bottomText: "Number",
                          alignment: CrossAxisAlignment.end,
                          isColor: widget.isColor,
                        ),

                      ],
                    ),
                  ],
                )

            ),
          ],
        ),
      )
    );

  }
}
