class VoteModel{
  bool? status;
  int? count;

  VoteModel({this.status, this.count});
  factory VoteModel.fromJson(Map<String, dynamic> json) =>VoteModel(

      status:json['status'],
    count:json['count'],
  );

}