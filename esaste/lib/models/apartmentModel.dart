import 'package:esaste/images/imagePath.dart';

class Apartment {
  final String name;
  final ApartmentCategory category;
  final double price;
  final String path;
  final String location;
  final String description;

  Apartment({
    required this.description,
    required this.name,
    required this.category,
    required this.price,
    required this.path,
    required this.location,
  });
}

enum ApartmentCategory {
  lux,
  near,
  neww,
}

class Apartments {
  static Apartment twisthome = Apartment(
    description: """
    The size of an apartment or house can be in square feet meters. In the United States, this includes a area "living space, excluding the garage and other non-living spaces. The
'square meters' figure of a house in Europe.\n
Roughly by the number of rooms. Apartment has a single bedroom with living room studio (possibly a separate kitchen). A one-bedroom apartment has a living dining room separate from the bedroom.
    """,
    location: "Melbourne Australia",
    name: "Twist house",
    category: ApartmentCategory.neww,
    price: 360,
    path: ImagesPath.apartment1,
  );

  static Apartment house1 = Apartment(
    description: "hous1 desc",
    location: "house1 location",
    name: "house1",
    category: ApartmentCategory.neww,
    price: 360,
    path: ImagesPath.house,
  );

  static Apartment house2 = Apartment(
    description: "house2 desc",
    location: "house2 location",
    name: "house2",
    category: ApartmentCategory.neww,
    price: 360,
    path: ImagesPath.house2,
  );

  static Apartment house3 = Apartment(
    description: "house3 desc",
    location: "house3 location",
    name: "house3",
    category: ApartmentCategory.neww,
    price: 360,
    path: ImagesPath.house3,
  );

  static Apartment house4 = Apartment(
    description: "house4 desc",
    location: "house4 location",
    name: "house4",
    category: ApartmentCategory.neww,
    price: 360,
    path: ImagesPath.house4,
  );

  static Apartment apartment2 = Apartment(
    description: "apartment2 desc",
    location: "apartment2 location",
    name: "apartment2",
    category: ApartmentCategory.neww,
    price: 360,
    path: ImagesPath.apartment2,
  );

  static Apartment apartment3 = Apartment(
    description: "apartment3 desc",
    location: "apartment3 location",
    name: "apartment3",
    category: ApartmentCategory.neww,
    price: 360,
    path: ImagesPath.apartment3,
  );

  static Apartment luxury1 = Apartment(
    description: "luxury1 desc",
    location: "luxury1 location",
    name: "luxury1",
    category: ApartmentCategory.neww,
    price: 360,
    path: ImagesPath.luxury1,
  );

  static Apartment luxury2 = Apartment(
    description: "luxury2 desc",
    location: "luxury2 location",
    name: "luxury2",
    category: ApartmentCategory.neww,
    price: 360,
    path: ImagesPath.luxury2,
  );

  static Apartment luxury3 = Apartment(
    description: "luxury3 desc",
    location: "luxury3 location",
    name: "luxury3",
    category: ApartmentCategory.neww,
    price: 360,
    path: ImagesPath.luxury3,
  );
  static Apartment luxury4 = Apartment(
    description: "luxury4 desc",
    location: "luxury4 location",
    name: "luxury4",
    category: ApartmentCategory.neww,
    price: 360,
    path: ImagesPath.luxury4,
  );

  static List<Apartment> houses = [
    twisthome,
    house1,
    house2,
    house3,
    house4,
    luxury1,
    luxury2,
    luxury3,
    luxury4,
    apartment2,
    apartment3
  ];
}
