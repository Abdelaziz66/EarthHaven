
class Postinfo_model{
  String? name;
  String? uid;
  String? image;
  String? profileimage;
  String? text;
  String? tag;
  String? postId;
  String? date;
  List<String>? likesid;


  Postinfo_model({this.name, this.uid,this.image,this.text,this.tag,this.postId,this.profileimage,this.date});

  Postinfo_model.fromjson(Map<String?,dynamic>?json){
    name=json?['name'];
    uid=json?['uid'];
    image=json?['image'];
    text=json?['text'];
    tag=json?['tag'];
    postId=json?['postId'];
    profileimage=json?['profileimage'];
    date=json?['date'];

  }

  Map<String,dynamic>tomap(){
    return {
      'name':name,
      'uid':uid,
      'image':image,
      'text':text,
      'tag':tag,
      'postId':postId,
      'profileimage':profileimage,
      'date':date,
    };
  }
}