class MGigDetail {
  int step;
  String title;
  String categoryId;
  String subCategoryId;
  List<String> fileFormats;
  List<String> tags;

  MGigDetail(
      {this.step,
      this.title,
      this.categoryId,
      this.subCategoryId,
      this.fileFormats,
      this.tags});

  MGigDetail.fromJson(Map<String, dynamic> json) {
    step = json['step'];
    title = json['title'];
    categoryId = json['category_id'];
    subCategoryId = json['sub_category_id'];
    fileFormats = json['file_formats'].cast<String>();
    tags = json['tags'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['step'] = this.step;
    data['title'] = this.title;
    data['category_id'] = this.categoryId;
    data['sub_category_id'] = this.subCategoryId;
    data['file_formats'] = this.fileFormats;
    data['tags'] = this.tags;
    return data;
  }
}
