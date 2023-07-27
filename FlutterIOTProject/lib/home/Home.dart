import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class Home extends StatefulWidget {
  // const Home({Key? key}) : super(key: key);
  static String id = "Home";
  var redColorCode, greenColorCode, blueColorCode;

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