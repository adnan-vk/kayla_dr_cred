import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:kayla/controller/bottomcontroller/bottomcontroller.dart';
import 'package:kayla/view/appointment/appointment.dart';
import 'package:kayla/view/home_page/home.dart';
import 'package:kayla/view/prescription/prescription.dart';
import 'package:kayla/view/profile/profile.dart';
import 'package:provider/provider.dart';

class BottomBar extends StatelessWidget {
  BottomBar({super.key});
  final List tabs = [
    const HomePage(),
    const Appointment(),
    const Prescription(),
    const Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<BottomController>(context);
    return Scaffold(
      body: tabs[pro.currentindex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color(0xFF019744),
        unselectedItemColor: Colors.grey,
        elevation: 9,
        currentIndex: pro.currentindex,
        showUnselectedLabels: true,
        onTap: (index) => pro.onTapped(index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(EneftyIcons.home_outline),
            activeIcon: Icon(EneftyIcons.home_bold),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(EneftyIcons.calendar_outline),
            activeIcon: Icon(EneftyIcons.heart_bold),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(EneftyIcons.document_sketch_outline),
            activeIcon: Icon(EneftyIcons.message_bold),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(EneftyIcons.profile_bold),
            activeIcon: Icon(EneftyIcons.profile_circle_bold),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
