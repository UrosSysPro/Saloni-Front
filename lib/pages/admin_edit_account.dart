import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salon/app_state.dart';
import 'package:salon/models/salon.dart';
import 'package:salon/models/user.dart';

class AdminEditAccount extends StatefulWidget {
  const AdminEditAccount({super.key});

  @override
  State<AdminEditAccount> createState() => _AdminEditAccountState();
}

class _AdminEditAccountState extends State<AdminEditAccount> {
  User? user;
  Salon? salon;

  late TextEditingController nameCotroller, emailController, adressController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadUserAndSalon();
    nameCotroller = TextEditingController();
    emailController = TextEditingController();
    adressController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameCotroller.dispose();
    emailController.dispose();
    adressController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        color: const Color.fromARGB(255, 253, 245, 215),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 100,
              color: Colors.pink,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: 30,
                    height: 30,
                  ),
                  Text(
                    "Nalog",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Center(
                          child: Icon(
                            Icons.remove_sharp,
                            size: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 30, bottom: 40),
              child: SizedBox(
                height: 150,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 30,
                      height: 30,
                    ),
                    Expanded(
                        child: Center(
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image(
                              fit: BoxFit.cover,
                              width: 140,height: 140,
                              image: NetworkImage("http://localhost:5234/images/${salon?.imageUrl}" ?? "lol"),
                              errorBuilder: (context, error, stackTrace) {
                                return Icon(Icons.person,
                                    color: Colors.black, size: 40);
                              },
                            ),
                          ),
                        ),
                      ),
                    )),
                    Container(
                      clipBehavior: Clip.antiAlias,
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.pink,
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            // print(nameCotroller.text);
                            // print(adressController.text);
                            context.read<AppState>().updateSalon("${salon?.id??-1}", nameCotroller.text, adressController.text);
                          },
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            field("Ime", nameCotroller),
            field("Email", emailController),
            field("Adresa", adressController),
          ],
        ),
      ),
    );
  }

  Widget field(String name, TextEditingController controller) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: SizedBox(
        height: 50,
        child: Row(
          children: [
            SizedBox(
                width: 100,
                child: Text(
                  name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                )),
            Expanded(
              child: TextFormField(
                controller: controller,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> loadUserAndSalon() async {
    user = context.read<AppState>().user;
    salon = await context.read<AppState>().getWorkersSalon();
    // print(salon?.imageUrl);
    setState(() {
      nameCotroller.text = salon?.name ?? "Error loading name";
      emailController.text = "Nema mail";
      adressController.text = salon?.adress ?? "Error loading adress";
    });
  }
}
