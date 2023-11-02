import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salon/app_state.dart';
import 'package:salon/widgets/salon_view.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  String value = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: const Color.fromARGB(255, 253, 245, 215),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30),
              child: SearchBar(
                leading: const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Icon(Icons.search),
                ),
                hintText: "Pretrazi...",
                hintStyle: MaterialStateProperty.resolveWith(
                    (states) => TextStyle(color: Colors.black54)),
                onChanged: (value) {
                  setState(() {
                    this.value = value;
                    context.read<AppState>().search(value);
                  });
                },
              ),
            ),
            value.isEmpty?banner():salonList()
          ],
        ),
      ),
    );
  }

  Widget opis(String text) {
    return Text(
      text,
      style: const TextStyle(
          color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
    );
  }

  Widget podeli(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(50)),
      child: Text(
        text,
        style: TextStyle(
            color: const Color.fromARGB(255, 253, 94, 108),
            fontWeight: FontWeight.bold,
            fontSize: 15),
      ),
    );
  }

//ako nema nis ukucano
//////////////////////////////////////////////////
  Widget banner() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 30),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        width: double.infinity,
        height: 400,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 253, 94, 108),
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                  blurRadius: 20, color: Colors.black45, offset: Offset(0, 8))
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FlutterLogo(
              size: 150,
            ),
            opis("Pokupi\npopust na\naplikaciji"),
            SizedBox(
              height: 20,
            ),
            podeli("Podeli")
          ],
        ),
      ),
    );
  }

//ako ima ukucano
//////////////////////////////////////////////////////////
  Widget salonList() {
    AppState appState=context.watch<AppState>();
    
    if(appState.searchError){
      return Expanded(child: Center(child: Text("[ERROR] internet ili server"),));
    }
    if(appState.searching){
      return Expanded(child: Center(child: Text("Loading..."),));
    }
    if(appState.searchResults.isEmpty){
      return Expanded(child: Center(child: Text("Nema pronadjenih salona"),));
    }
    var saloni=appState.searchResults;
    return Expanded(
      child: ListView.builder(
          itemCount: saloni.length,
          itemBuilder: (context, index) {
            return SalonView(salon: saloni[index]);
          }),
    );
  }
}
