import 'package:json_annotation/json_annotation.dart';

/// Converts an RGB color between a JSON `[r, g, b]` array and a record.
class RgbConverter extends JsonConverter<(int, int, int)?, List<dynamic>?> {
  const RgbConverter();

  @override
  (int, int, int)? fromJson(List<dynamic>? json) =>
      json == null ? null : ((json[0] as num).toInt(), (json[1] as num).toInt(), (json[2] as num).toInt());

  @override
  List<dynamic>? toJson((int, int, int)? rgb) => rgb == null ? null : [rgb.$1, rgb.$2, rgb.$3];
}

/// Reads a list whose entries are either names or objects carrying a name, such as audiobook authors.
class NameListConverter extends JsonConverter<List<String>, List<dynamic>> {
  const NameListConverter();

  @override
  List<String> fromJson(List<dynamic> json) =>
      [for (final entry in json) entry is Map ? entry['name'] as String? ?? '' : entry as String];

  @override
  List<dynamic> toJson(List<String> names) => names;
}

/// Reads a flag sent as a boolean or as 0 and 1, like the official app.
class FlexibleBoolConverter extends JsonConverter<bool?, Object?> {
  const FlexibleBoolConverter();

  @override
  bool? fromJson(Object? json) => json is num ? json != 0 : json as bool?;

  @override
  Object? toJson(bool? flag) => flag;
}
