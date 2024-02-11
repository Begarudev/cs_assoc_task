// To parse this JSON data, do
//
//     final metroLines = metroLinesFromJson(jsonString);

import 'dart:convert';

List<MetroLines> metroLinesFromJson(String str) =>
    List<MetroLines>.from(json.decode(str).map((x) => MetroLines.fromJson(x)));

String metroLinesToJson(List<MetroLines> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MetroLines {
  String lineId;
  String lineName;
  String colorCode;
  String isAirport;
  String isLinetype;
  String linkingLines;
  String linkingStations;
  String stationOrder;
  String status;
  String addedOn;
  String updatedOn;
  String stationsList;

  MetroLines({
    required this.lineId,
    required this.lineName,
    required this.colorCode,
    required this.isAirport,
    required this.isLinetype,
    required this.linkingLines,
    required this.linkingStations,
    required this.stationOrder,
    required this.status,
    required this.addedOn,
    required this.updatedOn,
    required this.stationsList,
  });

  factory MetroLines.fromJson(Map<String, dynamic> json) => MetroLines(
        lineId: json["line_id"],
        lineName: json["line_name"],
        colorCode: json["color_code"],
        isAirport: json["is_airport"],
        isLinetype: json["is_linetype"],
        linkingLines: json["linking_lines"],
        linkingStations: json["linking_stations"],
        stationOrder: json["station_order"],
        status: json["status"],
        addedOn: json["added_on"],
        updatedOn: json["updated_on"],
        stationsList: json["stations_list"],
      );

  Map<String, dynamic> toJson() => {
        "line_id": lineId,
        "line_name": lineName,
        "color_code": colorCode,
        "is_airport": isAirport,
        "is_linetype": isLinetype,
        "linking_lines": linkingLines,
        "linking_stations": linkingStations,
        "station_order": stationOrder,
        "status": status,
        "added_on": addedOn,
        "updated_on": updatedOn,
        "stations_list": stationsList,
      };
}
