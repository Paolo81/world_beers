class Beer {
  final int id;
  final String name;
  final String imageUrl;
  final String description;
  final String abv;
  final String ibu;

  Beer(
      {required this.id,
      required this.name,
      required this.imageUrl,
      required this.description,
      required this.abv,
      required this.ibu});

  factory Beer.fromJson(Map<String, dynamic> json) {
    return Beer(
        id: json['id'],
        name: json['name'],
        imageUrl: json['image_url'],
        description: json['description'],
        abv: json['abv']?.toString() ?? "",
        ibu: json['ibu']?.toString() ?? "");
  }
}
