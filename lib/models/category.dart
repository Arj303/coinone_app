

import 'dart:convert';

List<Product> productFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  String id;
  String name;
  String code;
  String orderIndex;
  String imgUrl;
  String imgUrlPath;
  String parentId;
  String parent;
  TType tType;
  String remarks;
  Active active;
  String companyId;
  String branchId;
  String faId;
  String userId;
  String updateDate;
  IsDelete isDelete;

  Product({
    required this.id,
    required this.name,
    required this.code,
    required this.orderIndex,
    required this.imgUrl,
    required this.imgUrlPath,
    required this.parentId,
    required this.parent,
    required this.tType,
    required this.remarks,
    required this.active,
    required this.companyId,
    required this.branchId,
    required this.faId,
    required this.userId,
    required this.updateDate,
    required this.isDelete,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["Id"],
    name: json["Name"],
    code: json["Code"],
    orderIndex: json["OrderIndex"],
    imgUrl: json["ImgUrl"],
    imgUrlPath: json["ImgUrlPath"],
    parentId: json["ParentId"],
    parent: json["Parent"],
    tType: tTypeValues.map[json["TType"]]!,
    remarks: json["Remarks"],
    active: activeValues.map[json["Active"]]!,
    companyId: json["CompanyId"],
    branchId: json["BranchId"],
    faId: json["FaId"],
    userId: json["UserId"],
    updateDate: json["UpdateDate"],
    isDelete: isDeleteValues.map[json["IsDelete"]]!,
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "Name": name,
    "Code": code,
    "OrderIndex": orderIndex,
    "ImgUrl": imgUrl,
    "ImgUrlPath": imgUrlPath,
    "ParentId": parentId,
    "Parent": parent,
    "TType": tTypeValues.reverse[tType],
    "Remarks": remarks,
    "Active": activeValues.reverse[active],
    "CompanyId": companyId,
    "BranchId": branchId,
    "FaId": faId,
    "UserId": userId,
    "UpdateDate": updateDate,
    "IsDelete": isDeleteValues.reverse[isDelete],
  };
}

enum Active {
  TRUE
}

final activeValues = EnumValues({
  "True": Active.TRUE
});

enum IsDelete {
  FALSE
}

final isDeleteValues = EnumValues({
  "False": IsDelete.FALSE
});

enum TType {
  TEMCAT
}

final tTypeValues = EnumValues({
  "TEMCAT": TType.TEMCAT
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
