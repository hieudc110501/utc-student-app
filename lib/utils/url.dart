const http = 'http://192.168.1.109';

const httpLogin = '$http/login';
const httpStudent = '$http/student';
const httpNews = '$http/news';
const httpSchedule = '$http/schedule';
const httpMark = '$http/mark';
const httpTuition = '$http/tuition';
const httpPoint = '$http/point';
const httpController = '$http/controller';
const httpBlog = '$http/blog';

//login
const postLogin = '$httpLogin/postLogin';

//news
const newsInsert = '$httpNews/insert';
const newsGet = '$httpNews/get';
const newsDelete = '$httpNews/delete';

//student
const studentInsert = '$httpStudent/insert';
const studentGet = '$httpStudent/get';
const studentCheck = '$httpStudent/check';
const studentDelete = '$httpStudent/delete';

//schedule
const scheduleInsert = '$httpSchedule/insert';
const scheduleGet = '$httpSchedule/get';
const scheduleDelete = '$httpSchedule/delete';
const scheduleInsertExam = '$httpSchedule/insertExam';
const scheduleGetExam = '$httpSchedule/getExam';
const scheduleDeleteExam = '$httpSchedule/deleteExam';

//mark
const markInsertMarkTerm = '$httpMark/insertMarkTerm';
const markGetMarkByTerm = '$httpMark/getMarkByTerm';
const markGetAll = '$httpMark/getAll';
const markGetAllTerm = '$httpMark/getAllTerm';
const markInsertGPA = '$httpMark/insertGPA';
const markGetGPA = '$httpMark/getGPA';
const markDeleteAll = '$httpMark/deleteAll';

//tuition
const tuitionInsert = '$httpTuition/insert';
const tuitionGet = '$httpTuition/get';
const tuitionDelete = '$httpTuition/delete';

//point
const pointInsert = '$httpPoint/insert';
const pointGet = '$httpPoint/get';
const pointDelete = '$httpPoint/delete';

//controller
const controllerDeleteAll = '$httpController/deleteAll';
const controllerInsertAll = '$httpController/insertAll';

//blog
const blogGetAllPerson = '$httpBlog/getAllPerson';
const blogGetSearch = '$httpBlog/getSearch';
const blogInsert = '$httpBlog/insert';
const blogUpdate = '$httpBlog/update';
const blogDelete = '$httpBlog/delete';
const blogGetAll = '$httpBlog/getAll';
const blogInsertLike = '$httpBlog/insertLike';
const blogDeleteLike = '$httpBlog/deleteLike';
const blogInsertComment = '$httpBlog/insertComment';
const blogGetComment = '$httpBlog/getComment';
const blogDeleteComment = '$httpBlog/deleteComment';