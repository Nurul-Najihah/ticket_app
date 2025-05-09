import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:ticket_app/controller/bottom_nav_controller.dart';
import 'package:ticket_app/home/home_screen.dart';
import 'package:ticket_app/screens/profile/profile.dart';
import 'package:get/get.dart';

import '../search/search_screen.dart';
import '../search/ticket/ticket_screen.dart';

class BottomNavBar extends StatelessWidget {
   BottomNavBar({super.key});

   final BottomNavController controller= Get.put(BottomNavController());

  final appScreens = [
    const HomeScreen(fontSize: null,),
    const SearchScreen(),
    const TicketScreen(),
    const ProfileScreen()
  ];

  //change our index for BottomNavBar
  int _selectedIndex = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: appScreens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        //onTap: _onItemTapped,
        selectedItemColor: Colors.blueGrey,
        unselectedItemColor: const Color(0xFF526400),
        showSelectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(FluentSystemIcons.ic_fluent_home_regular),

            activeIcon: Icon(FluentSystemIcons.ic_fluent_home_filled),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(FluentSystemIcons.ic_fluent_search_regular),

            activeIcon: Icon(FluentSystemIcons.ic_fluent_search_filled),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(FluentSystemIcons.ic_fluent_ticket_regular),

            activeIcon: Icon(FluentSystemIcons.ic_fluent_ticket_filled),
            label: "Tickets",
          ),
          BottomNavigationBarItem(
            icon: Icon(FluentSystemIcons.ic_fluent_person_regular),

            activeIcon: Icon(FluentSystemIcons.ic_fluent_person_filled),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
