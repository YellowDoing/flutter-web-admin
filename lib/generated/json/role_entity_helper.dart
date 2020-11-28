import 'package:admin_flutter_web/entry/role_entity.dart';

roleEntityFromJson(RoleEntity data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['accountId'] != null) {
		data.accountId = json['accountId']?.toInt();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['avatar'] != null) {
		data.avatar = json['avatar']?.toString();
	}
	if (json['main'] != null) {
		data.main = json['main']?.toInt();
	}
	if (json['sub'] != null) {
		data.sub = json['sub']?.toInt();
	}
	if (json['level'] != null) {
		data.level = json['level']?.toInt();
	}
	if (json['experience'] != null) {
		data.experience = json['experience']?.toInt();
	}
	if (json['createAt'] != null) {
		data.createAt = json['createAt']?.toString();
	}
	return data;
}

Map<String, dynamic> roleEntityToJson(RoleEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['accountId'] = entity.accountId;
	data['name'] = entity.name;
	data['avatar'] = entity.avatar;
	data['main'] = entity.main;
	data['sub'] = entity.sub;
	data['level'] = entity.level;
	data['experience'] = entity.experience;
	data['createAt'] = entity.createAt;
	return data;
}