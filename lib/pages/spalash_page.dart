import 'package:flutter/material.dart';
import 'package:kotszy/pages/homepage.dart';
import 'package:kotszy/theme.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
          child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset('assets/images/splas_screen.png'),
          ),
          // ),
          Padding(
            padding: const EdgeInsets.only(top: 50.0, left: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/logo.png'),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Find Cozy House \nto Stay and Happy',
                  style: blackTextStyle.copyWith(
                      fontWeight: FontWeight.w900, fontSize: 24),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Stop membuang banyak waktu \npada tempat yang tidak habitable',
                  style: greyTextStyle,
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  height: 50,
                  width: 210,
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                      );
                    },
                    color: purpleColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(17)),
                    child: Text(
                      'Explor Now',
                      style: whiteTextStyle.copyWith(fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
