import 'dart:convert';

GlobalNotification globalNotificationFromJson(String str) => GlobalNotification.fromJson(json.decode(str));

String globalNotificationToJson(GlobalNotification data) => json.encode(data.toJson());

class GlobalNotification {
    GlobalNotification({
        this.id,
        this.title,
        this.body,
        this.date,
        this.sent,
    });

    String id;
    String title;
    String body;
    String date;
    bool sent;

    factory GlobalNotification.fromJson(Map<String, dynamic> json) => GlobalNotification(
        id: json["id"] ?? "",
        title: json["title"] ?? "",
        body: json["body"] ?? "",
        date: json["date"] ?? "",
        sent: json["sent"] ?? "",
    );

    Map<String, dynamic> toJson() => {
        "id": id ?? "",
        "title": title ?? "",
        "body": body ?? "",
        "date": date ?? "",
        "sent": sent ?? false,
    };
}
