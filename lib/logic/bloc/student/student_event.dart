// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:equatable/equatable.dart';
import 'package:utc_student_app/data/models/student.dart';

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

class StudentEventLoadBlog extends StudentEvent {
  const StudentEventLoadBlog(super.username);
}

class StudentEventRefreshBlog extends StudentEvent {
  const StudentEventRefreshBlog(super.username);
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

class StudentEventCreateBlog extends StudentEvent {
  Map<String, dynamic> data;
  Student student;
  StudentEventCreateBlog(
    super.username,
    this.data,
    this.student,
  );
}
