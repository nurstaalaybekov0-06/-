class CatImageModel {
  const CatImageModel({
    required this.id,
    required this.url,
  });

  final String id;
  final String url;

  factory CatImageModel.fromJson(Map<String, dynamic> json) {
    return CatImageModel(
      id: json['id'] as String? ?? '',
      url: json['url'] as String? ?? '',
    );
  }
}
