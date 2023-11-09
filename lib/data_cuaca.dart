import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'api.dart';

import 'api.dart';

class DataCuaca extends StatefulWidget {
  const DataCuaca({Key? key}) : super(key: key);

  @override
  _DataCuacaState createState() => _DataCuacaState();
}

class _DataCuacaState extends State<DataCuaca> {
  int maxData = 20;
  late Future<List<Cuaca>> _future;

  @override
  void initState() {
    super.initState();
    _future = executeAPI('getalldata').then((value) {
      print(value.status);
      if (value.status == 'success') {
        List list = value.data as List;
        var list2 = list.map((e) => Cuaca.fromJson(e)).toList();
        // sort by timeMillis
        list2.sort((a, b) => a.timeMillis.compareTo(b.timeMillis));
        // trim last 10 data
        if (list2.length > maxData) {
          list2 = list2.sublist(list2.length - maxData);
        }
        return list2;
      }
      return [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _future,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        }
        if (snapshot.hasData) {
          return SizedBox(
            height: 300,
            child: LineChart(
              LineChartData(
                lineBarsData: [
                  LineChartBarData(
                    spots: (snapshot.data as List<Cuaca>)
                        .map((e) => FlSpot(e.timeMillis.toDouble(), e.suhu))
                        .toList(),
                    isCurved: true,
                    barWidth: 2,
                    isStrokeCapRound: true,
                    dotData: FlDotData(
                      show: false,
                    ),
                    belowBarData: BarAreaData(
                      show: true,
                      color: Colors.blue.withOpacity(0.3),
                    ),
                  ),
                  LineChartBarData(
                    spots: (snapshot.data as List<Cuaca>)
                        .map((e) => FlSpot(e.timeMillis.toDouble(), e.humid))
                        .toList(),
                    isCurved: true,
                    barWidth: 2,
                    isStrokeCapRound: true,
                    dotData: FlDotData(
                      show: false,
                    ),
                    belowBarData: BarAreaData(
                      show: true,
                      color: Colors.red.withOpacity(0.3),
                    ),
                  ),
                  LineChartBarData(
                    spots: (snapshot.data as List<Cuaca>)
                        .map((e) => FlSpot(e.timeMillis.toDouble(), e.lux))
                        .toList(),
                    isCurved: true,
                    barWidth: 2,
                    isStrokeCapRound: true,
                    dotData: FlDotData(
                      show: false,
                    ),
                    belowBarData: BarAreaData(
                      show: true,
                      color: Colors.green.withOpacity(0.3),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

class Cuaca {
  final int id;
  final double suhu;
  final double humid;
  final double lux;
  final String ts;

  Cuaca.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        suhu = (json['suhu'] as num).toDouble(),
        humid = (json['humid'] as num).toDouble(),
        lux = (json['lux'] as num).toDouble(),
        ts = json['ts'];

  int get timeMillis {
    return DateTime.parse(ts).millisecondsSinceEpoch;
  }
}