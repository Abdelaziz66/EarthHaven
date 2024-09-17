
import '../../domain/entities/address_entity.dart';

class AddressModel extends AddressEntity {
  AddressModel({super.name, super.phone, super.address});

  factory AddressModel.fromJson(Map<String?, dynamic>? json) => AddressModel(
        name: json?['name'],
        phone: json?['phone'],
        address: json?['address'],
      );

  Map<String, dynamic> toMap() {
    return {
      'name': super.name,
      'phone': super.phone,
      'address': super.address,
    };
  }
}
