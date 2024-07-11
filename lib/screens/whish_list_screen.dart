import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:real_estate_app/provider/whishlist_provider.dart';
import 'package:real_estate_app/screens/detail_screen.dart';

class WhishListScreen extends StatelessWidget {
  const WhishListScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 30, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Whishlist',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    color: const Color(0xffEAF1FF),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        size: 30,
                        Icons.arrow_back_ios,
                        color: Color(0xff0F2F44),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          WhishListCard(),
        ],
      ),
    );
  }
}

class WhishListCard extends StatelessWidget {
  const WhishListCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Consumer<WhishlistProvider>(
      builder: (context, value, child) {
        final finalist = value.whishlist.toList();
        return ListView.builder(
          itemCount: finalist.length,
          itemBuilder: (context, index) {
            final whishlistItem = finalist[index];

            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailScreen(
                              propertyModel: whishlistItem,
                            )));
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Container(
                  width: 340,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 244,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20)),
                            image: DecorationImage(
                                image: AssetImage(
                                  whishlistItem.housepic,
                                ),
                                fit: BoxFit.fill)),
                      ),
                      Container(
                        height: 120,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Color(0xff0E3146),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20))),
                        child: Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        whishlistItem.title,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                      Text(
                                        whishlistItem.address,
                                        style: TextStyle(color: Colors.white38),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 5.0, right: 10),
                                    child: GestureDetector(
                                      onTap: () {
                                        value.toggleWhishList(whishlistItem);
                                      },
                                      child: Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          color: const Color(0xffEAF1FF),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: Center(
                                          child: FaIcon(
                                            size: 15,
                                            FontAwesomeIcons.solidBookmark,
                                            color: Color(0xff0F2F44),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  FaIcon(
                                    FontAwesomeIcons.bed,
                                    color: Color(0xffF5C945),
                                  ),
                                  Text(
                                    whishlistItem.bed,
                                    style: TextStyle(color: Colors.white38),
                                  ),
                                  FaIcon(
                                    FontAwesomeIcons.bath,
                                    color: Color(0xffF5C945),
                                  ),
                                  Text(
                                    whishlistItem.baths,
                                    style: TextStyle(color: Colors.white38),
                                  ),
                                  FaIcon(
                                    FontAwesomeIcons.car,
                                    color: Color(0xffF5C945),
                                  ),
                                  Text(
                                    whishlistItem.garage,
                                    style: TextStyle(color: Colors.white38),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    ));
  }
}
