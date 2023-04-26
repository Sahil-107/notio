class curUser {
  late String _email, _phone, _password, _username, _profile_image;
  late String _name, _branch, _university, _college, _gender;
  late int _sem, _id;
  bool _isverified = false;
  bool _iscreator = false;
  late String _followers, _following;

  int get id => _id;

  void setuid(int value) {
    _id = value;
  }

  String get profile_image => _profile_image;

  void setprofile_image(String value) {
    _profile_image = value;
  }

  String get email => _email;

  void setemail(String value) {
    _email = value;
  }

  String get phone => _phone;

  void setphone(String value) {
    _phone = value;
  }

  String get password => _password;

  void setpassword(String value) {
    _password = value;
  }

  String get username => _username;

  void setusername(String value) {
    _username = value;
  }

  String get name => _name;

  void setname(String value) {
    _name = value;
  }

  String get branch => _branch;

  void setbranch(String value) {
    _branch = value;
  }

  String get university => _university;

  void setuniversity(String value) {
    _university = value;
  }

  String get college => _college;

  void setcollege(String value) {
    _college = value;
  }

  String get gender => _gender;

  void setgender(String value) {
    _gender = value;
  }

  int get sem => _sem;

  void setsem(int value) {
    _sem = value;
  }

  bool get isverified => _isverified;

  void setisverified(bool value) {
    _isverified = value;
  }

  bool get iscreator => _iscreator;

  void setiscreator(bool value) {
    _iscreator = value;
  }

  String get followers => _followers;

  void setfollowers(String value) {
    _followers = value;
  }

  String get following => _following;

  void setfollowing(String value) {
    _following = value;
  }
}
