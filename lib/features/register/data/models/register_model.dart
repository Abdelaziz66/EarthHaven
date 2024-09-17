class RegisterModel{
   String? email;
   String? password;
   String? name;
   String? phone;

  RegisterModel({ this.email,  this.password,  this.name,  this.phone});

  RegisterModel.fromJson(Map<String?,dynamic>?json){
    name=json?['name'];
    email=json?['email'];
    phone=json?['phone'];
    password=json?['password'];
  }

  Map<String,dynamic>toMap(){
    return {
      'name':name,
      'email':email,
      'phone':phone,
      'uid':password,
    };
  }
}