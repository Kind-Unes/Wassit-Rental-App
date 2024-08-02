// ignore_for_file: constant_identifier_names

class SetupInfoModel {
  final String agencyName;
  final String ownerName;
  final Wilaya wilaya;
  final String city;
  final String imageUrl;
  final String phoneNumber;

  SetupInfoModel({
    required this.agencyName,
    required this.ownerName,
    required this.wilaya,
    required this.city,
    required this.imageUrl,
    required this.phoneNumber,
  });

  // copyWith

  SetupInfoModel copyWith({
    String? ownerName,
    String? agencyName,
    Wilaya? wilaya,
    String? city,
    String? imageUrl,
    String? phoneNumber,
  }) {
    return SetupInfoModel(
      ownerName: ownerName ?? this.ownerName,
      agencyName: ownerName ?? this.ownerName,
      wilaya: wilaya ?? this.wilaya,
      city: city ?? this.city,
      imageUrl: imageUrl ?? this.imageUrl,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }
}

// algeria wilaya 58
enum Wilaya {
  Adrar,
  Chlef,
  Laghouat,
  OumElBouaghi,
  Batna,
  Bejaia,
  Biskra,
  Bechar,
  Blida,
  Bouira,
  Tamanrasset,
  Tebessa,
  Tlemcen,
  Tiaret,
  TiziOuzou,
  Alger,
  Djelfa,
  Jijel,
  Setif,
  Saida,
  Skikda,
  SidiBelAbbes,
  Annaba,
  Guelma,
  Constantine,
  Medea,
  Mostaganem,
  MSila,
  Mascara,
  Ouargla,
  Oran,
  ElBayadh,
  Illizi,
  BordjBouArreridj,
  Boumerdes,
  ElTarf,
  Tindouf,
  Tissemsilt,
  ElOued,
  Khenchela,
  SoukAhras,
  Tipaza,
  Mila,
  AinDefla,
  Naama,
  AinTemouchent,
  Ghardaia,
  Relizane,
  Timimoun,
  BordjBadjiMokhtar,
  OuledDjellal,
  BeniAbbes,
  InSalah,
  InGuezzam,
  Touggourt,
  Djanet,
  ElMghair,
  ElMeniaa
}
