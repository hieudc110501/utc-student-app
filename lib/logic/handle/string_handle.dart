
// xử lí chuỗi tin tức
String newsHandle(String content) {
  String res = '';
  for (int i = 0; i < content.length; i ++) {
    if (content[i] == '.' && content[i+1] == ' ') {
      res += "\n";
    }
    res += content[i];
  }
  return res;
}