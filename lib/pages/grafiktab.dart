import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class GrafikTab extends StatefulWidget {
  const GrafikTab({super.key});

  @override
  State<GrafikTab> createState() => GrafikTabState();
}

class GrafikTabState extends State<GrafikTab> {
  List<Color> gradientColors = [Colors.lightBlue, Colors.yellow];
  late List<FlSpot> listData;
  TextEditingController inputController = TextEditingController();

  @override
  void initState() {
    super.initState();
    listData = [
      FlSpot(0, 20),
      FlSpot(1, 40),
      FlSpot(2, 30),
      FlSpot(3, 20),
      FlSpot(4, 50),
      FlSpot(5, 60),
      FlSpot(6, 70),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Grafik Data',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.amber,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        AspectRatio(
          aspectRatio: 1.70,
          child: Padding(
            padding: EdgeInsets.only(
              right: 18,
              left: 12,
              top: 24,
              bottom: 12,
            ),
            child: LineChart(
              mainData(),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: TextField(
            controller: inputController,
            keyboardType: TextInputType.number,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              labelText: 'Data Input',
              labelStyle: TextStyle(color: Colors.white),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white54),
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white54),
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: SizedBox(
            height: 50,
            width: double.maxFinite,
            child: TextButton(
              style: TextButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                textStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                backgroundColor: Colors.amber,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              onPressed: () {
                double lastData = listData.length.toDouble();
                double valueInput =
                    double.parse(inputController.text.toString());

                try {
                  listData.add(FlSpot(lastData, valueInput));
                  setState(() {});
                } catch (e) {
                  print('$e');
                }
              },
              child: Text(
                'Input',
                style: TextStyle(color: Colors.blueAccent),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: SizedBox(
            height: 50,
            width: double.maxFinite,
            child: TextButton(
              style: TextButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                textStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                backgroundColor: Colors.red[900],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              onPressed: () {
                setState(() {
                  listData.clear();
                  inputController.clear();
                });
              },
              child: Text(
                'Clear Data',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.white,
      fontSize: 14,
    );
    Widget text;
    switch (value.toInt()) {
      case 1:
        text = Text('1', style: style);
        break;
      case 2:
        text = Text('2', style: style);
        break;
      case 3:
        text = Text('3', style: style);
        break;
      case 4:
        text = Text('4', style: style);
        break;
      case 5:
        text = Text('5', style: style);
        break;
      default:
        text = Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.white,
      fontSize: 15,
    );
    String text;
    switch (value.toInt()) {
      case 10:
        text = '10';
        break;
      case 30:
        text = '20';
        break;
      case 50:
        text = '30';
        break;
      case 70:
        text = '40';
        break;
      case 90:
        text = '50';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 10,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: Colors.yellow,
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: Colors.amber,
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xfffff4b4)),
      ),
      minX: 0,
      maxX: listData.length.toDouble() - 1,
      minY: 0,
      maxY: 100,
      lineBarsData: [
        LineChartBarData(
          spots: listData,
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors,
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
