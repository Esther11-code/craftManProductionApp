import 'package:flutter/material.dart';

class OnboardStaticRepo {
  static List<BottomNavModel> bottomNavItems = [
    BottomNavModel(icon: Icons.home_filled, title: 'Home'),
    BottomNavModel(icon: Icons.chat, title: 'Messages'),
    BottomNavModel(icon: Icons.event, title: 'Booking'),
    BottomNavModel(icon: Icons.account_circle_outlined, title: 'Profile')
  ];
}

class BottomNavModel {
  final String title;
  final IconData icon;
  BottomNavModel({required this.icon, required this.title});
}
