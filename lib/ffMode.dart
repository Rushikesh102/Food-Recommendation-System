import 'package:flutter/material.dart';
import 'package:frs/Result.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';

class LoadFF extends StatelessWidget {
  const LoadFF() : super();

  @override
  Widget build(BuildContext context) {
    const begin = Offset(0.0, 1.0);
    const end = Offset.zero;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color.fromARGB(0xFF, 0x0e, 0x66, 0xa4),
            const Color.fromARGB(0xFF, 0x92, 0x95, 0xf5),
          ],
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(1.0, 1.0),
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp,
        ),
      ),
      child: AnimatedSplashScreen(

        duration: 1000,
        splash: Text("Fast-Food Mode",style: TextStyle(color: Colors.white,fontSize: 40),),
        nextScreen: FFMode(),
        splashTransition: SplashTransition.fadeTransition,

        pageTransitionType: PageTransitionType.fade,
        backgroundColor: Colors.transparent,
      ),
    );
  }
}


class FFMode extends StatefulWidget {
  FFMode() : super();

  @override
  State<FFMode> createState() => _FFModeState();
}

class _FFModeState extends State<FFMode> {
  List<dynamic> res=[];
  String Company = 'Any';

  String Hunger = 'Any';

  String Protein = 'Any';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fast-Food Mode",style: TextStyle(color: Colors.white,),),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color.fromARGB(0xFF, 0x0e, 0x66, 0xa4),
                const Color.fromARGB(0xFF, 0x92, 0x95, 0xf5),
              ],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(1.0, 1.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp,
            ),
          ),
        ),
      ),
      body: Center(
        child: Container(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(height: 20),
              Text("Fast-Food Mode",style: TextStyle(fontSize: 40),),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 28, 0),
                      child: Text(
                        "Restaurant : ",
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    // Step 2.
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(
                            color: Colors.black,
                            style: BorderStyle.solid,
                            width: 0.80),
                      ),
                      child: DropdownButton<String>(
                        isExpanded: true,
                        // Step 3.
                        value: Company,

                        // Step 4.
                        items: <String>['Any', 'McDonalds', 'Pizza Hut', 'Burger King', 'Starbucks', 'KFC', 'Dominos']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(fontSize: 25),
                            ),
                          );
                        }).toList(),
                        // Step 5.
                        onChanged: (String ?newValue) {
                          setState(() {
                            Company = newValue!;
                          });
                        },
                        underline: Container(),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 28, 0),
                      child: Text(
                        "Hunger Level : ",
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(
                            color: Colors.black,
                            style: BorderStyle.solid,
                            width: 0.80),
                      ),
                      child: DropdownButton<String>(
                        isExpanded: true,
                        // Step 3.
                        value: Hunger,
                        // Step 4.
                        items: <String>['Any', '3 (High)', '2 (Medium)', '1 (Low)']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(fontSize: 25),
                            ),
                          );
                        }).toList(),
                        // Step 5.
                        onChanged: (String ?newValue) {
                          setState(() {
                            Hunger = newValue!;
                          });
                        },
                        underline: Container(),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 28, 0),
                      child: Text(
                        "Protein Level : ",
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(
                            color: Colors.black,
                            style: BorderStyle.solid,
                            width: 0.80),
                      ),
                      child: DropdownButton<String>(
                        isExpanded: true,
                        // Step 3.
                        value: Protein,
                        // Step 4.
                        items: <String>['Any', 'Low', 'High']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(fontSize: 25),
                            ),
                          );
                        }).toList(),
                        // Step 5.
                        onChanged: (String ?newValue) {
                          setState(() {
                            Protein = newValue!;
                          });
                        },
                        underline: Container(),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      const Color.fromARGB(0xFF, 0x0e, 0x66, 0xa4),
                      const Color.fromARGB(0xFF, 0x92, 0x95, 0xf5),
                    ],
                    begin: const FractionalOffset(0.0, 0.0),
                    end: const FractionalOffset(1.0, 1.0),
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp,
                  ),
                ),
                width: 150,
                height: 60,
                margin: EdgeInsets.only(top: 70),
                child: ElevatedButton(

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                  ),
                  onPressed: () async {
                    //async function to perform http get
                    var a = Company;
                    var b = Hunger;
                    var c = Protein;
                    if(a=='Any'){
                      a='';
                    }
                    if(b=='Any'){
                      b='';
                    }
                    else if(b=='3 (High)'){
                      b='3';
                    }
                    else if(b=='2 (Medium)'){
                      b='2';
                    }
                    else if(b=='1 (Low)'){
                      b='1';
                    }
                    if(c=='Any'){
                      c='';
                    }
                    if(c=='High'){
                      c='y';
                    }
                    if(c=='Low'){
                      c='n';
                    }

                    final response = await http.get(Uri.parse(
                        'https://food-ml.onrender.com/fast_food_recommend?restaurants=' +
                            a +
                            '&hunger=' +
                            b +
                            '&protein=' +
                            c
                    )); //getting the response from our backend server script
                    print(response.toString());
                    final decoded = json.decode(response.body) as List<dynamic>; //converting it from json to key value pair

                    setState(() {
                      res = decoded;
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ResultPage(
                            res: res,
                            s: "FFM",
                          )));
                      // txt = decoded[0]; //changing the state of our widget on data update
                    });
                  },
                  child: Text(
                    'Press',
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
              // Text(
              //   'Selected Value: $dropdownValue',
              //   style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
