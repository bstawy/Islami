class RadiosResponse {
  List<RadioStation>? radios;

  RadiosResponse({this.radios});

  RadiosResponse.fromJson(Map<String, dynamic> json) {
    if (json['radios'] != null) {
      radios = [];
      json['radios'].forEach((v) {
        radios!.add(RadioStation.fromJson(v));
      });
    }
  }
}

class RadioStation {
  int? id;
  String? name;
  String? url;

  RadioStation({
    this.id,
    this.name,
    this.url,
  });

  RadioStation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    url = json['url'];
  }
}
