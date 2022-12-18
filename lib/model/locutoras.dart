class Locutora {
  String? id;
  String? nameLocutora;
  String? lastnameLocutora;
  String? namePrograma;
  String? image;
  String? instagram;
  String? twitter;
  String? facebook;
  String? youtube;

  Locutora(
      {this.id,
        this.nameLocutora,
        this.lastnameLocutora,
        this.namePrograma,
        this.image,
        this.instagram,
        this.twitter,
        this.facebook,
        this.youtube});

  Locutora.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameLocutora = json['name_locutora'];
    lastnameLocutora = json['lastname_locutora'];
    namePrograma = json['name_programa'];
    image = json['image'];
    instagram = json['instagram'];
    twitter = json['twitter'];
    facebook = json['facebook'];
    youtube = json['youtube'];
  }
}