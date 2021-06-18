// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

ImageModel userModelFromJson(String str) => ImageModel.fromJson(json.decode(str));

String userModelToJson(ImageModel data) => json.encode(data.toJson());

class ImageModel {
    ImageModel({
        this.id,
        this.createdTimestamp,
        this.updatedTimestamp,
        this.tenant,
        this.sequenceNr,
        this.sku,
        this.productId,
        this.description,
        this.width,
        this.height,
        this.context,
        this.size,
        this.key,
        this.isDeleted,
        this.order,
    });

    int id;
    int createdTimestamp;
    int updatedTimestamp;
    String tenant;
    int sequenceNr;
    String sku;
    int productId;
    String description;
    int width;
    int height;
    String context;
    int size;
    String key;
    bool isDeleted;
    int order;

    factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
        id: json["id"],
        createdTimestamp: json["createdTimestamp"],
        updatedTimestamp: json["updatedTimestamp"],
        tenant: json["tenant"],
        sequenceNr: json["sequenceNr"],
        sku: json["SKU"],
        productId: json["productId"],
        description: json["description"],
        width: json["width"],
        height: json["height"],
        context: json["context"],
        size: json["size"],
        key: json["key"],
        isDeleted: json["isDeleted"],
        order: json["order"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "createdTimestamp": createdTimestamp,
        "updatedTimestamp": updatedTimestamp,
        "tenant": tenant,
        "sequenceNr": sequenceNr,
        "SKU": sku,
        "productId": productId,
        "description": description,
        "width": width,
        "height": height,
        "context": context,
        "size": size,
        "key": key,
        "isDeleted": isDeleted,
        "order": order,
    };
}
