import 'package:admin_flutter_web/generated/json/base/json_convert_content.dart';

class RoleEntity with JsonConvert<RoleEntity> {
	int id;
	int accountId;
	String name;
	String avatar;
	int main;
	int sub;
	int level;
	int experience;
	String createAt;
}
