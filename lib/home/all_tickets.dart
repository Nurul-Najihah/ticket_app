import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ticket_app/utils/all_json.dart';
import 'package:ticket_app/widgets/ticket_view.dart';

class AllTickets extends StatelessWidget {
  const AllTickets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Tickets"),
      ),
      body: ListView(
        children: [
          SingleChildScrollView(
            child: Column(
              children: ticketList
                  .map((singleTicket)=>
                  GestureDetector(
                    onTap: (){
                      var index = ticketList.indexOf(singleTicket);

                      print("I am tapped on the ticket $index");
                      Navigator.pushNamed(context, "/ticket_screen",
                          arguments: {"index":index});
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 20),
                        child: TicketView(ticket: singleTicket, wholeScreen: true,)),
                  ))
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}
