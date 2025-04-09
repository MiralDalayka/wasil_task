class UserEntity {
  final String firstName;
  final String secondName;
  final DateTime dateOfBirth;
  final String phoneNumber;
  final String email;
  final String language;
  final String coinType;
  final bool useGlobalAccount;
  final bool acceptedTerms;

  UserEntity({
    required this.firstName,
    required this.secondName,
    required this.dateOfBirth,
    required this.phoneNumber,
    required this.email,
    required this.language,
    required this.coinType,
    required this.useGlobalAccount,
    required this.acceptedTerms,
  });
}
