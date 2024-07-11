import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:real_estate_app/Model/property_model.dart';
import 'package:real_estate_app/components/gallery.dart';
import 'package:real_estate_app/provider/whishlist_provider.dart';

class DetailScreen extends StatelessWidget {
  final PropertyModel propertyModel;
  const DetailScreen({super.key, required this.propertyModel});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<WhishlistProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Detail',
                      style: TextStyle(
                          color: Color(0xff0F2F44),
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
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
              Hero(
                tag: propertyModel.housepic,
                child: Container(
                  height: 300,
                  width: 380,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage(propertyModel.housepic),
                          fit: BoxFit.fill)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          propertyModel.title.toUpperCase(),
                          style: TextStyle(
                              fontSize:
                                  propertyModel.title.length > 10 ? 20 : 15,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          propertyModel.address,
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        provider.toggleWhishList(propertyModel);
                      },
                      child: Container(
                        height: 60,
                        width: 55,
                        decoration: BoxDecoration(
                          color: const Color(0xffEAF1FF),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: FaIcon(
                            size: 25,
                            provider.isExist(propertyModel)
                                ? FontAwesomeIcons.solidBookmark
                                : FontAwesomeIcons.bookmark,
                            color: Color(0xff0F2F44),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  const FaIcon(
                    FontAwesomeIcons.bed,
                    color: Color(0xffF5C945),
                    size: 20,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    propertyModel.bed,
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const FaIcon(
                    FontAwesomeIcons.bath,
                    size: 20,
                    color: Color(0xffF5C945),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    propertyModel.baths,
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const FaIcon(
                    FontAwesomeIcons.car,
                    size: 20,
                    color: Color(0xffF5C945),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    propertyModel.garage,
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              OwnerDetail(propertyModel: propertyModel),
              ExpandableText(
                propertyModel.description,
                expandText: 'show more',
                collapseText: 'show less',
                maxLines: 3,
                linkColor: Color(0xff0F2F44),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Gallery',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              Row(
                children: List.generate(
                  gallery.length,
                  (index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: AssetImage(gallery[index]),
                              fit: BoxFit.fill)),
                    ),
                  ),
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Price'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$${propertyModel.price}",
                          style: TextStyle(
                              fontSize: 20,
                              color: Color(0xff0F2F44),
                              fontWeight: FontWeight.bold),
                        ),
                        Container(
                          child: Center(
                              child: Text('Buy Now',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500))),
                          height: 40,
                          width: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(
                              0xff103144,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OwnerDetail extends StatelessWidget {
  const OwnerDetail({
    super.key,
    required this.propertyModel,
  });

  final PropertyModel propertyModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage(propertyModel.ownerpic),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  propertyModel.ownername,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                Text(
                  'Owner ${propertyModel.title}',
                  style: TextStyle(color: Colors.grey.shade800, fontSize: 10),
                ),
              ],
            ),
          ],
        ),
        Container(
          height: 35,
          width: 90,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FaIcon(
                  FontAwesomeIcons.phone,
                  color: Colors.white,
                  size: 20,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'Call',
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
          decoration: BoxDecoration(
              color: Color(0xff103144),
              borderRadius: BorderRadius.circular(12)),
        ),
      ],
    );
  }
}
