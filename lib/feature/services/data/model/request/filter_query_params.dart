class FilterQueryParams {
  FilterQueryParams({this.category_Id});

  int? category_Id;

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (category_Id != null) map['category_Id'] = category_Id.toString();
    return map;
  }
}
