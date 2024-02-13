import 'dart:convert';

List<StoresModel> storesModelFromJson(String str) => List<StoresModel>.from(json.decode(str).map((x) => StoresModel.fromJson(x)));

String storesModelToJson(List<StoresModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StoresModel {
    String name;
    String phoneVenta;
    bool show;
    String value;

    StoresModel({
        required this.name,
        required this.phoneVenta,
        required this.show,
        required this.value,
    });

    StoresModel copyWith({
        String? name,
        String? phoneVenta,
        bool? show,
        String? value,
    }) => 
        StoresModel(
            name: name ?? this.name,
            phoneVenta: phoneVenta ?? this.phoneVenta,
            show: show ?? this.show,
            value: value ?? this.value,
        );

    factory StoresModel.fromJson(Map<String, dynamic> json) => StoresModel(
        name: json["name"],
        phoneVenta: json["phoneVenta"],
        show: json["show"],
        value: json["value"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "phoneVenta": phoneVenta,
        "show": show,
        "value": value,
    };
}
