import 'package:discy_application/sre/domain/entities/different_article/different_image.dart';

// ThumbnailImageModel thumbnailImageFromJson(String str) => ThumbnailImageModel.fromJson(json.decode(str));
//
// String thumbnailImage(ThumbnailImageModel data) => json.encode(data.toJson());

class ThumbnailImageModel extends ThumbnailImage {
  ThumbnailImageModel({required String? url,required  int? width,required int? height}) : super(url, width, height);
  //
  factory ThumbnailImageModel.fromJson(Map<String, dynamic> json) =>
      ThumbnailImageModel(
        url: json["url"],
        width: json["width"],
        height: json["height"],
      );

  // Map<String, dynamic> toJson() => {
  //       "url": url,
  //       "width": width,
  //       "height": height,
  //     };
}
