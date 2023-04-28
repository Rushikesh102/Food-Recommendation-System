import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  List<dynamic> res;
  String s = "";

  ResultPage({Key? key, required this.res, required this.s}) : super(key: key);
  late List<bool> isExp = List.filled(res.length, false);
  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  List<String> normal_keys = [
    'name',
    'ingredients',
    'diet',
    'flavor_profile',
    'course',
    'state',
    'region',
    // 'Overview',
  ];

  List<String> ff_keys = [
    'Product',
    'Company',
    'Energy (kCal)',
    'Protein (g)',
    'Carbohydrates (g)',
    'Total Fat (g)',
    'Per Serve Size',
    // 'Category',
    // 'Fiber (g)',
    'Sugar (g)',
    // 'Total Fat (g)',
    // 'Saturated Fat (g)',
    // 'Trans Fat (g)',
    // 'Cholesterol (mg)',
    // 'Sodium (mg)',
    // 'Hunger Level',
    // 'Protein Level',
  ];

  // @override
  Widget Body() {
    List<dynamic> lst = [];
    if (widget.s == 'NM') {
      lst = normal_keys;
    } else {
      lst = ff_keys;
    }
    return (widget.res.length > 0) ? ListBuild(lst) : EmptyList();
  }

  Widget EmptyList() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Image.asset("lib/images/404_frs.png",),
          ),
          Text(
            "Oops!!!",
            style: TextStyle(fontSize: 20),
          ),
          Text(
            "No Result found with the given input.",
            style: TextStyle(fontSize: 15),
          ),
        ],
      ),
    );
  }

  Widget ListBuild(List<dynamic> keys) {
    return Container(
      child: new ListView.builder(
          itemCount: widget.res.length,
          itemBuilder: (BuildContext context, int i) {
            return Card(
              color: Colors.white,
              margin: const EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 0.0),
              child: ClipRRect(
                borderRadius: (i % 2 == 0)
                    ? BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  // bottomRight: Radius.circular(20),
                  topRight: Radius.circular(20),
                )
                    : BorderRadius.only(
                  topLeft: Radius.circular(20),
                  // topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                child: new ExpansionPanelList(
                  expansionCallback: (int index, bool status) {
                    setState(() {
                      widget.isExp[i] = !widget.isExp[i];
                    });
                  },
                  children: [
                    ExpansionPanel(
                      backgroundColor: Color.fromRGBO(64, 75, 96, .9),
                      isExpanded: widget.isExp[i],
                      headerBuilder: (BuildContext context, bool isExpanded) =>
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                color: Color.fromRGBO(64, 75, 96, .9)),
                            child: ListTile(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10.0),
                              leading: Container(
                                padding: EdgeInsets.only(right: 12.0),
                                decoration: new BoxDecoration(
                                  border: new Border(
                                    right: new BorderSide(
                                        width: 3.0, color: Colors.white24),
                                  ),
                                ),
                                child: Text(
                                  (i + 1).toString(),
                                  style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                                ),
                              ),
                              title: Text(
                                widget.res[i][keys[0]],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            ),
                          ),
                      body: new Container(
                        // decoration: BoxDecoration(color: Colors.white),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    for (var ind in keys)
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(children: [
                                          Expanded(
                                            flex: 1,
                                            child: Text(
                                              ind.toString(),
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.white),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Center(
                                              child: Text(
                                                widget.res[i][ind].toString(),
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        ]),
                                      ),
                                  ]),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Results"),
        centerTitle: true,
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
      body: Container(
        child: Body(),
      ),
    );
  }
}
