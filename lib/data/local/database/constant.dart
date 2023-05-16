const tblExam = 'exam';
const tblStudent = 'student';
const tblSchedule = 'schedule';
const tblMark = 'mark';
const tblMarkdetail = 'markDetail';
const tblGpa = 'gpa';
const tblNews = 'news';
const tblPoint = 'pọint';
const tblStudentterm = 'studentterm';
const tblTuition = 'tuition';


//tạo bảng student
const createStudent = '''CREATE TABLE IF NOT EXISTS $tblStudent (
  "studentId"	TEXT NOT NULL,
	"studentName"	TEXT NOT NULL,
	"bankAccount"	TEXT,
	"identity"	TEXT,
	"birth"	TEXT,
	"tel"	TEXT,
	"bornIn"	TEXT,
	"email"	NUMERIC,
	"gender"	TEXT,
	"updateAt"	TEXT,
  "sync"	INTEGER,
	PRIMARY KEY("studentId")
)''';


//tạo bảng studentterm
const createStudentTerm = '''CREATE TABLE IF NOT EXISTS $tblStudentterm (
  "studentTermId"	INTEGER,
	"studentId"	TEXT NOT NULL,
	"termId"	TEXT NOT NULL,
	PRIMARY KEY("studentTermId" AUTOINCREMENT),
	FOREIGN KEY("studentId") REFERENCES "student"("studentId"),
	UNIQUE("studentId","termId")
)''';

//tạo bảng exam
const createExam = '''CREATE TABLE IF NOT EXISTS $tblExam (
  "examId"	INTEGER,
	"studentId"	TEXT NOT NULL,
	"moduleId"	TEXT,
	"moduleName"	TEXT,
	"credit"	INTEGER,
	"date"	TEXT,
	"lesson"	TEXT,
	"identify"	INTEGER,
	"room"	TEXT,
  "type"	TEXT,
	FOREIGN KEY("studentId") REFERENCES "student"("studentId"),
	PRIMARY KEY("examId" AUTOINCREMENT)
)''';

//tạo bảng exam
const createSchedule = '''CREATE TABLE IF NOT EXISTS $tblSchedule (
  "scheduleId"	INTEGER,
	"studentId"	TEXT NOT NULL,
	"moduleId"	TEXT,
	"moduleName"	TEXT,
	"startDay"	TEXT,
	"endDay"	TEXT,
	"weekDay"	INTEGER,
	"lesson"	INTEGER,
	"location"	TEXT,
	FOREIGN KEY("studentId") REFERENCES "student"("studentId"),
	PRIMARY KEY("scheduleId" AUTOINCREMENT)
)''';

//tạo bảng gpa
const createGpa = '''CREATE TABLE IF NOT EXISTS $tblGpa (
  "gpaId"	INTEGER,
	"studentId"	TEXT NOT NULL,
	"term"	TEXT,
	"gpa10"	REAL,
	"gpa4"	REAL,
	"credit"	INTEGER,
	PRIMARY KEY("gpaId" AUTOINCREMENT),
	FOREIGN KEY("studentId") REFERENCES "student"("studentId")
)''';


//tạo bảng mark
const createMark = '''CREATE TABLE IF NOT EXISTS $tblMark (
  "markId"	INTEGER,
	"moduleId"	TEXT,
	"moduleName"	TEXT,
	"moduleCredit"	INTEGER,
	"times"	INTEGER,
	"evaluate"	TEXT,
	"dqt"	REAL,
	"thi"	REAL,
	"tkhp"	REAL,
	"studentId"	TEXT NOT NULL,
	"termId"	INTEGER NOT NULL,
	PRIMARY KEY("markId" AUTOINCREMENT),
	FOREIGN KEY("studentId") REFERENCES "student"("studentId")
)''';

//tạo bảng news
const createNews = '''CREATE TABLE IF NOT EXISTS $tblNews (
  "newsId"	INTEGER,
	"title"	TEXT,
	"date"	TEXT,
	"content"	TEXT,
	PRIMARY KEY("newsId" AUTOINCREMENT)
)''';

//tạo bảng point
const createPoint = '''CREATE TABLE IF NOT EXISTS $tblPoint (
  "pointId"	INTEGER,
	"studentId"	TEXT NOT NULL,
	"period"	TEXT,
	"term"	TEXT,
	"point"	INTEGER,
	"ability"	TEXT,
	PRIMARY KEY("pointId" AUTOINCREMENT),
	FOREIGN KEY("studentId") REFERENCES "student"("studentId")
)''';

//tạo bảng tuition
const createTuition = '''CREATE TABLE IF NOT EXISTS $tblTuition (
  "tuitionId"	INTEGER,
	"studentId"	TEXT,
	"type"	TEXT,
	"content"	TEXT,
	"term"	TEXT,
	"date"	TEXT,
	"payment"	INTEGER,
	"paid"	INTEGER,
	PRIMARY KEY("tuitionId" AUTOINCREMENT),
	FOREIGN KEY("studentId") REFERENCES "student"("studentId")
)''';
