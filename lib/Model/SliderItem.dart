// Model class to represent slider data
class SliderModel {
  String? status;
  List<SliderData>? data;

  SliderModel({this.status, this.data});

  factory SliderModel.fromJson(Map<String, dynamic> json) {
    return SliderModel(
      status: json['status'],
      data: (json['data'] as List).map((i) => SliderData.fromJson(i)).toList(),
    );
  }
}

class SliderData {
  String? id;
  String? slider;
  String? url;

  SliderData({this.id, this.slider, this.url});

  factory SliderData.fromJson(Map<String, dynamic> json) {
    return SliderData(
      id: json['id'],
      slider: json['slider'],
      url: json['url'],
    );
  }
}
