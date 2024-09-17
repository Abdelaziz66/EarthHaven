import 'package:hive/hive.dart';
import '../../features/login/domain/entities/login_entity.dart';


void save(String key, value,String boxName) {
  var box = Hive.box(boxName);
  box.put(key,value);
}

void clear(String boxName) {
  var box = Hive.box(boxName);
  box.clear();
}


void saveUserLoginHive(LoginEntity loginEntity, String boxName) {
  var box = Hive.box<LoginEntity>(boxName);
  box.put('loginEntity',loginEntity);
}