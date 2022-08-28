import 'package:http_app/model/vediodetails.dart';

class Vedio {
  final int id;
  final VedioSizes vedio;

  Vedio({
    required this.id,
    required this.vedio,
  });

  static Vedio convertJsonToVedio(Map json) {
    return Vedio(
      id: json['id'],
      vedio: VedioSizes.convertVedio(json['videos']),
    );
  }
}
