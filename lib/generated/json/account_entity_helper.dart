import 'package:admin_flutter_web/entry/account_entity.dart';

accountEntityFromJson(AccountEntity data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['token'] != null) {
		data.token = json['token']?.toString();
	}
	if (json['account'] != null) {
		data.account = json['account']?.toString();
	}
	return data;
}

Map<String, dynamic> accountEntityToJson(AccountEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['name'] = entity.name;
	data['token'] = entity.token;
	data['account'] = entity.account;
	return data;
}