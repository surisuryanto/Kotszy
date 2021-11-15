import 'package:flutter/material.dart';
import 'package:kotszy/models/city.dart';
import 'package:kotszy/models/space.dart';
import 'package:kotszy/models/tips.dart';
import 'package:kotszy/pages/tipscard.dart';
import 'package:kotszy/providers/space_provider.dart';
import 'package:kotszy/theme.dart';
import 'package:kotszy/widgets/bottom_navbar.dart';
import 'package:kotszy/widgets/citycard.dart';
import 'package:kotszy/widgets/spacecard.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var spaceProvider = Provider.of<SpaceProvider>(context);

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: ListView(
          children: [
            SizedBox(
              height: edge,
            ),
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Explore Now',
                style: blackTextStyle.copyWith(fontSize: 24),
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'mencari kostan yang cozy',
                style: greyTextStyle.copyWith(fontSize: 16),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Popular Citys',
                style: regularTextStyle.copyWith(fontSize: 16),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(
                    width: 18,
                  ),
                  CityCard(
                    City(
                        id: 1,
                        name: 'Jakarta',
                        imageUrl: 'assets/images/jkt.png'),
                  ),
                  SizedBox(
                    width: 18,
                  ),
                  CityCard(
                    City(
                        id: 2,
                        name: 'Bandung',
                        imageUrl: 'assets/images/bdg.png',
                        isPopular: true),
                  ),
                  SizedBox(
                    width: 18,
                  ),
                  CityCard(
                    City(
                        id: 3,
                        name: 'Surabaya',
                        imageUrl: 'assets/images/sby.png'),
                  ),
                  SizedBox(
                    width: 18,
                  ),
                  CityCard(
                    City(
                        id: 4,
                        name: 'Palembang',
                        imageUrl: 'assets/images/plb.png'),
                  ),
                  SizedBox(
                    width: 18,
                  ),
                  CityCard(
                    City(
                        id: 5,
                        name: 'Aceh',
                        imageUrl: 'assets/images/aceh.png',
                        isPopular: true),
                  ),
                  SizedBox(
                    width: 18,
                  ),
                  CityCard(
                    City(
                        id: 6,
                        name: 'Bogor',
                        imageUrl: 'assets/images/bgr.png',
                        isPopular: false),
                  ),
                  SizedBox(
                    width: 18,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Recomended Space',
                style: regularTextStyle.copyWith(fontSize: 16),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: FutureBuilder(
                future: spaceProvider.getRecommendedSpaces(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Space> data = snapshot.data;

                    int index = 0;

                    return Column(
                      children: data.map((item) {
                        index++;
                        return Container(
                          margin: EdgeInsets.only(
                            top: index == 1 ? 0 : 30,
                          ),
                          child: SpaceCard(item),
                        );
                      }).toList(),
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
            // NOTE: Tips & Guid
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Tips & Guid',
                style: blackTextStyle.copyWith(fontSize: 16),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: edge),
              child: Column(
                children: [
                  TipsCard(Tips(
                      id: 1,
                      title: 'City Guidlines',
                      updatedAt: '20 April',
                      imageUrl: 'assets/images/icon_city.png')),
                  SizedBox(
                    height: 10,
                  ),
                  TipsCard(Tips(
                      id: 2,
                      title: 'Jakarta',
                      updatedAt: '11 December',
                      imageUrl: 'assets/images/icon_city2.png')),
                ],
              ),
            ),
            SizedBox(
              height: 50 + edge,
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        height: 52,
        width: MediaQuery.of(context).size.width - (2 * edge),
        margin: EdgeInsets.symmetric(horizontal: edge),
        decoration: BoxDecoration(
          color: Color(0xffF6F7F8),
          borderRadius: BorderRadius.circular(23),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomNavbarItem(
              imageUrl: 'assets/images/icon_home.png',
              isActive: true,
            ),
            BottomNavbarItem(
              imageUrl: 'assets/images/icon_card.png',
              isActive: false,
            ),
            BottomNavbarItem(
              imageUrl: 'assets/images/icon_email.png',
              isActive: false,
            ),
            BottomNavbarItem(
              imageUrl: 'assets/images/icon_love.png',
              isActive: false,
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
