import 'dart:convert';

import 'package:cs_assoc_task/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'metroline.dart';

class NotificationTab extends StatefulWidget {
  const NotificationTab({
    super.key,
  });

  @override
  State<NotificationTab> createState() => _NotificationTabState();
}

class _NotificationTabState extends State<NotificationTab> {
  List<MetroLines> metroLinesList = [];

  @override
  void initState() {
    super.initState();
    loadJsonData();
  }

  Future<void> loadJsonData() async {
    String data = await DefaultAssetBundle.of(context).loadString(
        'assets/tbl_line.json'); // Assuming 'data.json' is your file name
    List<dynamic> jsonList = json.decode(data);
    setState(() {
      metroLinesList = jsonList.map((e) => MetroLines.fromJson(e)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return metroLinesList.isEmpty
            ? const CircularProgressIndicator()
            : CustomListTile(
                lineID: metroLinesList[index].lineId,
                lineName: metroLinesList[index].lineName,
                color: metroLinesList[index].colorCode.toColor(),
              );
      },
    );
  }
}

class CustomListTile extends StatelessWidget {
  final String lineID;
  final String lineName;
  final Color color;

  const CustomListTile({
    super.key,
    required this.lineID,
    required this.lineName,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10),
      margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      decoration: ShapeDecoration(
          shadows: const [BoxShadow(color: Colors.black87, blurRadius: 5)],
          color: color,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)))),
      child: Material(
        color: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        ),
        child: ListTile(
          title: Text(
            "Line $lineID",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            lineName,
            style: const TextStyle(
                decorationColor: Color.fromRGBO(177, 177, 177, 1.0)),
          ),
          leading: SvgPicture.asset(
            "assets/icons/train.svg",
            width: 30,
            color: color,
          ),
          trailing: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                      side: const BorderSide(
                          color: Color.fromRGBO(112, 162, 128, 1))),
                  backgroundColor: const Color.fromRGBO(190, 245, 220, 1)),
              child: const Text(
                "Normal Service",
                style: TextStyle(color: Color.fromRGBO(41, 75, 65, 1)),
              )),
        ),
      ),
    );
  }
}
