import 'package:flutter/material.dart';
import 'package:flutter_getx/src/model/line_table.dart';
import 'package:flutter_getx/src/pages/components/data_table_app.dart';

class ListTileApp extends StatelessWidget {
  const ListTileApp({
    super.key,
    required this.title,
    required this.itens,
  });

  final String title;
  final List<LineTableModel> itens;

  @override
  Widget build(BuildContext context) {
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
            padding: const EdgeInsets.all(20),
            child: ListView(
              children: <Widget>[
                ListTile(
                  leading: const CircleAvatar(child: Text('A')),
                  title: Text(title),
                  subtitle: DataTableApp(itens: itens),
                  //subtitle: const Text(
                  //  'Supporting text \n\n Supporting text \n\n Supporting text '),
                  trailing: const Icon(Icons.favorite_rounded),
                ),
                const Divider(height: 0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
