// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

abstract class StudentEvent extends Equatable {
  const StudentEvent();
}

class StudentEventLoadData extends StudentEvent {
  final String username;
  const StudentEventLoadData({
    required this.username,
  });
  
  @override
  List<Object?> get props => [username];
}
