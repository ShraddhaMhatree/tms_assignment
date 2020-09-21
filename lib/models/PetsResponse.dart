class PetsResponse {
  List<Pets> pets;

  PetsResponse({this.pets});

  PetsResponse.fromJson(Map<String, dynamic> json) {
    if (json['pets'] != null) {
      pets = new List<Pets>();
      json['pets'].forEach((v) {
        pets.add(new Pets.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pets != null) {
      data['pets'] = this.pets.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Pets {
  String name;
  String species;
  int birthYear;
  String photo;

  Pets({this.name, this.species,
    this.birthYear, this.photo});

  Pets.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    species = json['species'];
    birthYear = json['birthYear'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['species'] = this.species;
    data['birthYear'] = this.birthYear;
    data['photo'] = this.photo;
    return data;
  }
}
