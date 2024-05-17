import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class DataFetch extends StatefulWidget {
  const DataFetch({super.key});

  @override
  State<DataFetch> createState() => _DataFetchState();
}

class _DataFetchState extends State<DataFetch> {
  // ignore: deprecated_member_use
  DatabaseReference ref = FirebaseDatabase.instance.ref('/dataSensor/');
  late List<double> waterFlow = [];
  late List<double> waterLevel = [];
  late List<num> dataTime = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF33AAAA),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.only(left: 10.0)),
            Text(
              "Data Grafik",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(padding: EdgeInsets.all(10)),
          Text(
            "Debit",
            style: TextStyle(
              fontSize: 30,
            ),
            textAlign: TextAlign.center,
          ),
          Padding(padding: EdgeInsets.only(bottom: 20)),
          Expanded(
            child: FirebaseAnimatedList(
                shrinkWrap: true,
                query: ref,
                itemBuilder: ((context, snapshot, animation, index) {
                  var waterFlowValue = snapshot.child('waterFlow').value as num;
                  var timeValue = waterFlow.length;
                  waterFlow.add(waterFlowValue.toDouble());
                  dataTime.add(timeValue);

                  // var nilaiJumlahFlow = waterFlow.reduce(
                  //   (value, element) => value + element,
                  // );
                  // var nilaiRataFlow = nilaiJumlahFlow / waterFlow.length;

                  return Center(
                      child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: LineChart(LineChartData(
                      gridData: FlGridData(show: true),
                      titlesData: FlTitlesData(
                        topTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        rightTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                            axisNameWidget: Column(
                              children: [Text('Debit ml/s ')],
                            )),
                        bottomTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: true),
                            axisNameWidget: Column(
                              children: [
                                Text(
                                  'second',
                                )
                              ],
                            )),
                      ),
                      borderData: FlBorderData(
                        show: false,
                        border: Border.all(
                            color: const Color(0xff37434d), width: 1),
                      ),
                      minX: 0,
                      maxX: waterFlow.length.toDouble(),
                      minY: 0,
                      maxY: 500,
                      lineBarsData: [
                        LineChartBarData(
                            spots: waterFlow.asMap().entries.map((entry) {
                              return FlSpot(entry.key.toDouble(), entry.value);
                            }).toList(),
                            isCurved: true,
                            color: Colors.blue,
                            dotData: FlDotData(show: false),
                            belowBarData: BarAreaData(show: true)),
                      ],
                    )),
                  ));
                })),
          ),
          Padding(padding: EdgeInsets.all(10)),
          Text(
            "Water Level",
            style: TextStyle(
              fontSize: 30,
            ),
            textAlign: TextAlign.center,
          ),
          Padding(padding: EdgeInsets.only(bottom: 20)),
          Expanded(
            child: FirebaseAnimatedList(
                shrinkWrap: true,
                query: ref,
                itemBuilder: ((context, snapshot, animation, index) {
                  var waterLevelValue =
                      snapshot.child('waterLevel').value as num;
                  var timeValue = waterFlow.length;
                  waterLevel.add(waterLevelValue.toDouble());
                  dataTime.add(timeValue);

                  return Center(
                      child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: LineChart(LineChartData(
                      gridData: FlGridData(show: true),
                      titlesData: FlTitlesData(
                        topTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        rightTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                            axisNameWidget: Column(
                              children: [Text('mikro meter')],
                            )),
                        bottomTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: true),
                            axisNameWidget: Column(
                              children: [
                                Text(
                                  'second',
                                )
                              ],
                            )),
                      ),
                      borderData: FlBorderData(
                        show: false,
                        border: Border.all(
                            color: const Color(0xff37434d), width: 1),
                      ),
                      minX: 0,
                      maxX: waterLevel.length.toDouble(),
                      minY: 0,
                      maxY: 3000,
                      lineBarsData: [
                        LineChartBarData(
                            spots: waterLevel.asMap().entries.map((entry) {
                              return FlSpot(entry.key.toDouble(), entry.value);
                            }).toList(),
                            isCurved: true,
                            color: Colors.blue,
                            dotData: FlDotData(show: false),
                            belowBarData: BarAreaData(show: true)),
                      ],
                    )),
                  ));
                })),
          ),
        ],
      ),
    );
  }
}
