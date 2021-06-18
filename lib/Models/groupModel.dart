import 'dart:convert';

GroupModel userModelFromJson(String str) => GroupModel.fromJson(json.decode(str));

String userModelToJson(GroupModel data) => json.encode(data.toJson());

class GroupModel {
    GroupModel({
        this.id,
        this.productGroupId,
        this.name,
        this.showInWebshop,
        this.nonDiscountable,
        this.positionNo,
        this.added,
        this.lastModified,
        this.parentGroupId,
        this.subGroups,
    });

    String id;
    int productGroupId;
    String name;
    String showInWebshop;
    int nonDiscountable;
    int positionNo;
    int added;
    int lastModified;
    String parentGroupId;
    List<GroupModel> subGroups;

    factory GroupModel.fromJson(Map<String, dynamic> json) => GroupModel(
        id: json["id"],
        productGroupId: json["productGroupID"],
        name: json["name"],
        showInWebshop: json["showInWebshop"],
        nonDiscountable: json["nonDiscountable"],
        positionNo: json["positionNo"],
        added: json["added"],
        lastModified: json["lastModified"],
        parentGroupId: json["parentGroupID"],
        subGroups: List<GroupModel>.from(json["subGroups"].map((x) => GroupModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "productGroupID": productGroupId,
        "name": name,
        "showInWebshop": showInWebshop,
        "nonDiscountable": nonDiscountable,
        "positionNo": positionNo,
        "added": added,
        "lastModified": lastModified,
        "parentGroupID": parentGroupId,
        "subGroups": List<dynamic>.from(subGroups.map((x) => x.toJson())),
    };
}
