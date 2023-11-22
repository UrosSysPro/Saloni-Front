import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salon/app_state.dart';
import 'package:salon/models/appointment.dart';
import 'package:salon/models/order.dart';
import 'package:salon/widgets/filled_button.dart' as Salon;

class CalendarView extends StatefulWidget {
  const CalendarView({Key? key}) : super(key: key);

  @override
  State<CalendarView> createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  String selectedDate = "Wed Nov 7 2023";

  List<Order> orders = [];
  List<Appointment>? appointments = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<AppState>().getOrders().then((value) {
      setState(() {
        orders = value;
      });
    });
    context.read<AppState>().getAppointments().then((value) {
      setState(() {
        // print(value.toString());
        appointments = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 253, 245, 215),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                width: double.infinity,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40, bottom: 20),
                child: SizedBox(
                  height: 50,
                  // width: ,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      DropdownButton(
                          value: selectedDate,
                          items: List<int>.generate(20, (index) => index + 7)
                              .map((e) => DropdownMenuItem(
                                  value: "Wed Nov $e 2023",
                                  child: Text("Wed Nov $e 2023")))
                              .toList(),
                          onChanged: (value) => setState(() {
                                selectedDate = value ?? "default";
                              })),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.date_range),
                        color: Colors.pink,
                      )
                    ],
                  ),
                ),
              ),
              FlutterLogo(
                size: 50,
              ),
              SizedBox(
                height: 30,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: appointments?.length ?? 0,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 8),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 253, 94, 108),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  "${appointments?[index].dateTime?.hour}/${appointments?[index].dateTime?.minute}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 12),
                                )),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                // Container(
                                //     padding: EdgeInsets.symmetric(
                                //         horizontal: 10, vertical: 5),
                                //     decoration: BoxDecoration(
                                //       color: Color.fromARGB(255, 253, 94, 108),
                                //       borderRadius: BorderRadius.circular(20),
                                //     ),
                                //     child: Text(
                                //       "${orders[index].customerName}",
                                //       style: TextStyle(
                                //           fontWeight: FontWeight.bold,
                                //           color: Colors.white,
                                //           fontSize: 12),
                                //     )),
                                // SizedBox(
                                //   width: 20,
                                // ),
                                Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 253, 94, 108),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Text(
                                      "Feniranje i kosa nzm",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 12),
                                    )),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          Positioned(
              right: 10,
              bottom: 10,
              child: Container(
                width: 40,
                height: 40,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.amber,
                ),
                child: Builder(builder: (context) {
                  return Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () async {
                        DateTime? date = await showModalBottomSheet<DateTime?>(
                            context: context, builder: builder);
                        if (date != null) {
                          var success = await context
                              .read<AppState>()
                              .createAppointment(date);
                          print(success);
                        }
                      },
                      child: Icon(
                        Icons.add,
                        color: Colors.orange,
                      ),
                    ),
                  );
                }),
              ))
        ],
      ),
    );
  }

  Widget builder(BuildContext) {
    return Wrap(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Center(
            child: Text(
              "Novi Termin",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
        ),
        // Container(
        //   width: double.infinity,
        //   padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        //   child: Container(
        //     decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(20),
        //       color: Colors.grey
        //     ),
        //     child: DropdownButton(
        //       padding: EdgeInsets.symmetric(horizontal: 20),
        //       value: "Nokti",
        //       borderRadius: BorderRadius.circular(20),
        //       underline: Container(),
        //       items: [
        //         DropdownMenuItem(child: Text("Sisanje i frizura"),value: "Sisanje i frizura",),
        //         DropdownMenuItem(child: Text("Pranje kose"),value: "Pranje kose",),
        //         DropdownMenuItem(child: Text("Nokti"),value: "Nokti",),
        //       ],
        //       onChanged: (value){
        //         print(value.toString());
        //       },
        //     ),
        //   ),
        // ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Salon.FilledButton(
            onTap: () {
              showDatePicker(
                useRootNavigator: true,
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime.now().copyWith(day: 1),
                lastDate: DateTime.now().add(const Duration(days: 20)),
              ).then((date) {
                if (date == null) {
                  Navigator.pop(context, null);
                  return;
                }
                showTimePicker(
                        useRootNavigator: true,
                        context: context,
                        initialTime: TimeOfDay.now().replacing(
                            minute: 0,
                            hour: (TimeOfDay.now().hour + 1) %
                                TimeOfDay.hoursPerDay))
                    .then((time) {
                  if (time == null) {
                    Navigator.pop(context, null);
                    return;
                  }
                  Navigator.pop(context,
                      date.copyWith(hour: time.hour, minute: time.minute));
                });
              });
            },
            text: "Izaberite vreme",
          ),
        )
      ],
    );
  }
}
