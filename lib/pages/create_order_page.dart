import 'package:flutter/material.dart';
import 'package:salon/models/salon.dart';

class CreateOrderPage extends StatefulWidget {
  final Salon salon;
  final int categoryId;
  const CreateOrderPage(this.salon, this.categoryId, {super.key});

  @override
  State<CreateOrderPage> createState() => _CreateOrderPageState();
}

class _CreateOrderPageState extends State<CreateOrderPage> {
  int x = -1, y = -1, dan = 0;
  List<String> dani = ["PON", "UTO", "SRE", "CET", "PET", "SUB", "NED"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 253, 245, 215),
      body: Column(
        children: [
          Container(
            // height: 70,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 70,
                    height: 30,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 253, 94, 108),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.chevron_left,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(0, 10),
                  child: Text(
                    widget.salon.name ?? "Default name",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 70,
                ),
              ],
            ),
          ),
          const Align(
            heightFactor: 1,
            child: Text(
              "Februar",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            ),
          ),
          const SizedBox(
            height: 70,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            height: 70,
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:
                  List<int>.generate(dani.length, (index) => index).map((e) {
                return Expanded(
                    child: GestureDetector(
                  onTap: () {
                    setState(() {
                      dan = e;
                    });
                  },
                  child: Column(
                    children: [
                      Text(
                        dani[e],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: e == dan
                              ? Color.fromARGB(255, 253, 94, 108)
                              : Colors.transparent,
                        ),
                        child: Center(
                          child: Text(
                            "${11 + e}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: e == dan ? Colors.white : Colors.black),
                          ),
                        ),
                      )
                    ],
                  ),
                ));
              }).toList(),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            height: 140,
            child: Row(
              children: List<int>.generate(4, (index) => index).map((e) {
                return Expanded(
                    child: Column(
                  children: List<int>.generate(3, (index) => index).map((f) {
                    return Expanded(
                        child: Padding(
                            padding: EdgeInsets.all(5),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  x = e;
                                  y = f;
                                });
                              },
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: (e == x && f == y)
                                      ? Color.fromARGB(255, 253, 94, 108)
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(3),
                                ),
                                child: Center(
                                    child: Text(
                                  "${e + f * 4 + 8}:00",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: (e == x && f == y)
                                          ? Colors.white
                                          : Colors.black),
                                )),
                              ),
                            )));
                  }).toList(),
                ));
              }).toList(),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Align(
              alignment: Alignment.centerLeft,
              heightFactor: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 30),
                child: SizedBox(
                    width: 100,
                    height: 30,
                    child: Center(
                        child: Text(
                      widget.salon.name ?? "Default name",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ))),
              )),
          Align(
            alignment: Alignment.centerLeft,
            heightFactor: 1,
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: SizedBox(
                width: 100,
                height: 100,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        "http://localhost:5234/images/${widget.salon.imageUrl}"),
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.person);
                    },
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            height: 70,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Total",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: const Color.fromARGB(255, 253, 94, 108),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: const Text(
                      "950,00",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ]),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color.fromARGB(255, 253, 94, 108),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                child: const Center(
                  child: Text(
                    "Potvrdi",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
