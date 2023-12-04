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
  // String selectedDate = "Wed Nov 7 2023";
  DateTime selectedDate = DateTime.now();
  DateTime dayAfterSelected = DateTime.now();
  List<DateTime> dates = [];

  // List<Order> orders = [];
  List<Appointment>? appointments = [], todaysAppointsments = [];
  List<Reservation>? reservations = [], todaysReservations = [];
  List<String> months = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "Maj",
    "Jun",
    "Jul",
    "Avg",
    "Sep",
    "Okt",
    "Nov",
    "Dec",
  ];

  @override
  void initState() {
    super.initState();
    reload();
    dates = List<int>.generate(14, (index) => index - 7).map((e) {
      DateTime newDate = DateTime.now().add(Duration(days: e)).copyWith(
          hour: 0, minute: 0, second: 0, millisecond: 0, microsecond: 0);
      return newDate;
    }).toList();
    selectDate(dates[7]);
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
              Padding(
                padding: const EdgeInsets.only(
                    top: 40, bottom: 20, left: 30, right: 30),
                child: Center(
                  child: SizedBox(
                    width: 150,
                    height: 50,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: DropdownButton(
                            isExpanded: true,
                            value: selectedDate,
                            items: dates.map((e) {
                              int day = e.day;
                              String month = months[e.month - 1];
                              String year = e.year.toString();
                              return DropdownMenuItem(
                                value: e,
                                child: Text("$month $day. $year."),
                              );
                            }).toList(),
                            onChanged: (value)=>setState(() {
                              selectDate(value);
                            }),
                            icon: const Icon(
                              Icons.date_range,
                              color: Colors.pink,
                            ),
                          ),
                        ),
                      ],
                    ),
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
                    const Padding(
                      padding: EdgeInsets.all(30),
                      child: Center(
                          child: Text(
                        "Appointments",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      )),
                    ),
                    Column(
                      children: todaysAppointsments
                              ?.map(
                                  (appointment) => AppointmentView(appointment))
                              .toList() ??
                          [],
                    ),
                    const Padding(
                      padding: EdgeInsets.all(30),
                      child: Center(
                          child: Text(
                        "Reservations",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      )),
                    ),
                    Column(
                      children: todaysReservations
                              ?.map(
                                  (reservation) => ReservationView(reservation))
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
                          reload();
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

  Widget builder(BuildContext context) {
    return Wrap(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 30),
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
                  // reload();
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

  void selectDate(DateTime? value) {
    selectedDate = value ?? DateTime.now();
    dayAfterSelected = selectedDate.add(const Duration(days: 1));
    todaysAppointsments = (appointments
                ?.where((appointment) =>
                    ((appointment.dateTime?.isAfter(selectedDate) ?? false) &&
                        (appointment.dateTime?.isBefore(dayAfterSelected) ??
                            false)))
                .toList() ??
            [])
        .cast<Appointment>();

    todaysReservations = (reservations
                ?.where((reservation) =>
                    ((reservation.date?.isAfter(selectedDate) ?? false) &&
                        (reservation.date?.isBefore(dayAfterSelected) ??
                            false)))
                .toList() ??
            [])
        .cast<Reservation>();
  }
  Future<void> reload()async{

    context.read<AppState>().getAppointments().then((value) {
      setState(() {
        appointments = value;
        selectDate(selectedDate);
      });
    });
    context.read<AppState>().getReservations().then((value) {
      setState(() {
        reservations = value;
        selectDate(selectedDate);
      });
    });
  }
}
