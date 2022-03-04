class Beer {
  final int id;
  final String name;
  final String imageUrl;
  final String description;
  final String abv;
  final String ibu;
  final String firstBrewed;
  final List<dynamic> foodPairing;
  final String brewersTips;

  Beer(
      {required this.id,
      required this.name,
      required this.imageUrl,
      required this.description,
      required this.abv,
      required this.ibu,
      required this.firstBrewed,
      required this.foodPairing,
      required this.brewersTips});

  factory Beer.fromJson(Map<String, dynamic> json) {
    return Beer(
        id: json['id'],
        name: json['name'],
        imageUrl: json['image_url'],
        description: json['description'],
        abv: json['abv']?.toString() ?? "N/A",
        ibu: json['ibu']?.toString() ?? "N/A",
        firstBrewed: json['first_brewed'] ?? "N/A",
        foodPairing: json['food_pairing'] ?? [],
        brewersTips: json['brewers_tips'] ?? "N/A");
  }
}
