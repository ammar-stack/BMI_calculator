import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'splashscreen.dart';

class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  var controllerwkg = TextEditingController();
  var controllerhft = TextEditingController();
  var controllerhinch = TextEditingController();
  var BMI = "";
  var status = "";
  var backcolor = Colors.limeAccent;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: backcolor,
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_rounded)),
            title: const Text(
              'BMI - Calculator',
              style: TextStyle(fontSize: 35, color: Colors.black),
            ),
            centerTitle: true,
            backgroundColor: Colors.lime,
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: TextField(
                    controller: controllerwkg,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Weight in kg',
                        labelText: 'Weight'),
                    keyboardType: TextInputType.number,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: TextField(
                    controller: controllerhft,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Height in ft',
                        labelText: 'Height in ft'),
                    keyboardType: TextInputType.number,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: TextField(
                    controller: controllerhinch,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Height in inches',
                        labelText: 'Height in inches'),
                    keyboardType: TextInputType.number,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: ElevatedButton(
                      onPressed: () {
                        var wkg = controllerwkg.text.toString();
                        var hft = controllerhft.text.toString();
                        var hinch = controllerhinch.text.toString();
                        if (wkg != "" && hft != "" && hinch != "") {
                          var iwkg = int.parse(wkg);
                          var ihft = int.parse(hft);
                          var ihinch = int.parse(hinch);
                          var totalinches = (ihft * 12) + ihinch;
                          var tcm = totalinches * 2.54;
                          var tm = tcm / 100;
                          var bmi = iwkg / (tm * tm);
                          setState(() {
                            BMI = "Total BMI: ${bmi.toStringAsFixed(3)}";
                            if (bmi < 18.5) {
                              status = "You`re UnderWeight";
                              backcolor = Colors.redAccent;
                              setState(() {});
                            } else if (bmi > 29.5) {
                              status = "You`re OverWeight";
                              backcolor = Colors.redAccent;
                              setState(() {});
                            } else {
                              status = "You`re Perfect";
                              backcolor = Colors.greenAccent;
                              setState(() {});
                            }
                          });
                        } else {
                          setState(() {
                            BMI = "Please fill all fields";
                          });
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 134, 148, 9),
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: Text(
                          'Calculate',
                          style: TextStyle(fontSize: 25),
                        ),
                      )),
                ),
                Text(
                  BMI,
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Text(
                  status,
                  style: const TextStyle(
                      fontSize: 35, fontWeight: FontWeight.bold),
                )
              ],
            ),
          )),
    );
  }
}
