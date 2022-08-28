class VedioSizes {
  final Sizes large;
  final Sizes tiny;
  final Sizes small;
  final Sizes medium;

  VedioSizes({
    required this.large,
    required this.medium,
    required this.small,
    required this.tiny,
  });
  static VedioSizes convertVedio(Map json) {
    return VedioSizes(
        large: Sizes.convertFromJson(json['large']),
        medium: Sizes.convertFromJson(json['medium']),
        small: Sizes.convertFromJson(json['small']),
        tiny: Sizes.convertFromJson(json['tiny']),
        );
  }
}

class Sizes {
  final int width, height, size;
  final String url;
  Sizes({
    required this.width,
    required this.size,
    required this.height,
    required this.url,
  });

  factory Sizes.convertFromJson(Map json) {
    return Sizes(
        width: json['width'],
        size: json['size'],
        height: json['height'],
        url: json['url']);
  }
}
