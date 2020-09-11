import 'package:admin_flutter_web/entry/user_entity.dart';

accountEntityFromJson(UserEntity data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['token'] != null) {
		data.token = json['token']?.toString();
	}
	if (json['username'] != null) {
		data.username = json['username']?.toString();
	}
	return data;
}

Map<String, dynamic> accountEntityToJson(UserEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['name'] = entity.name;
	data['token'] = entity.token;
	data['username'] = entity.username;
	return data;
}