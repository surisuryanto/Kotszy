import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:kotszy/pages/homepage.dart';
import 'package:kotszy/theme.dart';

class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                'assets/images/404.png',
                width: 300,
              ),
            ),
            SizedBox(
              height: 14,
            ),
            Text(
              'Where are you going?',
              style: blackTextStyle.copyWith(fontSize: 24),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 14,
            ),
            Text(
              'Seems like the page that you were n\ requested is already gone',
              style: greyTextStyle.copyWith(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              width: 210,
              height: 50,
              child: RaisedButton(
                onPressed: () {
                  // Navigator.pushAndRemoveUntil(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context),
                  //     ),
                  //     (route) => false);
                },
                color: purpleColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(17),
                ),
                child: Text(
                  'Back To Home',
                  style: whiteTextStyle.copyWith(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
