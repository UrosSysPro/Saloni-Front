import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salon/app_state.dart';
import 'package:salon/pages/main_page.dart';

class SelectIpPage extends StatefulWidget {
  const SelectIpPage({super.key});

  @override
  State<SelectIpPage> createState() => _SelectIpPageState();
}

class _SelectIpPageState extends State<SelectIpPage> {

  String ip="192.168.1.",port="5234";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(useMaterial3: true),
      title: "Salon",
      home: Builder(
        builder: (context) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                    onChanged: (value){
                      ip=value;
                    },
                    initialValue: "192.168.1.",
                    decoration: InputDecoration(
                      hintText: "IP",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    onChanged: (value){
                      port=value;
                    },
                    initialValue: "5234",
                    decoration: InputDecoration(
                      hintText: "Port",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20,),
                  ElevatedButton(
                    onPressed: (){
                      context.read<AppState>().api="$ip:$port";
                      print(context.read<AppState>().api);
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                        return MainPage();
                      },));
                    }, 
                    child: SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: Center(
                        child: Text("Enter IP")
                      )
                    )
                  )
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}