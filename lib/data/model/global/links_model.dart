class LinkModel {
  final String rel;
  final String href;

  LinkModel({required this.rel, required this.href});

  factory LinkModel.fromJson(Map<String, dynamic> json) {
    return LinkModel(
      rel: json['rel'] as String,
      href: json['href'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'rel': rel,
      'href': href,
    };
  }
}
