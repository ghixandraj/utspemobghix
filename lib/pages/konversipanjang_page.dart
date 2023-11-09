import 'package:flutter/material.dart';

class LengthConverter extends StatefulWidget {
  @override
  _LengthConverterState createState() => _LengthConverterState();
}

class _LengthConverterState extends State<LengthConverter> {
  List<String> units = [
    'mm',
    'cm',
    'm',
    'km',
    'inc',
    'ft',
    'yd',
    'mi',
    'nm',
    'mil'
  ];
  String selectedUnitFrom = 'mm';
  String selectedUnitTo = 'cm';
  TextEditingController inputController = TextEditingController();
  TextEditingController resultController = TextEditingController();

  double convert(double value, String from, String to) {
    Map<String, double> conversionRates = {
      'mm': 1,
      'cm': 0.1,
      'm': 0.001,
      'km': 0.000001,
      'inc': 0.0393701,
      'ft': 0.00328084,
      'yd': 0.00109361,
      'mi': 6.2137e-7,
      'nm': 1.852e-12,
      'mil': 39.3701
    };

    double valueInMm = value / conversionRates[from]!;
    return valueInMm * conversionRates[to]!;
  }

  void convertLength() {
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
          "Konversi Panjang",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white), // Warna teks pada appbar
        ),
      ),
      backgroundColor: Colors.lightBlue[900],
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 10),
            Center(
              child: Image(
                image: AssetImage('lib/images/panjang.png'),
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                DropdownButton(
                  value: selectedUnitFrom,
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      setState(() {
                        selectedUnitFrom = newValue;
                        convertLength();
                      });
                    }
                  },
                  iconEnabledColor: Colors.white,
                  dropdownColor: Colors.lightBlue[800],
                  items: units.map((String unit) {
                    return DropdownMenuItem(
                      value: unit,
                      child: Text(
                        unit,
                        style: TextStyle(
                          color: Colors.white,
                        ), // Warna teks pada dropdown item
                      ),
                    );
                  }).toList(),
                ),

                // Warna latar dropdown
                Text(
                  'ke',
                  style: TextStyle(
                      color: Colors.white), // Warna teks pada label "ke"
                ),
                DropdownButton<String>(
                  value: selectedUnitTo,
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      setState(() {
                        selectedUnitTo = newValue;
                        convertLength();
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
                            color:
                                Colors.white), // Warna teks pada dropdown item
                      ),
                    );
                  }).toList(), // Warna latar dropdown
                )
              ],
            ),
            SizedBox(height: 20),
            TextField(
              controller: inputController,
              keyboardType: TextInputType.number,
              style: TextStyle(color: Colors.white), // Warna teks isian
              decoration: InputDecoration(
                labelText: 'Masukkan Nilai',
                labelStyle: TextStyle(color: Colors.white), // Warna teks label
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white, // Warna garis border saat tidak aktif
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white, // Warna garis border saat fokus
                  ),
                ),
              ),
              onChanged: (String value) {
                convertLength();
              },
            ),
            SizedBox(height: 20),
            TextField(
              controller: resultController,
              readOnly: true,
              style: TextStyle(color: Colors.white), // Warna teks isian
              decoration: InputDecoration(
                labelText: 'Hasil Konversi',
                labelStyle: TextStyle(color: Colors.white), // Warna teks label
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white, // Warna garis border saat tidak aktif
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white, // Warna garis border saat fokus
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
