import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:firebase_database/firebase_database.dart';

class Home extends StatefulWidget {
  // const Home({Key? key}) : super(key: key);
  static String id = "Home";
  var redColorCode, greenColorCode, blueColorCode;
  final databaseRef = FirebaseDatabase.instance.reference();
  final Future<FirebaseApp> _future = Firebase.initializeApp();

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return WillPopScope(onWillPop: () async { return false; },
        child: Scaffold(
          body: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.deepOrange,
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ColorPicker(
                    pickerColor: Color(0xff443a49),
                    paletteType: PaletteType.hueWheel,
                    onColorChanged: (Color value) {
                      widget.redColorCode = value.red;
                      widget.greenColorCode = value.green;
                      widget.blueColorCode = value.blue;
                      widget.databaseRef.update({
                        "red": (255 - value.red),
                        "green": (255 - value.green),
                        "blue": (255 - value.blue),
                      }).then((_) {

                      }).catchError((onError) {
                        // Scaffold.of(context).showSnackBar(SnackBar(content: Text(onError)));
                      });
                      print('Red-=>${value.red}');
                    },
                    // labelTypes: [ColorLabelType.rgb],
                      // showLabel: false,
              ),
                  ],
                )
              ],
            ),
          ),
        )

    );
  }
}
