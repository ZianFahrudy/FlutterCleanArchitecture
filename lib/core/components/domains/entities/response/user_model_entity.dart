import 'package:equatable/equatable.dart';

class UserModelEntity extends Equatable {
  final int? id;
  final String? name;
  final String? email;
  final String? emailVerifiedAt;
  final String? roles;
  final String? currentTeamId;
  final String? address;
  final String? houseNumber;
  final String? phoneNumber;
  final String? city;
  final int? createdAt;
  final int? updatedAt;
  final String? profilePhotoPath;
  final String? profilePhotoUrl;

  UserModelEntity(
      {this.id,
      this.name,
      this.email,
      this.emailVerifiedAt,
      this.roles,
      this.currentTeamId,
      this.address,
      this.houseNumber,
      this.phoneNumber,
      this.city,
      this.createdAt,
      this.updatedAt,
      this.profilePhotoPath,
      this.profilePhotoUrl});
  @override
  List<Object?> get props => [
        id,
        name,
        email,
        emailVerifiedAt,
        roles,
        currentTeamId,
        address,
        houseNumber,
        phoneNumber,
        city,
        createdAt,
        updatedAt,
        profilePhotoPath,
        profilePhotoUrl
      ];
}
