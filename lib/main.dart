import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Scaffold(
            //backgroundColor: Color.fromARGB(255, 0, 47, 255),
            appBar: AppBar(title: Text("Konverter Suhu")),
            body: GetTextFieldValue()));
  }
}

class GetTextFieldValue extends StatefulWidget {
  _TextFieldValueState createState() => _TextFieldValueState();
}

class _TextFieldValueState extends State<GetTextFieldValue> {
  final textFieldValueHolder = TextEditingController();
  final etInput = TextEditingController();

  //int celcius,reamur,fahrenheit,kelvin ;
  //String result = '';
  double reamur = 0;
  double fahrenheit = 0;
  double kelvin = 0;
  double celcius = 0;

  konvertHandler() {
    setState(() {
      celcius = double.parse(etInput.text);
      reamur = (4 / 5) * double.parse(etInput.text);
      fahrenheit = ((9 / 5) * double.parse(etInput.text)) + 32;
      kelvin = double.parse(etInput.text) + 32;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              child: TextField(
                //controller: textFieldValueHolder,
                autocorrect: true,
                decoration:
                    InputDecoration(hintText: 'Masukkan Suhu Dalam Celcius'),
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                controller: etInput,
                keyboardType: TextInputType.number,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 30.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Color.fromARGB(
                                211, 255, 183, 0), // Set border color
                          ), // Set border width
                          borderRadius: BorderRadius.all(Radius.circular(
                              10.0)), // Set rounded corner radius
                          boxShadow: [] // Make rounded corner of border
                          ),
                       child: Text("Suhu dalam Kelvin \n\n\n\n $kelvin",
                          textAlign: TextAlign.center),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Color.fromARGB(
                                211, 255, 183, 0), // Set border color
                          ), // Set border width
                          borderRadius: BorderRadius.all(Radius.circular(
                              10.0)), // Set rounded corner radius
                          boxShadow: [] // Make rounded corner of border
                          ),
                      child: Text("Suhu dalam Reamor  \n\n\n\n $reamur",
                          textAlign: TextAlign.center),
                    )                    
                  ]),
            ),

             Container(
               margin: const EdgeInsets.only(top: 320.0),
             // margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              width: double.infinity,
              height: 50,
              child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 209, 209, 209)),
                onPressed: konvertHandler,
                child: Text(
                  "Konversi Suhu",
                ),
              ),
            ),           
          ],
        ),
      ),
    );
  }
}
