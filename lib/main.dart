import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'BodyFit : Your BMI Calculator'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController = TextEditingController();
  var htController = TextEditingController();
  var Result = "";
  var bgcolor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Container(
            color: bgcolor,
            width: 400,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'BMI Calculator',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(
                  height: 70,
                ),
                TextField(
                  controller: wtController,
                  decoration: const InputDecoration(
                      labelText: 'Weight',
                      hintText: 'Enter Your Weight Here in Kg',
                      prefixIcon: Icon(Icons.line_weight),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      )),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 40,
                ),
                TextField(
                  controller: htController,
                  decoration: const InputDecoration(
                    labelText: 'Height',
                    hintText: 'Enter Your Height Here in cm',
                    prefixIcon: Icon(Icons.height),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                    onPressed: () {
                      var wt = wtController.text.toString();
                      var ht = htController.text.toString();

                      if (wt != "" && ht != "") {
                        //BMI Calculation
                        var weight = int.parse(wt);
                        var height = int.parse(ht);

                        var Totalheight = height / 100;

                        var BMI = weight / (Totalheight * Totalheight);
                        var message = "";

                        if (BMI > 25) {
                          message = "You are Overweighted!!!";
                          bgcolor = Colors.red.shade300;
                        } else if (BMI < 18) {
                          message = "You are UnderWeighted!!!";
                          bgcolor = Colors.yellow.shade400;
                        } else {
                          message = "You are Healthy :) ";
                          bgcolor = Colors.green.shade400;
                        }

                        setState(() {
                          Result =
                              "$message \n BMI is : ${BMI.toStringAsFixed(3)}";
                        });
                      } else {
                        setState(() {
                          Result = "Please Enter All the Fields";
                        });
                      }
                    },
                    child: const Text('Calculate')),
                const SizedBox(
                  height: 25,
                ),
                Text(
                  Result,
                  style: const TextStyle(fontSize: 26),
                )
              ],
            ),
          ),
        ));
  }
}
