import 'package:flutter/material.dart';
import 'package:salon/widgets/account_view.dart';
import 'package:salon/widgets/favorites_view.dart';
import 'package:salon/widgets/home_view.dart';
import 'package:salon/widgets/search_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Builder(builder: (context){
        if(index==0)return const HomeView();
        if(index==1)return const SearchView();
        if(index==2)return const FavoritesView();
        if(index==3)return const AccountView();
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
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Pocetna"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Pretrazi"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Omiljeni"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Nalog"),
        ],
      ),
    ));
  }
}
