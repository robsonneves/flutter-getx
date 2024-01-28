import 'package:flutter/material.dart';
import 'package:flutter_getx/src/model/table_model.dart';
import 'package:flutter_getx/src/pages/components/data_table_app.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

class ListTileApp extends StatelessWidget {
  const ListTileApp({
    super.key,
    required this.itens,
  });

  final List<TableModel> itens;

  @override
  Widget build(BuildContext context) {
    final desktop = ResponsiveBreakpoints.of(context).isDesktop;
    List<ListTile> allListTile = itens.map((item) {
      return ListTile(
        subtitle: DataTableApp(myTitle: item.name, itens: item.value),
      );
    }).toList();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Theme.of(context).colorScheme.outline,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(12)),
          ),
          child: Padding(
            padding: EdgeInsets.all(desktop ? 5 : 20),
            child: ListView(
              children: <Widget>[
                ...allListTile,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
