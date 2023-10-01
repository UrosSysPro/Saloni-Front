import 'package:flutter/material.dart';
import 'package:salon/widgets/home_view.dart';
import 'package:salon/widgets/search_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Builder(builder: (context){
        if(index==0)return HomeView();
        if(index==1)return SearchView();
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
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Pocetna"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Pretrazi"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Omiljeni"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Nalog"),
        ],
      ),
    ));
  }
}
