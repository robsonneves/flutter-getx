import 'package:flutter/material.dart';
import 'package:flutter_getx/src/model/line_table.dart';

class DataTableApp extends StatelessWidget {
  const DataTableApp({
    super.key,
    required this.itens,
  });

  final List<LineTableModel> itens;

  @override
  Widget build(BuildContext context) {
    List<DataRow> allRows = itens.map((item) {
      return DataRow(
        cells: <DataCell>[
          DataCell(Text(item.name)),
          DataCell(Text(item.value.toString())),
        ],
      );
    }).toList();

    return DataTable(
      columns: const <DataColumn>[
        DataColumn(
          label: Expanded(
            child: Text(
              '',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              '',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ),
      ],
      rows: <DataRow>[
        ...allRows,
      ],
    );
  }
}
