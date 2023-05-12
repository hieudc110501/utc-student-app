// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:equatable/equatable.dart';

abstract class StudentEvent extends Equatable {
  final String username;
  const StudentEvent(this.username);
  @override
  List<Object?> get props => [username];
}

//thông tin sv
class StudentEventSyncData extends StudentEvent {
  String password;
  StudentEventSyncData(
    super.username,
    this.password,
  );
}

class StudentEventUpdateData extends StudentEvent {
  String password;
  StudentEventUpdateData(
    super.username,
    this.password,
  );
}

class StudentEventSynched extends StudentEvent {
  const StudentEventSynched(super.username);
}

//thông tin sv
class StudentEventLoadData extends StudentEvent {
  const StudentEventLoadData(super.username);
}

//điểm sv
class StudentEventLoadMark extends StudentEvent {
  const StudentEventLoadMark(super.username);
}

//lịch sv
class StudentEventLoadSchedule extends StudentEvent {
  const StudentEventLoadSchedule(super.username);
}

class StudentEventLoadProfile extends StudentEvent {
  const StudentEventLoadProfile(super.username);
}

class StudentEventDeleteData extends StudentEvent {
  const StudentEventDeleteData(super.username);
}
