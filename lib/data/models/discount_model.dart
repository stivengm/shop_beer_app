import 'dart:convert';

List<DiscountModel> discountModelFromJson(String str) => List<DiscountModel>.from(json.decode(str).map((x) => DiscountModel.fromJson(x)));

String discountModelToJson(List<DiscountModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DiscountModel {
    String description;
    int descuento;
    String vencimiento;
    bool show;

    DiscountModel({
        required this.description,
        required this.descuento,
        required this.vencimiento,
        required this.show,
    });

    DiscountModel copyWith({
        String? description,
        int? descuento,
        String? vencimiento,
        bool? show,
    }) => 
        DiscountModel(
            description: description ?? this.description,
            descuento: descuento ?? this.descuento,
            vencimiento: vencimiento ?? this.vencimiento,
            show: show ?? this.show
        );

    factory DiscountModel.fromJson(Map<String, dynamic> json) => DiscountModel(
        description: json["description"],
        descuento: json["descuento"],
        vencimiento: json["vencimiento"],
        show: json["show"],
    );

    Map<String, dynamic> toJson() => {
        "description": description,
        "descuento": descuento,
        "vencimiento": vencimiento,
        "show": show,
    };
}
