import 'package:flutter/material.dart';
import 'package:salon/widgets/calendar_view.dart';
import 'package:salon/widgets/notifications_view.dart';
import 'package:salon/widgets/sales_view.dart';
import 'package:salon/widgets/admin_account_view.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({ Key? key }) : super(key: key);

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Builder(builder: (context){
        if(index==0)return const CalendarView();
        // if(index==1)return const SalesView();
        if(index==1)return const NotificationsView();
        if(index==2)return const AdminAccountView();
        return Container(color: Colors.red,);
      }),

      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            this.index = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        currentIndex: index,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        backgroundColor: Color.fromARGB(255, 253, 94, 108),
        selectedItemColor: Color.fromARGB(255, 254, 201, 72),
        unselectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.calendar_month), label: "Kalendar"),
          // BottomNavigationBarItem(icon: Icon(Icons.label), label: "Prodaja"),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: "Obavestenja"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Nalog"),
        ],
      ),
    ));
  }
}