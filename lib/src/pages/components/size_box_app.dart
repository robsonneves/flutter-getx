import 'package:flutter/material.dart';
import 'package:flutter_getx/src/model/table_model.dart';
import 'package:flutter_getx/src/pages/components/list_tile_app.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

class SizeBoxApp extends StatelessWidget {
  const SizeBoxApp({
    super.key,
    required this.listInfo,
  });

  final List<TableModel> listInfo;

  @override
  Widget build(BuildContext context) {
    final desktop = ResponsiveBreakpoints.of(context).isDesktop;
    final size = MediaQuery.of(context).size;
    double quantInfo = (listInfo.length * 100);
    for (var list in listInfo) {
      quantInfo += list.value.length * 55;
    }

    return SizedBox(
      height: quantInfo,
      width: desktop ? 400 : size.width,
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: ListTileApp(
                  itens: listInfo,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
