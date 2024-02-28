

abstract class register_state {}



class register_ini_state extends register_state{}

class register_loading_state extends register_state{}
class register_success_state extends register_state{}
class register_error_state extends register_state{}

class usercreate_loading_state extends register_state{}
class usercreate_success_state extends register_state{}
class usercreate_error_state extends register_state{}

class register_changevisible_state extends register_state{}