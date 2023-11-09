import 'package:flutter/material.dart';

class Currencyconverterpage extends StatefulWidget {
  const Currencyconverterpage({Key? key}) : super(key: key);

  @override
  _CurrencyconverterpageState createState() => _CurrencyconverterpageState();
}

class _CurrencyconverterpageState extends State<Currencyconverterpage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _amountController = TextEditingController();
  String _selectedCurrency = 'USD';
  String _convertedAmount = '';

  Map<String, double> exchangeRates = {
    'USD': 0.000064,
    'EUR': 0.000063,
    'MYR': 0.00030,
    'GBP': 0.000054,
    'KRW': 0.078,
    'JPY': 0.0096,
  };

  // Custom method to create a TextField widget
  Widget buildTextField(
      TextEditingController controller, String labelText, IconData icon) {
    return TextField(
      controller: controller,
      style: TextStyle(color: Colors.white), // Warna teks
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.white), // Warna label
        prefixIcon: Icon(icon, color: Colors.white), // Warna ikon
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white), // Warna garis border
          borderRadius:
              BorderRadius.circular(10.0), // Bentuk sisi-sisinya lengkung
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: Colors.white), // Warna garis border saat fokus
          borderRadius:
              BorderRadius.circular(10.0), // Bentuk sisi-sisinya lengkung
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[900],
        elevation: 0,
        title: Text(
          'Konversi Mata Uang',
        ),
      ),
      body: Container(
        color: Colors.lightBlue[900],
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 10),
              Center(
                child: Image(
                  image: AssetImage('lib/images/uang.png'),
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 20),
              buildTextField(
                _amountController,
                "Nilai Mata Uang IDR",
                Icons.monetization_on,
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.lightBlue[800],
                  borderRadius: BorderRadius.circular(100.0),
                  border: Border.all(color: Colors.white, width: 1.0),
                ),
                child: DropdownButtonFormField<String>(
                  value: _selectedCurrency,
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedCurrency = newValue!;
                    });
                  },
                  dropdownColor: Colors.lightBlue[800],
                  style: TextStyle(color: Colors.white),
                  icon: Icon(Icons.arrow_drop_down,
                      color: Colors.white), // Warna teks dropdown
                  items: exchangeRates.keys.map((String currency) {
                    return DropdownMenuItem<String>(
                      value: currency,
                      child: Text(currency),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 35),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          final amountInIDR =
                              double.parse(_amountController.text);
                          final convertedAmount =
                              amountInIDR * exchangeRates[_selectedCurrency]!;
                          setState(() {
                            _convertedAmount =
                                convertedAmount.toStringAsFixed(2);
                          });
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.amber,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              100), // Sesuaikan nilai sesuai keinginan
                        ),
                      ),
                      child: Text(
                        "Konversi",
                        style: TextStyle(
                          color: Colors.lightBlue.shade900,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50),
              Container(
                margin: EdgeInsets.only(bottom: 0), // Tambahkan baris ini
                child: Text(
                  "Konversi ke $_selectedCurrency",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white70,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                "$_convertedAmount",
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.amber,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
