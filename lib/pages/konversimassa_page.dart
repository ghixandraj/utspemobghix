import 'package:flutter/material.dart';

class MassConverter extends StatefulWidget {
  @override
  _MassConverterState createState() => _MassConverterState();
}

class _MassConverterState extends State<MassConverter> {
  List<String> units = [
    'TON',
    'TON INGGRIS',
    'TON AS',
    'POUND',
    'OUNCE',
    'KILOGRAM',
    'GRAM',
  ];
  String selectedUnitFrom = 'TON';
  String selectedUnitTo = 'KILOGRAM';
  TextEditingController inputController = TextEditingController();
  TextEditingController resultController = TextEditingController();

  Map<String, double> conversionRates = {
    'TON': 1000,
    'TON INGGRIS': 1016.05,
    'TON AS': 907.185,
    'POUND': 0.453592,
    'OUNCE': 0.0283495,
    'KILOGRAM': 1,
    'GRAM': 0.001,
  };

  double convert(double value, String from, String to) {
    double valueInKilogram = value * conversionRates[from]!;
    return valueInKilogram / conversionRates[to]!;
  }

  void convertMass() {
    double inputValue = double.tryParse(inputController.text) ?? 0;
    double resultValue = convert(inputValue, selectedUnitFrom, selectedUnitTo);
    resultController.text = resultValue.toStringAsFixed(4);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[900],
        elevation: 0,
        title: Text(
          "Konversi Massa",
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
                image: AssetImage('lib/images/massa.png'),
                // fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                DropdownButton<String>(
                  value: selectedUnitFrom,
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      setState(() {
                        selectedUnitFrom = newValue;
                        convertMass();
                      });
                    }
                  },
                  iconEnabledColor: Colors.white,
                  dropdownColor: Colors.lightBlue[800],
                  items: units.map((String unit) {
                    return DropdownMenuItem<String>(
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
                Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                ),
                DropdownButton<String>(
                  value: selectedUnitTo,
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      setState(() {
                        selectedUnitTo = newValue;
                        convertMass();
                      });
                    }
                  },
                  iconEnabledColor: Colors.white,
                  dropdownColor: Colors.lightBlue[800],
                  items: units.map((String unit) {
                    return DropdownMenuItem<String>(
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
              ],
            ),
            SizedBox(height: 20),
            TextField(
              controller: inputController,
              keyboardType: TextInputType.number,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Masukkan Nilai',
                labelStyle: TextStyle(color: Colors.white),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              onChanged: (String value) {
                convertMass();
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
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
