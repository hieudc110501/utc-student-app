// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

abstract class StudentEvent extends Equatable {
  final String username;
  const StudentEvent(this.username);
}

class StudentEventLoadData extends StudentEvent {
  const StudentEventLoadData(super.username);
  @override
  List<Object?> get props => [username];
}

class StudentEventLoadMark extends StudentEvent {
  const StudentEventLoadMark(super.username);
  @override
  List<Object?> get props => [username];
}
