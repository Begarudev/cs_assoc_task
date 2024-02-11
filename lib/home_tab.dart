import 'package:cs_assoc_task/main_screen_padding.dart';
import 'package:flutter/material.dart';

import 'custom_box_widget.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: PaddingCustom(
        widget: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("assets/announcements_bg.png"),
            CustomBoxWidget(
              /// Grid View of Objects
              aspectRatio: 1.36,
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 6,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (BuildContext context, int index) {
                  List<String> listOfIcons = [
                    "assets/icons/book_tickets.png",
                    "assets/icons/plan_journey.png",
                    "assets/icons/nearby_metro_station.png",
                    "assets/icons/smart_card_recharge.png",
                    "assets/icons/calculate_fare.png",
                    "assets/icons/view_transactions.png",
                  ];

                  List<String> listOfTitles = [
                    "Book Tickets",
                    "Plan Journey",
                    "Search Station",
                    "Smart Card Recharge",
                    "Calculate Fare",
                    "View Transaction",
                  ];

                  Color borderColor = Colors.black12;

                  List<Border> borderColour = [
                    Border(
                        right: BorderSide(color: borderColor),
                        bottom: BorderSide(color: borderColor)),
                    Border(
                        right: BorderSide(color: borderColor),
                        bottom: BorderSide(color: borderColor)),
                    Border(bottom: BorderSide(color: borderColor)),
                    Border(right: BorderSide(color: borderColor)),
                    Border(right: BorderSide(color: borderColor)),
                    const Border(),
                  ];

                  return Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(border: borderColour[index]),
                    child: GridTile(
                        footer: Text(listOfTitles[index],
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 16, height: 0.8)),
                        child: Container(
                          margin: const EdgeInsets.fromLTRB(20, 20, 20, 30),
                          padding: const EdgeInsets.all(12),
                          decoration: const ShapeDecoration(
                              color: Colors.white,
                              shadows: [
                                BoxShadow(color: Colors.black26, blurRadius: 10)
                              ],
                              shape: CircleBorder(
                                eccentricity: 0,
                              )),
                          child: Image.asset(listOfIcons[index],
                              fit: BoxFit.scaleDown),
                        )),
                  );
                },
              ),
            ),
            CustomBoxWidget(
                aspectRatio: .8199,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const DropDownMenuSelector(
                        titleText: 'Depart From',
                        label: 'Select Source',
                        dropDownMenuEntries: [
                          DropdownMenuEntry(value: "value", label: "label")
                        ]),
                    const DropDownMenuSelector(
                        titleText: "Destination",
                        label: "Select Destination",
                        dropDownMenuEntries: [
                          DropdownMenuEntry(value: "value", label: "label")
                        ]),
                    ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(
                                MediaQuery.of(context).size.width - 100, 50),
                            backgroundColor:
                                const Color.fromRGBO(20, 30, 115, 1),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(13))),
                        child: const Text(
                          "Book Ticket",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        )),
                    TextButton(
                        style: TextButton.styleFrom(
                            minimumSize: Size(
                                MediaQuery.of(context).size.width * 0.4, 19)),
                        onPressed: () {},
                        child: const Text(
                          "Reset",
                          style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ))
                  ],
                )),
          ],
        ),
      ),
    );
  }
}

class DropDownMenuSelector extends StatelessWidget {
  final String titleText;
  final String label;
  final List<DropdownMenuEntry> dropDownMenuEntries;

  const DropDownMenuSelector({
    required this.titleText,
    required this.label,
    required this.dropDownMenuEntries,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 30, right: 30),
      padding: const EdgeInsets.all(20),
      decoration: ShapeDecoration(
          color: const Color.fromRGBO(245, 245, 245, 1),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titleText,
            textAlign: TextAlign.left,
            style: const TextStyle(
                color: Color.fromRGBO(100, 107, 114, 1),
                fontWeight: FontWeight.w500,
                fontSize: 18),
          ),
          DropdownMenu(
              inputDecorationTheme:
                  const InputDecorationTheme(border: InputBorder.none),
              trailingIcon: const Icon(null),
              selectedTrailingIcon: const Icon(null),
              label: Text(label,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  )),
              enableSearch: true,
              initialSelection: null,
              width: MediaQuery.of(context).size.width * 0.6,
              dropdownMenuEntries: dropDownMenuEntries),
        ],
      ),
    );
  }
}
