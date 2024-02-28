
class like_model {
  String? pId;
  List<String>? uIds;

  like_model({
    this.pId,
    this.uIds,
  });

  // factory like_model.fromJson(Map<String, dynamic> json) => like_model(
  //   pId: json["p_id"],
  //   uIds: json["u_ids"] == null ? [] : List<String>.from(json["u_ids"]!.map((x) => x)),
  // );
  //
  // Map<String, dynamic> toJson() => {
  //   "p_id": pId,
  //   "u_ids": uIds == null ? [] : List<dynamic>.from(uIds!.map((x) => x)),
  // };
}


class comment_model {
  String? pId;
  List<commentdata_model>? Data;

  comment_model({
    this.pId,
    this.Data,
  });

// factory comment_model.fromJson(Map<String, dynamic> json) => comment_model(
//   pId: json["p_id"],
//   uIds: json["u_ids"] == null ? [] : List<String>.from(json["u_ids"]!.map((x) => x)),
// );
//
// Map<String, dynamic> toJson() => {
//   "p_id": pId,
//   "u_ids": uIds == null ? [] : List<dynamic>.from(uIds!.map((x) => x)),
// };
}

class commentdata_model {
  List<commentdata2_model>? uIds;

  commentdata_model({
    this.uIds,

  });


}

class commentdata2_model {
  String? uId;
  String? text;

  commentdata2_model({
    this.uId,
    this.text,
  });


}