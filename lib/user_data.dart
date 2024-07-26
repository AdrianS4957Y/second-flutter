class UserData {
  String phone = "";
  String email = "";
  String password = "";
  UserData({email, password, phone}) {
    this.email = email ?? '';
    this.password = password ?? '';
    this.phone = phone ?? '';
  }
}
