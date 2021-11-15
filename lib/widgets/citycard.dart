import 'package:flutter/material.dart';
import 'package:kotszy/models/city.dart';
import 'package:kotszy/theme.dart';

class CityCard extends StatelessWidget {
  final City city;
  CityCard(this.city);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Container(
        height: 150,
        width: 102,
        color: Color(0xffF6F7F8),
        child: Column(
          children: [
            Stack(
              children: [
                Center(
                  child: Image.asset(
                    city.imageUrl,
                    width: 120,
                    height: 102,
                    fit: BoxFit.cover,
                  ),
                ),
                city.isPopular
                    ? Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          width: 50,
                          height: 30,
                          decoration: BoxDecoration(
                            color: purpleColor,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(36),
                            ),
                          ),
                          child: Center(
                            child: Image.asset(
                              'assets/images/star.png',
                              width: 35,
                              height: 35,
                            ),
                          ),
                        ),
                      )
                    : Container(),
              ],
            ),
            SizedBox(
              height: 11,
            ),
            Text(
              city.name,
              style: regularTextStyle.copyWith(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
