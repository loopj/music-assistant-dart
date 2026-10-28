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
