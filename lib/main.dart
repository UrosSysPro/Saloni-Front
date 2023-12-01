import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salon/app_state.dart';
import 'package:salon/pages/select_ip_page.dart';

void main(){
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>AppState()),
      ],
      child: SelectIpPage(),
    )
  );
}