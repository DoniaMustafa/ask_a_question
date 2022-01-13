import 'package:discy_application/sre/domain/entities/user_infor/user_info.dart';
import 'package:equatable/equatable.dart';

class PersonalInformation extends Equatable {
  final String? token;
  final UserInfo? userInfo;
  PersonalInformation({this.token, this.userInfo});

  @override
  List<Object?> get props => [token, userInfo];

  @override
  bool? get stringify => true;
}



