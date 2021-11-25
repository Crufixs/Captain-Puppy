class Breed {
  final int id;
  final String name;
  final String lifeSpan;
  final String temperament;
  final String weight;
  final String height;
  final String imageURL;

  Breed(
      {required this.id,
      required this.name,
      required this.lifeSpan,
      required this.temperament,
      required this.weight,
      required this.height,
      required this.imageURL});

  Map<String, dynamic> toMap() {
    return {
      'breed_id': id,
      'name': name,
      'life_span': lifeSpan,
      'temperament': temperament,
      'weight': weight,
      'height': height,
      'image_url': imageURL
    };
  }

  @override
  String toString() {
    return 'Breed{id: $id, name: $name, lifeSpan: $lifeSpan, temperament: $temperament, weight: $weight, height: $height, image_url: $imageURL}';
  }
}
