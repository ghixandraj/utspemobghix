import 'package:flutter/material.dart';

class TemperatureConversionPage extends StatefulWidget {
  @override
  _TemperatureConversionPageState createState() =>
      _TemperatureConversionPageState();
}

class _TemperatureConversionPageState extends State<TemperatureConversionPage> {
  List<String> temperatureUnits = ['°F', '°C', '°Re', 'K'];
  String selectedInputUnit = '°F';
  String selectedOutputUnit = '°C';
  TextEditingController inputController = TextEditingController();
  TextEditingController resultController = TextEditingController();

  void convertTemperature() {
    double inputValue = double.tryParse(inputController.text) ?? 0;
    double resultValue = 0;

    // Melakukan konversi berdasarkan unit yang dipilih
    switch (selectedInputUnit) {
      case '°F':
        resultValue = (inputValue - 32) * 5 / 9;
        break;
      case '°C':
        resultValue = inputValue;
        break;
      case '°Re':
        resultValue = inputValue * 5 / 4;
        break;
      case 'K':
        resultValue = inputValue - 273.15;
        break;
    }

    // Konversi ke unit output yang dipilih
    switch (selectedOutputUnit) {
      case '°F':
        resultValue = (resultValue * 9 / 5) + 32;
        break;
      case '°C':
        resultValue = resultValue;
        break;
      case '°Re':
        resultValue = resultValue * 4 / 5;
        break;
      case 'K':
        resultValue = resultValue + 273.15;
        break;
    }

    resultController.text = resultValue.toStringAsFixed(4);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[900],
        elevation: 0,
        title: Text(
          "Konversi Suhu",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: Colors.lightBlue[900],
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Center(
              child: Image(
                image: AssetImage('lib/images/panjang.png'),
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                DropdownButton(
                  value: selectedInputUnit,
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      setState(() {
                        selectedInputUnit = newValue;
                        convertTemperature();
                      });
                    }
                  },
                  iconEnabledColor: Colors.white,
                  dropdownColor: Colors.lightBlue[800],
                  items: temperatureUnits.map((String unit) {
                    return DropdownMenuItem(
                      value: unit,
                      child: Text(
                        unit,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    );
                  }).toList(),
                ),
                Text(
                  'ke',
                  style: TextStyle(color: Colors.white),
                ),
                DropdownButton<String>(
                  value: selectedOutputUnit,
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      setState(() {
                        selectedOutputUnit = newValue;
                        convertTemperature();
                      });
                    }
                  },
                  iconEnabledColor: Colors.white,
                  dropdownColor: Colors.lightBlue[800],
                  items: temperatureUnits.map((String unit) {
                    return DropdownMenuItem<String>(
                      value: unit,
                      child: Text(
                        unit,
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  }).toList(),
                )
              ],
            ),
            SizedBox(height: 20),
            TextField(
              controller: inputController,
              keyboardType: TextInputType.number,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Masukkan Suhu',
                labelStyle: TextStyle(color: Colors.white),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                ),
              ),
              onChanged: (String value) {
                convertTemperature();
              },
            ),
            SizedBox(height: 20),
            TextField(
              controller: resultController,
              readOnly: true,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Hasil Konversi',
                labelStyle: TextStyle(color: Colors.white),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
