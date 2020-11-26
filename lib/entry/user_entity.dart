import 'package:admin_flutter_web/generated/json/base/json_convert_content.dart';

class UserEntity with JsonConvert<UserEntity> {
	int id;
	String username;
	String key;
	String name;
}
