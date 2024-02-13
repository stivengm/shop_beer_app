import 'dart:convert';

List<ProductsModel> productsModelFromJson(String str) => List<ProductsModel>.from(json.decode(str).map((x) => ProductsModel.fromJson(x)));

String productsModelToJson(List<ProductsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductsModel {
    String description;
    int id;
    String img;
    String name;
    String price;
    int typeProductId;

    ProductsModel({
        required this.description,
        required this.id,
        required this.img,
        required this.name,
        required this.price,
        required this.typeProductId,
    });

    ProductsModel copyWith({
        String? description,
        int? id,
        String? img,
        String? name,
        String? price,
        int? typeProductId,
    }) => 
        ProductsModel(
            description: description ?? this.description,
            id: id ?? this.id,
            img: img ?? this.img,
            name: name ?? this.name,
            price: price ?? this.price,
            typeProductId: typeProductId ?? this.typeProductId,
        );

    factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
        description: json["description"],
        id: json["id"],
        img: json["img"],
        name: json["name"],
        price: json["price"],
        typeProductId: json["typeProductId"],
    );

    Map<String, dynamic> toJson() => {
        "description": description,
        "id": id,
        "img": img,
        "name": name,
        "price": price,
        "typeProductId": typeProductId,
    };
}
