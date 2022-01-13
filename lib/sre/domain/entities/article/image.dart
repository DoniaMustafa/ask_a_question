import 'package:equatable/equatable.dart';

class ThumbnailImage extends Equatable {
  ThumbnailImage(
    this.url,
    this.width,
    this.height,
  );

 final String? url;
 final int? width;
  final int? height;

  @override
  // TODO: implement props
  List<Object?> get props => [url,width,height];
  @override
  bool? get stringify => true;


}
