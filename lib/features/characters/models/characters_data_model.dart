class CharactersDataModel {
  final String id;
  final String name;
  final String image;
  final String status;
  final String gender;

  CharactersDataModel({required this.id, required this.name, required this.image, required this.status, required this.gender});

  factory CharactersDataModel.fromJson(Map<String, dynamic> json) {
    return CharactersDataModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      status: json['status'],
      gender: json['gender'],
    );
  }
}