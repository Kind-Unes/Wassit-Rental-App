class CarModel {
  final String id;
  final String agencyId;
  final String name;
  final String lowerCaseName;
  final String lowerCaseModelName;
  final String description;
  final bool isActivated;
  final DateTime dateAdded;
  final DateTime dateUpdated;
  final List viewers;
  final List imagesUrl;
  final double rate;

  // features


  final double pricePerDay;
  final String modelNameLowerCase;

  final CarColors color;
  final int year;
  final int seatsNumber;
  
  final bool isAutomatic; // Gearbox (AUTOMATIC OR Manual)
  final FuelType fuelType;
  final int enginePower;
  final Trim trim;
  final String modelName;
  final CarBrand brand;
  final int mileage;
  final bool isAirConditioner;

  CarModel({
    required this.id,
    required this.agencyId,
    required this.name,
    required this.lowerCaseName,
    required this.modelName,
    required this.lowerCaseModelName,
    required this.description,
    required this.isActivated,
    required this.dateAdded,
    required this.dateUpdated,
    required this.viewers,
    required this.imagesUrl,
    required this.rate,
    required this.color,
    required this.year,
    required this.seatsNumber,
    required this.pricePerDay,
    required this.isAutomatic,
    required this.fuelType,
    required this.enginePower,
    required this.trim,
    required this.modelNameLowerCase,
    required this.brand,
    required this.mileage,
    required this.isAirConditioner,
  });

  factory CarModel.fromJson(Map<String, dynamic> json) {
    return CarModel(
      id: json['id'],
      agencyId: json['agencyId'],
      name: json['name'],
      lowerCaseName: json['lowerCaseName'],
      modelName: json['modelName'],
      lowerCaseModelName: json['lowerCaseModelName'],
      description: json['description'],
      isActivated: json['isActivated'],
      dateAdded: DateTime.parse(json['dateAdded']),
      dateUpdated: DateTime.parse(json['dateUpdated']),
      viewers: List<dynamic>.from(json['viewers']),
      imagesUrl: List<dynamic>.from(json['imagesUrl']),
      rate: json['rate'],
      color: CarColors.values[json['color']],
      year: json['year'],
      seatsNumber: json['seatsNumber'],
      pricePerDay: json['pricePerDay'],
      isAutomatic: json['isAutomatic'],
      fuelType: FuelType.values[json['fuelType']],
      enginePower: json['enginePower'],
      trim: Trim.values[json['trim']],
      modelNameLowerCase: json['modelNameLowerCase'],
      brand: CarBrand.values[json['brand']],
      mileage: json['mileage'],
      isAirConditioner: json['isAirConditioner'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'agencyId': agencyId,
      'name': name,
      'lowerCaseName': lowerCaseName,
      'modelName': modelName,
      'lowerCaseModelName': lowerCaseModelName,
      'description': description,
      'isActivated': isActivated,
      'dateAdded': dateAdded.toIso8601String(),
      'dateUpdated': dateUpdated.toIso8601String(),
      'viewers': viewers,
      'imagesUrl': imagesUrl,
      'rate': rate,
      'color': color.index,
      'year': year,
      'seatsNumber': seatsNumber,
      'pricePerDay': pricePerDay,
      'isAutomatic': isAutomatic,
      'fuelType': fuelType.index,
      'enginePower': enginePower,
      'trim': trim.index,
      'modelNameLowerCase': modelNameLowerCase,
      'brand': brand.index,
      'mileage': mileage,
      'isAirConditioner': isAirConditioner,
    };
  }
}

enum CarColors {
  black,
  white,
  gray,
  silver,
  blue,
  red,
  green,
  yellow,
  brown,
  gold,
  orange,
  beige,
}

enum FuelType {
  diesel,
  petrol,
  electric,
  hybrid,
  lpg,
  cng,
}

enum Trim {
  basic,
  comfort,
  sport,
  luxury,
  rLine,
  se,
  sel,
  limited,
  platinum,
}

enum CarBrand {
  acura,
  alfaRomeo,
  astonMartin,
  audi,
  bentley,
  bMW,
  bugatti,
  buick,
  cadillac,
  chevrolet,
  chrysler,
  citroen,
  dacia,
  daewoo,
  daihatsu,
  dodge,
  ferrari,
  fiat,
  ford,
  genesis,
  gMC,
  honda,
  hyundai,
  infiniti,
  isuzu,
  jaguar,
  jeep,
  kia,
  lamborghini,
  lancia,
  landRover,
  lexus,
  lincoln,
  lotus,
  maserati,
  mazda,
  mcLaren,
  mercedesBenz,
  mG,
  mini,
  mitsubishi,
  nissan,
  opel,
  pagani,
  peugeot,
  porsche,
  rAM,
  renault,
  rollsRoyce,
  saab,
  subaru,
  suzuki,
  tesla,
  toyota,
  volkswagen,
  volvo,
  abarth,
  ariel,
  caterham,
  fisker,
  hummer,
  koenigsegg,
  lada,
  lucid,
  mahindra,
  maybach,
  morgan,
  polestar,
  rivian,
  sEAT,
  skoda,
  smart,
  tata,
  tatra,
  tVR,
  vauxhall,
  wiesmann
}
