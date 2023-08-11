class BookType {
  int? id;
  String? bookType;
  BookType({
    this.id,
    this.bookType,
  });

  BookType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bookType = json['bookType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};

    json['id'] = id ?? 0;
    json['bookType'] = bookType;
    return json;
  }
}
