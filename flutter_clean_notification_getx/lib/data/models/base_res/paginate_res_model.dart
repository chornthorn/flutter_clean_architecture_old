class PagingResModel {
  int pageNo;
  int pageSize;
  int totalPage;
  int totalRecord;

  PagingResModel(
      {this.pageNo, this.pageSize, this.totalPage, this.totalRecord});

  PagingResModel.fromJson(Map<String, dynamic> json) {
    pageNo = json['page_no'];
    pageSize = json['page_size'];
    totalPage = json['total_page'];
    totalRecord = json['total_record'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page_no'] = this.pageNo;
    data['page_size'] = this.pageSize;
    data['total_page'] = this.totalPage;
    data['total_record'] = this.totalRecord;
    return data;
  }
}
