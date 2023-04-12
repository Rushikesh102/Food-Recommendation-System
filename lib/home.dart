import 'package:flutter/material.dart';
import 'package:frs/normalMode.dart';
import 'package:frs/ffMode.dart';
import 'package:flutter/services.dart';
Route _createRoute(Widget w) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => w,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

class HomePage extends StatelessWidget {
  void initState() {
    // TODO: implement initState
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  }
  // const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   flexibleSpace: Container(
      //     decoration: const BoxDecoration(
      //       gradient: LinearGradient(
      //         colors: [
      //           const Color.fromARGB(0xFF, 0x0e, 0x66, 0xa4),
      //           const Color.fromARGB(0xFF, 0x92, 0x95, 0xf5),
      //         ],
      //         begin: const FractionalOffset(0.0, 0.0),
      //         end: const FractionalOffset(1.0, 1.0),
      //         stops: [0.0, 1.0],
      //         tileMode: TileMode.clamp,
      //       ),
      //     ),
      //   ),
      // ),
      // endDrawer: Drawer(
      //   child: ListView(
      //     children: [
      //       DrawerHeader(
      //         child: Stack(
      //           children: [
      //             Positioned(
      //               bottom: 8.0,
      //               left: 4.0,
      //               child: Text(
      //                 "Food\nRecommendation\nSystem",
      //                 style: TextStyle(color: Colors.white, fontSize: 25),
      //               ),
      //             )
      //           ],
      //         ),
      //         decoration: BoxDecoration(
      //           gradient: LinearGradient(
      //               colors: [
      //                 const Color.fromARGB(0xFF, 0x0e, 0x66, 0xa4),
      //                 const Color.fromARGB(0xFF, 0x92, 0x95, 0xf5),
      //               ],
      //               begin: const FractionalOffset(0.0, 0.0),
      //               end: const FractionalOffset(1.0, 1.0),
      //               stops: [0.0, 1.0],
      //               tileMode: TileMode.clamp),
      //         ),
      //       ),
      //       Builder(
      //         builder: (context) {
      //           return ListTile(
      //             leading: Icon(Icons.home),
      //             title: Text("Home"),
      //             onTap: () {
      //               Scaffold.of(context).closeEndDrawer();
      //             },
      //           );
      //         }
      //       ),
      //       ListTile(
      //         leading: Icon(Icons.account_box),
      //         title: Text("Normal Mode"),
      //         onTap: () {
      //           Navigator.of(context).push(MaterialPageRoute(
      //               builder: (context) => LoadNormal()
      //           ));
      //         },
      //       ),
      //       ListTile(
      //         leading: Icon(Icons.grid_3x3_outlined),
      //         title: Text("Fast-Food Mode"),
      //         onTap: () {
      //           Navigator.of(context).push(MaterialPageRoute(
      //               builder: (context) => LoadFF()
      //           ));
      //         },
      //       ),
      //       // ListTile(
      //       //   leading: Icon(Icons.contact_mail),
      //       //   title: Text("Login"),
      //       //   onTap: () {},
      //       // )
      //     ],
      //   ),
      // ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: ()=>Navigator.of(context).push(_createRoute(LoadFF())),

              child: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                      Colors.blueGrey.withOpacity(0.4), BlendMode.srcOver),
                  child: Container(
                    // width: double.infinity,
                    // height: 362,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        // fit: orientation == Orientation.portrait ? BoxFit.fitHeight:BoxFit.fitHeight,
                        image: AssetImage("lib/images/fast_food.jpg"),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Fast-Food Mode",
                        style: TextStyle(fontSize: 88, color: Colors.black,),
                      ),
                    ),
                  ),
              ),
            ),
          ),
          SizedBox(
            height: 13,
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: ()=>Navigator.of(context).push(_createRoute(LoadNormal())),
              child: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                      Colors.blueGrey.withOpacity(0.3), BlendMode.srcOver),
                  child: Container(
                        // width: double.infinity,
                        // height: 362,
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            // fit: orientation == Orientation.portrait ? BoxFit.fitHeight:BoxFit.fitHeight,
                            image: AssetImage("lib/images/normal.jpg"),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Normal Mode",
                            style: TextStyle(fontSize: 88, color: Colors.white),
                          ),
                        ),
                      ),
                  )),
            ),
        ],
      ),
    );
  }
}
