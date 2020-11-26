import 'package:admin_flutter_web/entry/user_entity.dart';

userEntityFromJson(UserEntity data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['username'] != null) {
		data.username = json['username']?.toString();
	}
	if (json['key'] != null) {
		data.key = json['key']?.toString();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	return data;
}

Map<String, dynamic> userEntityToJson(UserEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['username'] = entity.username;
	data['key'] = entity.key;
	data['name'] = entity.name;
	return data;
}