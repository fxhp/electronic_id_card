class CardInfoModel {
  final String firstName;
  final String lastName;
  final String idCardNumber;
  final String photoUrl;
  final String nationality;
  final String birthdate;
  final String expDate;
  final bool isValid;

  const CardInfoModel({
    required this.firstName,
    required this.lastName,
    required this.idCardNumber,
    required this.photoUrl,
    required this.nationality,
    required this.birthdate,
    required this.expDate,
    this.isValid = false,
  });
}