class Note{
  String title = "";
  String content = "";
  String date = "";

  Note(String title, String content, String date){
    this.title = title;
    this.content = content;
    this.date = date;
  }

  Map<String, dynamic> toJson(){
    return{
      'title' : title,
      'content' : content,
      'date' : date,
    };
  }
}