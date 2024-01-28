import 'package:cs_assoc_task/main_screen_padding.dart';
import 'package:flutter/material.dart';

import 'custom_box_widget.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PaddingCustom(
      widget: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const CustomBoxWidget(
            color: Colors.white,
            child: Text(
              "data",
            ),
            height: 120,
          ),
          CustomBoxWidget(
            child: GridView.count(
              crossAxisCount: 3,
              addRepaintBoundaries: true,
              shrinkWrap: true,
              children: [
                const Icon(Icons.ac_unit_outlined),
                const Icon(Icons.ac_unit_outlined),
                const Icon(Icons.ac_unit_outlined),
                const Icon(Icons.ac_unit_outlined),
                const Icon(Icons.ac_unit_outlined),
                Container(
                    child: const Icon(Icons.ac_unit_outlined),
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.grey))),
              ],
            ),
          ),
          const CustomBoxWidget(
              child: Column(
            children: [
              DropdownMenu(
                dropdownMenuEntries: [
                  DropdownMenuEntry(value: "value", label: "label"),
                ],
              )
            ],
          ))
        ],
      ),
    );
  }
}
