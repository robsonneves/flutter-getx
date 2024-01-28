import 'package:flutter/material.dart';
import 'package:flutter_getx/src/model/line_table_model.dart';
import 'package:flutter_getx/src/model/table_model.dart';
import 'package:flutter_getx/src/pages/components/size_box_app.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

class DayScreen extends StatelessWidget {
  const DayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final desktop = ResponsiveBreakpoints.of(context).isDesktop;
    final size = MediaQuery.of(context).size;
    String? dta = Get.parameters['day'];

    const double desktopHeight = 400;
    const double desktopWidth = 350;

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

    List<LineTableModel> infoValueHitAndComeBack = [
      LineTableModel(name: 'Integral', value: 0),
    ];

    List<LineTableModel> infoProduct = [
      LineTableModel(name: 'Bate Volta', value: 6),
      LineTableModel(name: '2 Dias Beto Carreiro', value: 0),
      LineTableModel(name: 'Trans Beto 1 dia', value: 10),
      LineTableModel(name: 'Trans Beto 2 dias', value: 0),
      LineTableModel(name: 'Passaporte', value: 0),
      LineTableModel(name: '3 Dias Beto Carreiro', value: 0),
      LineTableModel(name: 'Colo', value: 0),
      LineTableModel(name: 'Cascanéia', value: 0),
      LineTableModel(name: '--', value: 0),
      LineTableModel(name: 'Beto + Unipraias', value: 1),
      LineTableModel(name: 'Pernoite - 1 dia', value: 0),
      LineTableModel(name: 'Retorno', value: 2),
      LineTableModel(name: '4 Dias Beto Carreiro', value: 0),
      LineTableModel(name: 'Unipraias', value: 0),
      LineTableModel(name: 'Beto + Cascanéia', value: 0),
    ];

    List<LineTableModel> infoCommissions = [
      LineTableModel(name: 'Lenita', value: 84.0),
      LineTableModel(name: 'Dieter', value: 166.0),
      LineTableModel(name: 'TOTAL', value: 166.0, rowColor: Colors.yellow),
    ];

    List<LineTableModel> infoFreight = [
      LineTableModel(name: 'Bus', value: 0),
      LineTableModel(name: 'Uber Almir', value: 240.0),
      LineTableModel(name: 'TOTAL', value: 166.0, rowColor: Colors.yellow),
    ];

    List<LineTableModel> infoHotels = [
      LineTableModel(name: 'Cousada Cores', value: 633.0),
      LineTableModel(name: 'TOTAL', value: 166.0, rowColor: Colors.yellow),
    ];

    List<LineTableModel> infoBillsToPay = [
      LineTableModel(name: 'Adriano ', value: 200.0),
      LineTableModel(name: 'Almir', value: 240.0),
    ];

    List<LineTableModel> infoMaintenance = [];

    List<LineTableModel> infoPayableToReceive = [
      LineTableModel(
          name: 'A pagar no Dia', value: 200.0, rowColor: Colors.red),
      LineTableModel(name: 'A recebre no Dia', value: 0, rowColor: Colors.blue),
    ];

    List<LineTableModel> infoRevenue = [
      LineTableModel(name: 'Crédito Rede', value: 1.256),
      LineTableModel(name: 'Crédito Sistema', value: 0),
      LineTableModel(name: 'Dêbito', value: 0),
      LineTableModel(name: 'Deposito', value: 3.675),
      LineTableModel(name: 'Itau', value: 0),
      LineTableModel(name: 'BB', value: 0),
      LineTableModel(name: 'Bradesco', value: 0),
      LineTableModel(name: 'Caixa', value: 0),
      LineTableModel(name: 'Embarque', value: 0),
      LineTableModel(name: 'Faturado / pós pago', value: 518.24),
      LineTableModel(name: 'PagSeguro', value: 0),
      LineTableModel(name: 'Site', value: 0),
      LineTableModel(name: 'Previsão a receber', value: 0),
      LineTableModel(name: 'TOTAL', value: 5.420, rowColor: Colors.yellow),
    ];

    List<LineTableModel> infoExpense = [
      LineTableModel(name: 'Passaporte', value: 1.509),
      LineTableModel(name: 'Frete', value: 240),
      LineTableModel(name: 'Custo Poltrona', value: 13.33),
      LineTableModel(name: 'Hotel', value: 633),
      LineTableModel(name: 'Comissão', value: 250),
      LineTableModel(name: 'Taxa Cartão', value: 0),
      LineTableModel(name: 'TOTAL', value: 2.633),
    ];

    List<LineTableModel> infoRevenueExpenseFinal = [
      LineTableModel(
          name: 'Saldo Final', value: 2.816, rowColor: Colors.yellow),
    ];

    // lists
    List<TableModel> listOne = [
      TableModel(name: 'Informações Pax', value: infoPassageiros),
      TableModel(name: 'Informações Vendedor', value: infoVendedores),
      TableModel(name: 'Valores Bate e Volta', value: infoValueHitAndComeBack),
    ];

    List<TableModel> listTwo = [
      TableModel(name: 'Produto', value: infoProduct),
    ];

    List<TableModel> listThree = [
      TableModel(name: 'Comissões', value: infoCommissions),
      TableModel(name: 'Fretes', value: infoFreight),
      TableModel(name: 'Hoteis', value: infoHotels),
    ];

    List<TableModel> listFour = [
      TableModel(name: 'Contas a Pagar', value: infoBillsToPay),
      TableModel(name: 'Manutenção', value: infoMaintenance),
      TableModel(name: 'Pagar e Receber', value: infoPayableToReceive),
    ];

    List<TableModel> listFive = [
      TableModel(name: 'Receita', value: infoRevenue),
      TableModel(name: 'Despesa', value: infoExpense),
      TableModel(name: 'Saldo Final', value: infoRevenueExpenseFinal),
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
        body: !desktop
            ? SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      SizeBoxApp(listInfo: listOne),
                      SizeBoxApp(listInfo: listTwo),
                      SizeBoxApp(listInfo: listThree),
                      SizeBoxApp(listInfo: listFour),
                      SizeBoxApp(listInfo: listFive),
                    ],
                  ),
                ),
              )
            : SingleChildScrollView(
                child: Center(
                  child: Wrap(
                    children: [
                      SizedBox(
                        height: desktopHeight,
                        width: desktopWidth,
                        child: SizeBoxApp(listInfo: listOne),
                      ),
                      SizedBox(
                        height: desktopHeight,
                        width: desktopWidth,
                        child: SizeBoxApp(listInfo: listTwo),
                      ),
                      SizedBox(
                        height: desktopHeight,
                        width: desktopWidth,
                        child: SizeBoxApp(listInfo: listThree),
                      ),
                      SizedBox(
                        height: desktopHeight,
                        width: desktopWidth,
                        child: SizeBoxApp(listInfo: listFour),
                      ),
                      SizedBox(
                        height: desktopHeight,
                        width: desktopWidth,
                        child: SizeBoxApp(listInfo: listFive),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
