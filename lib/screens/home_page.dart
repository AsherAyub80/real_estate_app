import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:real_estate_app/Model/categories.dart';
import 'package:real_estate_app/Model/property_model.dart';
import 'package:real_estate_app/components/property_card.dart';
import 'package:real_estate_app/screens/detail_screen.dart';
import 'package:real_estate_app/screens/whish_list_screen.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void signOutUser() {
    FirebaseAuth.instance.signOut();
  }

  int selectedIndex = 0;

  List<List<PropertyModel>> selectedCategories = [
    house,
    apartment,
    flat,
    bungalow
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Location',
                              style: TextStyle(color: Color(0xff798B96)),
                            ),
                            Text(
                              'Los Angeles, CA',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff0F2F44),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => WhishListScreen()));
                            },
                            child: Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                color: const Color(0xffEAF1FF),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: const Center(
                                child: FaIcon(
                                  size: 30,
                                  FontAwesomeIcons.bookmark,
                                  color: Color(0xff0F2F44),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      'Discover Best\nSuitable Property',
                      strutStyle: StrutStyle(height: 1.2, fontSize: 25),
                      style: TextStyle(
                        height: 1.2,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Color(0xff0F2F44),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  categoryItem(),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20.0,
                      left: 20,
                    ),
                    child: Text(
                      'Best for You',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                        Container(
                          height: 380,
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: selectedCategories[selectedIndex].length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return PropertyCard(
                                propertyModel: selectedCategories[selectedIndex]
                                    [index],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 15),
              child: Text(
                'Nearby Your Location',
                style: TextStyle(fontSize: 16),
              ),
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                NearBy(),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Sign Out',
        onPressed: () {
          signOutUser();
        },
        child: const Icon(Icons.logout_outlined),
      ),
    );
  }

  SizedBox categoryItem() {
    return SizedBox(
      height: 70,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Container(
                height: 30,
                width: categories[index].name.length > 5 ? 150 : 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: selectedIndex == index
                      ? Color(0xff0F2F44)
                      : Color(0xffEAF1FF),
                ),
                child: Center(
                  child: Text(
                    categories[index].name,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: selectedIndex == index
                          ? Colors.white
                          : Color(0xff0E3146),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class NearBy extends StatelessWidget {
  const NearBy({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      width: 400,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(near.length, (index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              DetailScreen(propertyModel: near[index])));
                },
                child: Container(
                  height: 110,
                  width: 350,
                  decoration: BoxDecoration(
                      color: Color(0xffEAF1FF),
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    children: [
                      Container(
                        height: 110,
                        width: 110,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(near[index].housepic),
                              fit: BoxFit.fill),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, top: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              near[index].title,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              near[index].address,
                              style: TextStyle(fontSize: 12),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.bed,
                                  size: 15,
                                  color: Color(0xffF5C945),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  near[index].bed,
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 12),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                FaIcon(
                                  FontAwesomeIcons.bath,
                                  size: 15,
                                  color: Color(0xffF5C945),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  near[index].baths,
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 12),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                FaIcon(
                                  FontAwesomeIcons.car,
                                  size: 15,
                                  color: Color(0xffF5C945),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  near[index].garage,
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 12),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
