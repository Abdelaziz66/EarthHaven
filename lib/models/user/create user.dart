
class user_model{
  String? name;
  String? email;
  String? phone;
  String? uid;
  String? image;
  String? bio;
  bool? isemailV=false;


  user_model({this.name, this.email, this.phone, this.uid,this.isemailV,this.image,this.bio});

  user_model.fromjson(Map<String?,dynamic>?json){
    name=json?['name'];
    email=json?['email'];
    phone=json?['phone'];
    uid=json?['uid'];
    isemailV=json?['isemailV'];
    image=json?['image'];
    bio=json?['bio'];

  }

  Map<String,dynamic>tomap(){
    return {
      'name':name,
      'email':email,
      'phone':phone,
      'uid':uid,
      'isemailV':isemailV,
      'image':image,
      'bio':bio,
    };
  }
}