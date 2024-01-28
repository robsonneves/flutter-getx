import 'package:flutter/material.dart';

class DataTableApp extends StatelessWidget {
  const DataTableApp({
    super.key,
    required this.itens,
    required this.myTitle,
  });

  final List<dynamic> itens;
  final String myTitle;

  @override
  Widget build(BuildContext context) {
    List<DataRow>? allRows = itens.map((item) {
      return DataRow(
        color: item.rowColor != null
            ? MaterialStateColor.resolveWith((states) => item.rowColor)
            : null,
        cells: <DataCell>[
          DataCell(Text(item.name)),
          DataCell(Text(item.value.toString())),
        ],
      );
    }).toList();

    return DataTable(
      headingRowColor: MaterialStateColor.resolveWith((states) => Colors.green),
      columns: <DataColumn>[
        DataColumn(
          label: Text(
            myTitle,
            style: const TextStyle(
                fontStyle: FontStyle.italic, color: Colors.white),
          ),
        ),
        const DataColumn(
          label: Text(
            "",
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
      ],
      rows: <DataRow>[
        ...allRows,
      ],
    );
  }
}
