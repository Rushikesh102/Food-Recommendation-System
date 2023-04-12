import 'package:dropdown_plus/dropdown_plus.dart';
import 'package:flutter/material.dart';
import 'package:frs/Result.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
class LoadNormal extends StatelessWidget {
  const LoadNormal() : super();
  Future<List<dynamic>> getNames() async {
    //async function to perform http get
    final response = await http.get(Uri.parse(
        'https://food-ml.onrender.com/normal_getNames')); //getting the response from our backend server script

    List<dynamic> Names = json.decode(response.body) as List<dynamic>;
    // print(Names[0]);//converting it from json to key value pair
    return Names;
  }
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

        // duration: 1000,
        splash: Text("Normal Mode",style: TextStyle(color: Colors.white,fontSize: 40),),
        nextScreen: NormalPage(),
        splashTransition: SplashTransition.fadeTransition,
        function: getNames,
        pageTransitionType: PageTransitionType.fade,
        backgroundColor: Colors.transparent,
      ),
    );
  }
}

class NormalPage extends StatefulWidget {
  const NormalPage() : super();

  @override
  _NormalPageState createState() => _NormalPageState();
}

class _NormalPageState extends State<NormalPage> {
  Future<List<dynamic>> getNames() async {
    //async function to perform http get
    final response = await http.get(Uri.parse(
        'https://food-ml.onrender.com/normal_getNames')); //getting the response from our backend server script

    List<dynamic> Names = json.decode(response.body) as List<dynamic>;
    // print(Names[0]);//converting it from json to key value pair
    return Names;
  }
  List<dynamic> n=[];
  List<String> names = [];
  String txt = '';
  var x=0;
  final flavor = [
    'Any',
    'spicy',
    'sweet',
    'bitter',
    // 'sour',
  ];
  final diet = [
    'Any',
    'vegetarian',
    'non vegetarian',
  ];
  final course = [
    'Any',
    'snack',
    // 'starter',
    'main course',
    'dessert',
  ];
  var flavorvalue = "Any";
  var dietvalue = 'Any';
  var coursevalue = 'Any';
  List<dynamic> res=[];
  DropdownEditingController<String> Food = DropdownEditingController();
  @override
  _asyncMethod() async {
    var names=await getNames();
    n=names;
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    Food.value = '';
    _asyncMethod();
    // names = n.cast<String>();
  }
  Widget build(BuildContext context) {
    bool _isLoading=true;
    return Scaffold(
      appBar: AppBar(
        title: Text("Normal Mode"),
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
        child: SingleChildScrollView(
          child: Container(
            child: Column(

              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Normal Mode",style: TextStyle(fontSize: 40),),
                SizedBox(
                  height: 30,
                ),
                FutureBuilder<List<dynamic>>(
                  future: getNames(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      // Use the returned data here
                      final data = snapshot.data;
                      names = data!.cast<String>();
                      _isLoading=false;
                      // print(names);
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextDropdownFormField(
                          controller: Food,
                          options: names,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              suffixIcon: Icon(Icons.arrow_drop_down,size: 25,color: Colors.black87,),
                              labelText: "Food",
                              labelStyle: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                          dropdownHeight: 300,
                        ),
                      );
                    } else if (snapshot.hasError) {

                      Future.delayed(const Duration(milliseconds: 2000), () {
                        setState(() {
                          x=1;
                          _isLoading=true;
                        });
                      });
                      // Handle any errors that occurred while fetching the data
                      return Text(snapshot.error.toString());
                    } else {
                      // Show a loading indicator while the data is being fetched
                      return Center(
                        child: !_isLoading
                            ?const Text("Loading Complete")
                            :const CircularProgressIndicator(),
                      );

                    }
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 28, 0),
                        child: Text(
                          "Select Flavor : ",
                          style: TextStyle(
                            fontSize: 22,
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
                          value: flavorvalue,

                          // Step 4.
                          items: flavor
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(fontSize: 22),
                              ),
                            );
                          }).toList(),
                          // Step 5.
                          onChanged: (String ?newValue) {
                            setState(() {
                              flavorvalue = newValue!;
                            });
                          },
                          underline: Container(),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 28, 0),
                        child: Text(
                          "Select Diet : ",
                          style: TextStyle(
                            fontSize: 22,
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
                          value: dietvalue,

                          // Step 4.
                          items: diet
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(fontSize: 22),
                              ),
                            );
                          }).toList(),
                          // Step 5.
                          onChanged: (String ?newValue) {
                            setState(() {
                              dietvalue = newValue!;
                            });
                          },
                          underline: Container(),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 28, 0),
                        child: Text(
                          "Select Course : ",
                          style: TextStyle(
                            fontSize: 22,
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
                          value: coursevalue,

                          // Step 4.
                          items: course
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(fontSize: 22),
                              ),
                            );
                          }).toList(),
                          // Step 5.
                          onChanged: (String ?newValue) {
                            setState(() {
                              coursevalue = newValue!;
                            });
                          },
                          underline: Container(),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: Container(
                    //container that contains the button
                    width: 150,
                    height: 60,
                    child: Container(
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
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                        ),
                        onPressed: () async {
                          //async function to perform http get
                          var f = Food.value.toString();
                          var fp = flavorvalue;
                          var d = dietvalue;
                          var c = coursevalue;
                          if(fp=='Any'){
                            fp='';
                          }
                          if(d=='Any'){
                            d='';
                          }
                          if(c=='Any'){
                            c='';
                          }
                          // if(Food.value=='Select any food item'){
                          //   Food.value='';
                          // }
                          final response = await http.get(Uri.parse(
                              'https://food-ml.onrender.com/normal_recommend?food=' +
                                  f +
                                  '&flavor_profile=' +
                                  fp +
                                  '&diet=' +
                                  d +
                                  '&course=' +
                                  c)); //getting the response from our backend server script
                          // print(response.toString());
                          // var x=response;
                          // Map<String, dynamic> map=x;
                          // print(response.runtimeType);
                          final decoded = json.decode(response.body) as List<dynamic>; //converting it from json to key value pair
                          // print(decoded);
                          setState(() {
                            res = decoded;
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ResultPage(
                                  res: res,
                                  s: "NM",
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
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
