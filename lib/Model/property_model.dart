class PropertyModel {
  final String housepic;
  final int price;
  final String title;
  final String address;
  final String description;
  final String bed;
  final String baths;
  final String garage;
  final String ownerpic;
  final String ownername;

  PropertyModel({
    required this.ownername,
    required this.housepic,
    required this.ownerpic,
    required this.description,
    required this.price,
    required this.title,
    required this.address,
    required this.bed,
    required this.baths,
    required this.garage,
  });
}

final List<PropertyModel> house = [
  PropertyModel(
      price: 289000,
      title: 'CRAFTSMAN HOUSE',
      address: '520 N Btoudry Ave Los Angeles',
      bed: '4 Beds',
      baths: '4 Baths',
      garage: '1 Garage',
      ownerpic: 'images/owner1.jpg',
      description:
          'Completely redone in 2021. 4 bedrooms. 2 bathrooms. 1 garahe. amazing curb oppeal and enterain areawater vews. Tons of built-ins & extras. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
      housepic: 'images/Subtract.png',
      ownername: 'John Doe'),
  PropertyModel(
      price: 3489000,
      title: 'CRAFTSMAN HOUSE 1',
      address: '520 N Btoudry Ave Los Angeles',
      bed: '4 Beds',
      baths: '4 Baths',
      garage: '1 Garage',
      ownerpic: 'images/owner2.jpg',
      description:
          'Completely redone in 2021. 4 bedrooms. 2 bathrooms. 1 garahe. amazing curb oppeal and enterain areawater vews. Tons of built-ins & extras. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
      housepic: 'images/Subtract2.png',
      ownername: 'Franklin'),
  PropertyModel(
      price: 289000,
      title: 'Mediterranean style villa',
      address: '520 N Btoudry Ave Los Angeles',
      bed: '4 Beds',
      baths: '4 Baths',
      garage: '1 Garage',
      ownerpic: 'images/owner1.jpg',
      description:
          'Completely redone in 2021. 4 bedrooms. 2 bathrooms. 1 garahe. amazing curb oppeal and enterain areawater vews. Tons of built-ins & extras. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
      housepic: 'images/house24.jpg',
      ownername: 'John Doe'),
];

final List<PropertyModel> flat = [
  PropertyModel(
      price: 289000,
      title: 'CRAFTSMAN Flat',
      address: '520 N Btoudry Ave Los Angeles',
      bed: '4 Beds',
      baths: '4 Baths',
      garage: '1 Garage',
      ownerpic: 'images/owner1.jpg',
      description:
          'Completely redone in 2021. 4 bedrooms. 2 bathrooms. 1 garahe. amazing curb oppeal and enterain areawater vews. Tons of built-ins & extras. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
      housepic: 'images/flat.jpg',
      ownername: 'John Doe'),
  PropertyModel(
      price: 3489000,
      title: 'CRAFTSMAN Flat 1',
      address: '520 N Btoudry Ave Los Angeles',
      bed: '4 Beds',
      baths: '4 Baths',
      garage: '1 Garage',
      ownerpic: 'images/owner2.jpg',
      description:
          'Completely redone in 2021. 4 bedrooms. 2 bathrooms. 1 garahe. amazing curb oppeal and enterain areawater vews. Tons of built-ins & extras. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
      housepic: 'images/flat2.jpg',
      ownername: 'Franklin')
];

final List<PropertyModel> apartment = [
  PropertyModel(
      price: 289000,
      title: 'CRAFTSMAN Apartment',
      address: '520 N Btoudry Ave Los Angeles',
      bed: '4 Beds',
      baths: '4 Baths',
      garage: '1 Garage',
      ownerpic: 'images/owner1.jpg',
      description:
          'Completely redone in 2021. 4 bedrooms. 2 bathrooms. 1 garahe. amazing curb oppeal and enterain areawater vews. Tons of built-ins & extras. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
      housepic: 'images/apartment1.jpg',
      ownername: 'John Doe'),
  PropertyModel(
      price: 3489000,
      title: 'CRAFTSMAN Apartment 1',
      address: '520 N Btoudry Ave Los Angeles',
      bed: '4 Beds',
      baths: '4 Baths',
      garage: '1 Garage',
      ownerpic: 'images/owner2.jpg',
      description:
          'Completely redone in 2021. 4 bedrooms. 2 bathrooms. 1 garahe. amazing curb oppeal and enterain areawater vews. Tons of built-ins & extras. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
      housepic: 'images/apartmet2.jpg',
      ownername: 'Franklin')
];

final List<PropertyModel> bungalow = [
  PropertyModel(
      price: 289000,
      title: 'colonial houses',
      address: '520 N Btoudry Ave Los Angeles',
      bed: '4 Beds',
      baths: '4 Baths',
      garage: '1 Garage',
      ownerpic: 'images/owner1.jpg',
      description:
          'Completely redone in 2021. 4 bedrooms. 2 bathrooms. 1 garahe. amazing curb oppeal and enterain areawater vews. Tons of built-ins & extras. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
      housepic: 'images/bungalow.jpg',
      ownername: 'John Doe'),
  PropertyModel(
      price: 3489000,
      title: 'CRAFTSMAN BUNGALOW 1',
      address: '520 N Btoudry Ave Los Angeles',
      bed: '4 Beds',
      baths: '4 Baths',
      garage: '1 Garage',
      ownerpic: 'images/owner2.jpg',
      description:
          'Completely redone in 2021. 4 bedrooms. 2 bathrooms. 1 garahe. amazing curb oppeal and enterain areawater vews. Tons of built-ins & extras. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
      housepic: 'images/bungalow2.jpg',
      ownername: 'Franklin')
];

final List<PropertyModel> near = [
  PropertyModel(
      price: 289000,
      title: 'Ranch Home',
      address: '520 N Btoudry Ave Los Angeles',
      bed: '4 Beds',
      baths: '4 Baths',
      garage: '1 Garage',
      ownerpic: 'images/owner1.jpg',
      description:
          'Completely redone in 2021. 4 bedrooms. 2 bathrooms. 1 garahe. amazing curb oppeal and enterain areawater vews. Tons of built-ins & extras. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
      housepic: 'images/ranch.png',
      ownername: 'John Doe'),
  PropertyModel(
      price: 289000,
      title: 'Ranch Home',
      address: '520 N Btoudry Ave Los Angeles',
      bed: '4 Beds',
      baths: '4 Baths',
      garage: '1 Garage',
      ownerpic: 'images/owner2.jpg',
      description:
          'Completely redone in 2021. 4 bedrooms. 2 bathrooms. 1 garahe. amazing curb oppeal and enterain areawater vews. Tons of built-ins & extras. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
      housepic: 'images/ranch.png',
      ownername: 'Franklin'),
];
