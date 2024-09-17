import 'package:hive/hive.dart';
part 'address_entity.g.dart';

@HiveType(typeId: 2)
class AddressEntity {
  @HiveField(0)
  final String? name;
  @HiveField(1)
  final String? phone;
  @HiveField(2)
  final String? address;

  AddressEntity(
      {required this.name, required this.phone, required this.address});
}
