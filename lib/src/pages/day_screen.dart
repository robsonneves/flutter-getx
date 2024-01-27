import 'package:flutter/material.dart';
import 'package:flutter_getx/src/model/line_table.dart';
import 'package:flutter_getx/src/pages/components/list_tile_app.dart';
import 'package:get/get.dart';

class DayScreen extends StatelessWidget {
  const DayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    String? dta = Get.parameters['day'];

    List<LineTableModel> infoPassageiros = [
      LineTableModel(name: 'Passageiros Viaj. Hoje', value: 18),
      LineTableModel(name: 'Pagos', value: 24),
      LineTableModel(name: 'Atrasados', value: 0),
      LineTableModel(name: 'Colo', value: 0),
      LineTableModel(name: 'Ida', value: 17),
      LineTableModel(name: 'Volta', value: 18),
      LineTableModel(name: 'Lugates a Venda', value: 6)
    ];

    List<LineTableModel> infoVendedores = [
      LineTableModel(name: 'Andréa', value: 133),
      LineTableModel(name: 'Fernando', value: 0),
      LineTableModel(name: 'Ocupação Foi', value: 75)
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            dta!,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              color: Colors.green,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: SizedBox(
              height: size.height,
              width: 500,
              child: Stack(
                children: [
                  Column(
                    children: [
                      Expanded(
                        child: Center(
                          child: ListTileApp(
                            title: "Passageiros Viajando Hoje",
                            itens: infoPassageiros,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: ListTileApp(
                            title: "Vendas",
                            itens: infoVendedores,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ); //}
  }
}
