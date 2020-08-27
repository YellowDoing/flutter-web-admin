import 'package:admin_flutter_web/generated/json/base/json_convert_content.dart';

class AccountEntity with JsonConvert<AccountEntity> {
	int id;
	String name;
	String token;
	String account;
}
