import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:real_estate_app/Model/property_model.dart';
import 'package:real_estate_app/screens/detail_screen.dart';

class PropertyCard extends StatelessWidget {
  final PropertyModel propertyModel;

  const PropertyCard({
    super.key,
    required this.propertyModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailScreen(
                        propertyModel: propertyModel,
                      )));
        },
        child: Container(
          width: 330,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Hero(
                tag: propertyModel.housepic,
                child: Container(
                  height: 244,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      image: DecorationImage(
                          image: AssetImage(
                            propertyModel.housepic,
                          ),
                          fit: BoxFit.fill)),
                ),
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
                      Text(
                        propertyModel.title.toUpperCase(),
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        propertyModel.address,
                        style: TextStyle(color: Colors.white38),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.bed,
                            color: Color(0xffF5C945),
                          ),
                          Text(
                            propertyModel.bed,
                            style: TextStyle(color: Colors.white38),
                          ),
                          FaIcon(
                            FontAwesomeIcons.bath,
                            color: Color(0xffF5C945),
                          ),
                          Text(
                            propertyModel.baths,
                            style: TextStyle(color: Colors.white38),
                          ),
                          FaIcon(
                            FontAwesomeIcons.car,
                            color: Color(0xffF5C945),
                          ),
                          Text(
                            propertyModel.garage,
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
  }
}
