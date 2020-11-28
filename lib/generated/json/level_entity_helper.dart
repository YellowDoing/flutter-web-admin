import 'package:admin_flutter_web/entry/level_entity.dart';

levelEntityFromJson(LevelEntity data, Map<String, dynamic> json) {
	if (json['level'] != null) {
		data.level = json['level']?.toInt();
	}
	if (json['experience'] != null) {
		data.experience = json['experience']?.toInt();
	}
	return data;
}

Map<String, dynamic> levelEntityToJson(LevelEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['level'] = entity.level;
	data['experience'] = entity.experience;
	return data;
}