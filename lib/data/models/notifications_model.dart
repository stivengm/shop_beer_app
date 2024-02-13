import 'dart:convert';

List<NotificationsModel> notificationsModelFromJson(String str) => List<NotificationsModel>.from(json.decode(str).map((x) => NotificationsModel.fromJson(x)));

String notificationsModelToJson(List<NotificationsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NotificationsModel {
    String description;
    bool show;
    String title;

    NotificationsModel({
        required this.description,
        required this.show,
        required this.title,
    });

    NotificationsModel copyWith({
        String? description,
        bool? show,
        String? title,
    }) => 
        NotificationsModel(
            description: description ?? this.description,
            show: show ?? this.show,
            title: title ?? this.title,
        );

    factory NotificationsModel.fromJson(Map<String, dynamic> json) => NotificationsModel(
        description: json["description"],
        show: json["show"],
        title: json["title"],
    );

    Map<String, dynamic> toJson() => {
        "description": description,
        "show": show,
        "title": title,
    };
}
