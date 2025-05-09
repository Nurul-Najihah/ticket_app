import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:ticket_app/styles/app_styles.dart';
import 'package:ticket_app/widget/hotel.dart';
import 'package:ticket_app/widgets/app_double_text.dart';

import '../res/media.dart';
import '../utils/all_json.dart';
import '../widgets/heading_text.dart';
import '../widgets/ticket_view.dart';

class HomeScreen extends StatelessWidget {
  final double? fontSize;

  const HomeScreen({super.key, required this.fontSize});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppStyles.bgColor,
    body:ListView(
    children:[
      const SizedBox(height:40),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                   Text("Good morning", style: AppStyles.headLineStyle3),
                    const SizedBox(
                     height: 5,
                    ),
                    const HeadingText(text: "Book Tickets",isColor: false)
                  ],
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(image: AssetImage(AppMedia.logo))
                    )
                  )
              ],
            ),
            const SizedBox(height:25),
            Container(
              padding:const EdgeInsets.symmetric(horizontal:12, vertical:12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xFFF4F6FD),

              ),

              child: const Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[
                  Icon(
                      FluentSystemIcons.ic_fluent_search_regular,
                      color: Color(0xFFBFC205),
                    ),
                    Text("Search"),
                ],
              ),
            ),
            const SizedBox(height:40),
            AppDoubleText(
              bigText: 'Upcoming Flights',
              smallText: 'View all',
              func: ()=>Navigator.pushNamed(context,"/all_tickets" ),
            ),
            const SizedBox(height:20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
                child: Row(
                  children: ticketList.map((singleTicket)=>
                      GestureDetector(
                        onTap: (){
                          var index = ticketList.indexOf(singleTicket);

                      print("I am tapped on the ticket $index");
                    Navigator.pushNamed(context, "/ticket_screen",
                    arguments: {"index":index});
                        },
                          child: TicketView(ticket: singleTicket))
                          ).toList(),
    )
    ),
            const SizedBox(height:40),
             AppDoubleText(
               bigText: 'Hotels',
               smallText: 'View all',
               func: ()=>Navigator.pushNamed(context,"/all_hotels" ),
             ),
            const SizedBox(height:20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
                child: Row(
                  children:
                  hotelList
                      .take(2)
                      .map((singleHotel)=>GestureDetector(
                    onTap: (){
                      var index = hotelList.indexOf(singleHotel);
                      Navigator.pushNamed(context, "/hotel_detail", arguments:{
                        "index":index
                      });
                    },
                    child:    Hotel(hotel: singleHotel)))
                      .toList(),
                )
                )
     ],
    ),
   ),

],
    ),

    );
  }
}
