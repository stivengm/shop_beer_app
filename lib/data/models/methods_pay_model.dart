import 'dart:convert';

List<MethodsPayModel> methodsPayModelFromJson(String str) => List<MethodsPayModel>.from(json.decode(str).map((x) => MethodsPayModel.fromJson(x)));

String methodsPayModelToJson(List<MethodsPayModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MethodsPayModel {
    String description;
    String img;
    String name;
    int typeMethodId;
    String zona;

    MethodsPayModel({
        required this.description,
        required this.img,
        required this.name,
        required this.typeMethodId,
        required this.zona,
    });

    MethodsPayModel copyWith({
        String? description,
        String? img,
        String? name,
        int? typeMethodId,
        String? zona,
    }) => 
        MethodsPayModel(
            description: description ?? this.description,
            img: img ?? this.img,
            name: name ?? this.name,
            typeMethodId: typeMethodId ?? this.typeMethodId,
            zona: zona ?? this.zona,
        );

    factory MethodsPayModel.fromJson(Map<String, dynamic> json) => MethodsPayModel(
        description: json["description"],
        img: json["img"],
        name: json["name"],
        typeMethodId: json["typeMethodId"],
        zona: json["zona"],
    );

    Map<String, dynamic> toJson() => {
        "description": description,
        "img": img,
        "name": name,
        "typeMethodId": typeMethodId,
        "zona": zona,
    };
}
