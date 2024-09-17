// import 'package:hive/hive.dart';
// import '../../../../core/constants/constant.dart';
// import '../../domain/entities/address_entity.dart';
//
// abstract class AddressLocalDataSource {
//   Future<List<AddressEntity>> getAddress();
// }
//
// class AddressLocalDataSourceImpl extends AddressLocalDataSource {
//   @override
//   Future<List<AddressEntity>> getAddress() async {
//     List<AddressEntity> addressEntity = [];
//     var box = Hive.box<AddressEntity>(kAddressBox);
//     addressEntity = box.values.toList();
//     return addressEntity;
//   }
// }
