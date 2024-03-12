// To parse this JSON data, do
//
//     final summaryResponse = summaryResponseFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

SummaryResponse summaryResponseFromJson(String str) =>
    SummaryResponse.fromJson(json.decode(str));

String summaryResponseToJson(SummaryResponse data) =>
    json.encode(data.toJson());

class SummaryResponse {
  final List<Rowstable1> rowstable1;
  final List<Column> columns;
  final double summary;

  SummaryResponse({
    required this.rowstable1,
    required this.columns,
    required this.summary,
  });

  factory SummaryResponse.fromJson(Map<String, dynamic> json) =>
      SummaryResponse(
        rowstable1: List<Rowstable1>.from(
            json["rowstable1"].map((x) => Rowstable1.fromJson(x))),
        columns:
            List<Column>.from(json["columns"].map((x) => Column.fromJson(x))),
        summary: json["Summary"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "rowstable1": List<dynamic>.from(rowstable1.map((x) => x.toJson())),
        "columns": List<dynamic>.from(columns.map((x) => x.toJson())),
        "Summary": summary,
      };
}

class Column {
  final String name;
  final String label;
  final String field;
  final String align;

  Column({
    required this.name,
    required this.label,
    required this.field,
    required this.align,
  });

  factory Column.fromJson(Map<String, dynamic> json) => Column(
        name: json["name"],
        label: json["label"],
        field: json["field"],
        align: json["align"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "label": label,
        "field": field,
        "align": align,
      };
}

class Rowstable1 {
  final String brnName;
  final String totalAmount;

  Rowstable1({
    required this.brnName,
    required this.totalAmount,
  });

  factory Rowstable1.fromJson(Map<String, dynamic> json) => Rowstable1(
        brnName: json["BRN_NAME"],
        totalAmount: json["TotalAmount"],
      );

  Map<String, dynamic> toJson() => {
        "BRN_NAME": brnName,
        "TotalAmount": totalAmount,
      };
}
