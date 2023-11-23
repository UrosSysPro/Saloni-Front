import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salon/app_state.dart';
import 'package:salon/models/appointment.dart';
// import 'package:salon/models/order.dart';
import 'package:salon/models/reservation.dart';
import 'package:salon/widgets/appointment_view.dart';
// ignore: library_prefixes
import 'package:salon/widgets/filled_button.dart' as Salon;
import 'package:salon/widgets/reservation_view.dart';

class CalendarView extends StatefulWidget {
  const CalendarView({Key? key}) : super(key: key);

  @override
  State<CalendarView> createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  String selectedDate = "Wed Nov 7 2023";

  // List<Order> orders = [];
  List<Appointment>? appointments = [];
  List<Reservation>? reservations = [];

  @override
  void initState() {
    super.initState();
    // context.read<AppState>().getOrders().then((value) {
    //   setState(() {
    //     orders = value;
    //   });
    // });
    context.read<AppState>().getAppointments().then((value) {
      setState(() {
        appointments = value;
      });
    });
    context.read<AppState>().getReservations().then((value) {
      setState(() {
        reservations = value;
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
              const SizedBox(
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
                        icon: const Icon(Icons.date_range),
                        color: Colors.pink,
                      )
                    ],
                  ),
                ),
              ),
              const FlutterLogo(
                size: 50,
              ),
              const SizedBox(
                height: 30,
              ),
              Expanded(
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(30),
                      child: Center(
                          child: Text(
                        "Appointments",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      )),
                    ),
                    Column(
                      children: appointments?.map((appointment) => 
                        AppointmentView(appointment)).toList() ?? [],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30),
                      child: Center(
                          child: Text(
                        "Reservations",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      )),
                    ),
                    Column(
                      children: reservations
                              ?.map((reservation) => ReservationView(reservation))
                              .toList() ??
                          [],
                    ),
                  ],
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
                      child: const Icon(
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
        const Padding(
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
