import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    UserModel({
        this.userId,
        this.userName,
        this.employeeId,
        this.employeeName,
        this.groupId,
        this.groupName,
        this.ipAddress,
        this.sessionKey,
        this.sessionLength,
        this.isPasswordExpired,
        this.loginUrl,
        this.berlinPosVersion,
        this.berlinPosAssetsUrl,
        this.epsiUrl,
        this.remindUserToUpdateUsername,
        this.customerRegistryUrLs,
        this.couponRegistryUrLs,
        this.displayAdManagerUrLs,
        this.epsiDownloadUrLs,
        this.identityToken,
        this.token,
    });

    String userId;
    String userName;
    String employeeId;
    String employeeName;
    String groupId;
    String groupName;
    String ipAddress;
    String sessionKey;
    int sessionLength;
    bool isPasswordExpired;
    String loginUrl;
    String berlinPosVersion;
    String berlinPosAssetsUrl;
    String epsiUrl;
    int remindUserToUpdateUsername;
    List<dynamic> customerRegistryUrLs;
    List<dynamic> couponRegistryUrLs;
    List<dynamic> displayAdManagerUrLs;
    List<EpsiDownloadUrl> epsiDownloadUrLs;
    String identityToken;
    String token;

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        userId: json["userID"],
        userName: json["userName"],
        employeeId: json["employeeID"],
        employeeName: json["employeeName"],
        groupId: json["groupID"],
        groupName: json["groupName"],
        ipAddress: json["ipAddress"],
        sessionKey: json["sessionKey"],
        sessionLength: json["sessionLength"],
        isPasswordExpired: json["isPasswordExpired"],
        loginUrl: json["loginUrl"],
        berlinPosVersion: json["berlinPOSVersion"],
        berlinPosAssetsUrl: json["berlinPOSAssetsURL"],
        epsiUrl: json["epsiURL"],
        remindUserToUpdateUsername: json["remindUserToUpdateUsername"],
        customerRegistryUrLs: List<dynamic>.from(json["customerRegistryURLs"].map((x) => x)),
        couponRegistryUrLs: List<dynamic>.from(json["couponRegistryURLs"].map((x) => x)),
        displayAdManagerUrLs: List<dynamic>.from(json["displayAdManagerURLs"].map((x) => x)),
        epsiDownloadUrLs: List<EpsiDownloadUrl>.from(json["epsiDownloadURLs"].map((x) => EpsiDownloadUrl.fromJson(x))),
        identityToken: json["identityToken"],
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "userID": userId,
        "userName": userName,
        "employeeID": employeeId,
        "employeeName": employeeName,
        "groupID": groupId,
        "groupName": groupName,
        "ipAddress": ipAddress,
        "sessionKey": sessionKey,
        "sessionLength": sessionLength,
        "isPasswordExpired": isPasswordExpired,
        "loginUrl": loginUrl,
        "berlinPOSVersion": berlinPosVersion,
        "berlinPOSAssetsURL": berlinPosAssetsUrl,
        "epsiURL": epsiUrl,
        "remindUserToUpdateUsername": remindUserToUpdateUsername,
        "customerRegistryURLs": List<dynamic>.from(customerRegistryUrLs.map((x) => x)),
        "couponRegistryURLs": List<dynamic>.from(couponRegistryUrLs.map((x) => x)),
        "displayAdManagerURLs": List<dynamic>.from(displayAdManagerUrLs.map((x) => x)),
        "epsiDownloadURLs": List<dynamic>.from(epsiDownloadUrLs.map((x) => x.toJson())),
        "identityToken": identityToken,
        "token": token,
    };
    
}

class EpsiDownloadUrl {
    EpsiDownloadUrl({
        this.operatingSystem,
        this.url,
    });

    String operatingSystem;
    String url;

    factory EpsiDownloadUrl.fromJson(Map<String, dynamic> json) => EpsiDownloadUrl(
        operatingSystem: json["operatingSystem"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "operatingSystem": operatingSystem,
        "url": url,
    };
}
