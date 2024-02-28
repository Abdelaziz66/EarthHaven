

abstract class login_state {}
class login_ini_state extends login_state{}


class login_loading_state extends login_state{}
class login_success_state extends login_state{

}
class login_error_state extends login_state{
  String? error;
  login_error_state(this.error);
}
class login_changevisible_state extends login_state{}