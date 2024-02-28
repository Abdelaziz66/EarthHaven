abstract class App_state {}


class NavBar_state extends App_state{}
class App_ini_state extends App_state{}
class verfiy_state extends App_state{}


class GetData_loading_state extends App_state{}
class GetData_success_state extends App_state{}
class GetData_error_state extends App_state{
  String? error;

  GetData_error_state(this.error);
}

class GetPostData_loading_state extends App_state{
  bool loading =true;

  GetPostData_loading_state(this.loading);
}
class GetPostData_success_state extends App_state{

}
class GetPostData_error_state extends App_state{
  String? error;

  GetPostData_error_state(this.error);
}

class Getimage_error_state extends App_state{}
class Getimage_success_state extends App_state{}

class Getpostimage_error_state extends App_state{}
class Getpostimage_success_state extends App_state{}

class uploadimage_error_state extends App_state{}
class uploadimage_success_state extends App_state{}
class uploadimage_loading_state extends App_state{}

class updateprofile_error_state extends App_state{}
class updateprofile_success_state extends App_state{}


class uploadpostimage_error_state extends App_state{}
class uploadpostimage_success_state extends App_state{}
class uploadpostimage_loading_state extends App_state{}

class addpost_error_state extends App_state{}
class addpost_success_state extends App_state{}
class addpost_loading_state extends App_state{}

class addlikepost_error_state extends App_state{}
class addlikepost_success_state extends App_state{}
class addlikepost_loading_state extends App_state{}

class remove_likepost_error_state extends App_state{}
class remove_likepost_success_state extends App_state{}
class remove_likepost_loading_state extends App_state{}

class addcomment_error_state extends App_state{}
class addcomment_success_state extends App_state{}
class addcomment_loading_state extends App_state{}

class remove_comment_error_state extends App_state{}
class remove_comment_success_state extends App_state{}
class remove_comment_loading_state extends App_state{}



class Getchatuser_loading_state extends App_state{}
class Getchatuser_success_state extends App_state{}
class Getchatuser_error_state extends App_state{

}

class SendChat_success_state extends App_state{}
class SendChat_loading_state extends App_state{}
class SendChat_error_state extends App_state{}

class getChat_success_state extends App_state{}


