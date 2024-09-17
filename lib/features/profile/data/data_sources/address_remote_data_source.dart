import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:earth_haven/features/profile/data/models/address_model.dart';
import '../../../../core/constants/constant.dart';
import '../../../../core/functions/hive_function.dart';
import '../../domain/entities/address_entity.dart';

abstract class AddressRemoteDataSource {
  Future<List<AddressEntity>> getAddress();
  Future<void> uploadAddress({required AddressEntity addressEntity});
}

class AddressRemoteDataSourceImpl extends AddressRemoteDataSource {
  @override
  Future<List<AddressEntity>> getAddress() async {
    List<AddressEntity> addressEntity = [];
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .collection('address')
        .get()
        .then((value) {
      addressEntity = _getAddressList(value);
      // saveAddressHive(addressEntity, kAddressBox);
      return addressEntity;
    });
    return addressEntity;
  }

  @override
  Future<void> uploadAddress({required AddressEntity addressEntity}) async {
    Map<String, String> data = {
      'name': addressEntity.name!,
      'phone': addressEntity.phone!,
      'address': addressEntity.address!,
    };
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .collection('address')
        .add(data);
  }

  List<AddressEntity> _getAddressList(
      QuerySnapshot<Map<String, dynamic>> value) {
    List<AddressEntity> addressEntity = [];
    for (int i = 0; i < value.docs.length; i++) {
      addressEntity.add(AddressModel.fromJson(value.docs[i].data()));
    }
    return addressEntity;
  }
}
