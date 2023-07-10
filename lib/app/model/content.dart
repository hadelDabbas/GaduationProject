class Content {
  int? Id;
  String? typeName;
  int? IdUser;
  Content({
    this.Id,
    this.typeName,
    this.IdUser,
  });

  Content.fromJson(Map<String, dynamic> json) {
    Id = json['id'];
    typeName = json['typeName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = Id ?? 0;
    json['typeName'] = typeName;
    return json;
  }
}
