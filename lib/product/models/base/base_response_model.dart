abstract class BaseResponseModel<T extends BaseResponseDataModel> {
  BaseResponseModel({
    this.attributionHTML,
    this.attributionText,
    this.code,
    this.copyright,
    this.data,
    this.etag,
    this.status,
  });

  String? attributionHTML;
  String? attributionText;
  int? code;
  String? copyright;
  T? data;
  String? etag;
  String? status;
}

abstract class BaseResponseDataModel<T> {
  BaseResponseDataModel({
    this.count,
    this.limit,
    this.offset,
    this.results,
    this.total,
  });

  int? count;
  int? limit;
  int? offset;
  T? results;
  int? total;
}
