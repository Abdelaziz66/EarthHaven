
class Chat_model{
  String? senderid;
  String? reciverid;
  String? date;
  String? text;



  Chat_model({this.senderid, this.reciverid,this.date,this.text,});

  Chat_model.fromjson(Map<String?,dynamic>?json){
    senderid=json?['senderid'];
    reciverid=json?['reciverid'];
    date=json?['date'];
    text=json?['text'];


  }

  Map<String,dynamic>tomap(){
    return {
      'senderid':senderid,
      'reciverid':reciverid,
      'date':date,
      'text':text,

    };
  }
}