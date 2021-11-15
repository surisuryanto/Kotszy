import 'package:flutter/material.dart';
import 'package:kotszy/models/space.dart';
import 'package:kotszy/theme.dart';
import 'package:kotszy/widgets/facility_item.dart';
import 'package:kotszy/widgets/rating_item.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatefulWidget {
  final Space space;
  DetailPage(this.space);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    launchUrl(String url) async {
      if (await canLaunch(url)) {
        launch(url);
      } else {
        throw (url);
      }
    }

    Future<void> showConfirmation() async {
      return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Konfirmasi'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('Apakah anda yakin akan menghubungi pemilik kost?'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Batal'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text('Hubungi'),
                onPressed: () {
                  Navigator.of(context).pop();
                  launchUrl(
                    'whatsapp://send?text=Hallo saya mau boking dong&phone=6282219075338',
                  );
                },
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Image.network(
              widget.space.imageUrl,
              width: MediaQuery.of(context).size.width,
              height: 350,
              fit: BoxFit.cover,
            ),
            ListView(
              children: [
                SizedBox(
                  height: 328,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                      color: whiteColor),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 30),
                      //NOTE : TITLE
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: edge),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.space.name,
                                  style: blackTextStyle.copyWith(
                                    fontSize: 22,
                                  ),
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Text.rich(
                                  TextSpan(
                                    text: '\$${widget.space.price}',
                                    style:
                                        purpleTextStyle.copyWith(fontSize: 16),
                                    children: [
                                      TextSpan(
                                        text: ' / Month',
                                        style: greyTextStyle.copyWith(
                                            fontSize: 16),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [1, 2, 3, 4, 5].map((index) {
                                return Container(
                                  margin: EdgeInsets.only(left: 2),
                                  child: RatingItem(
                                    index: index,
                                    rating: widget.space.rating,
                                  ),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                      //NOTE : MAIN FACILITIES
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: edge),
                        child: Text(
                          'Main Facilities',
                          style: regularTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: edge,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FacilityItem(
                              name: 'Kitchen',
                              imageUrl: 'assets/images/dapur.png',
                              total: widget.space.numberOfKitchens,
                            ),
                            FacilityItem(
                              name: 'Bedroom',
                              imageUrl: 'assets/images/lomari.png',
                              total: widget.space.numberOfBedrooms,
                            ),
                            FacilityItem(
                              name: 'Lemari',
                              imageUrl: 'assets/images/kasur.png',
                              total: widget.space.numberOfCupboards,
                            ),
                          ],
                        ),
                      ),
                      //NOTE: PHOTOS
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: edge),
                        child: Text(
                          'Photos',
                          style: regularTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Container(
                        height: 88,
                        child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: widget.space.photos.map((item) {
                              return Container(
                                margin: EdgeInsets.only(
                                  left: 24,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                    16,
                                  ),
                                  child: Image.network(
                                    item,
                                    width: 110,
                                    height: 88,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            }).toList()

                            // SizedBox(
                            //   width: edge,
                            // ),
                            // Image.asset(
                            //   'assets/images/f1.png',
                            //   width: 110,
                            //   height: 88,
                            //   fit: BoxFit.cover,
                            // ),
                            // SizedBox(
                            //   width: 12,
                            // ),
                            // Image.asset(
                            //   'assets/images/f2.png',
                            //   width: 110,
                            //   height: 88,
                            //   fit: BoxFit.cover,
                            // ),
                            // SizedBox(
                            //   width: 12,
                            // ),
                            // Image.asset(
                            //   'assets/images/f3.png',
                            //   width: 110,
                            //   height: 88,
                            //   fit: BoxFit.cover,
                            // ),
                            // SizedBox(
                            //   width: 12,
                            // ),
                            // Image.asset(
                            //   'assets/images/f4.png',
                            //   width: 110,
                            //   height: 88,
                            //   fit: BoxFit.cover,
                            // ),
                            // SizedBox(
                            //   width: 12,
                            // ),
                            // Image.asset(
                            //   'assets/images/f5.png',
                            //   width: 110,
                            //   height: 88,
                            //   fit: BoxFit.cover,
                            // ),
                            // SizedBox(
                            //   width: 12,
                            // ),
                            //

                            ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: edge),
                        child: Text(
                          'Location',
                          style: regularTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: edge),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${widget.space.address}n\ ${widget.space.city}',
                              style: greyTextStyle.copyWith(fontSize: 14),
                            ),
                            InkWell(
                              onTap: () {
                                launchUrl(widget.space.mapUrl);
                              },
                              child: Image.asset(
                                'assets/images/btn_map.png',
                                width: 40,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: edge),
                        child: Container(
                          width: MediaQuery.of(context).size.width - (2 * edge),
                          height: 50,
                          child: RaisedButton(
                            onPressed: () {
                              showConfirmation();
                            },
                            color: purpleColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(17),
                            ),
                            child: Text(
                              'Book Now',
                              style: whiteTextStyle,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      )
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 30,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      'assets/images/btn_back.png',
                      width: 48,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isClicked = !isClicked;
                      });
                    },
                    child: Image.asset(
                      isClicked
                          ? 'assets/images/btn_wishlist_active.png'
                          : 'assets/images/btn_wishlist.png',
                      width: 48,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
