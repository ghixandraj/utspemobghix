import 'package:flutter/material.dart';

class BMI extends StatefulWidget {
  const BMI({Key? key}) : super(key: key);

  @override
  _BMIState createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  double height = 160; // Tinggi badan dalam sentimeter
  double weight = 60; // Berat badan dalam kilogram
  String gender = "Male"; // Gender: "Male" atau "Female"
  double bmi = 0.0;
  String result = "";

  void calculateBMI() {
    // Menghitung BMI
    double heightInMeters = height / 100; // Konversi tinggi ke meter
    bmi = weight / (heightInMeters * heightInMeters);

    // Menentukan hasil kategori BMI
    if (bmi < 18.5) {
      result = "kurus";
    } else if (bmi >= 18.5 && bmi < 24.9) {
      result = "normal";
    } else if (bmi >= 25 && bmi < 29.9) {
      result = "gemuk";
    } else {
      result = "obesitas";
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[900],
        elevation: 0,
        title: Text(
          "Kalkulator BMI",
          textAlign: TextAlign.center,
        ),
      ),
      body: ClipRect(
        child: Container(
          color: Colors.lightBlue[900],
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // SizedBox(height: 15),
              // Text("Masukkan Data Anda",
              //     style: TextStyle(
              //         color: Colors.white,
              //         fontSize: 20,
              //         fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Tinggi (cm):",
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    width: 100,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white30),
                        ),
                      ),
                      onChanged: (value) {
                        height = double.tryParse(value) ?? 0;
                      },
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Berat (kg):",
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    width: 100,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white30),
                        ),
                      ),
                      onChanged: (value) {
                        weight = double.tryParse(value) ?? 0;
                      },
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Gender:",
                    style: TextStyle(color: Colors.white),
                  ),
                  DropdownButton<String>(
                    value: gender,
                    onChanged: (value) {
                      setState(() {
                        gender = value!;
                      });
                    },
                    iconEnabledColor: Colors.white,
                    dropdownColor: Colors.lightBlue[800],
                    items: <String>['Male', 'Female']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
              SizedBox(height: 35),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        calculateBMI();
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.amber,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              100), // Sesuaikan nilai sesuai keinginan
                        ),
                      ),
                      child: Text(
                        "Hitung BMI",
                        style: TextStyle(color: Colors.lightBlue[900]),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 100),
              Text("Hasil BMI",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[300])),
              SizedBox(height: 10),
              Center(
                child: Text(
                  "$bmi",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.amber[600],
                  ),
                ),
              ),
              SizedBox(height: 5),
              Divider(
                color: Colors.white,
              ),
              SizedBox(height: 10),
              Text("kategori $result",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[300])),
            ],
          ),
        ),
      ),
    );
  }
}
