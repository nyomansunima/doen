class UserAccount {
  String fullName;
  String email;
  String username;
  String password;
  String bio;
  String gradeId;
  String photoUrl;
  String photoName;

  UserAccount({
    this.fullName = "",
    this.email = "",
    this.username = "",
    this.password = "",
    this.bio = "",
    this.gradeId = "",
    this.photoUrl = "",
    this.photoName = "",
  });

  String get getFullName => fullName;

  set setFullName(String fullName) => this.fullName = fullName;

  String get getEmail => email;

  set setEmail(String email) => this.email = email;

  String get getUsername => username;

  set setUsername(String username) => this.username = username;

  String get getPassword => password;

  set setPassword(String password) => this.password = password;

  String get getBio => bio;

  set setBio(String bio) => this.bio = bio;

  String get getGradeId => gradeId;

  set setGradeId(String gradeId) => this.gradeId = gradeId;

  String get getPhotoUrl => photoUrl;

  set setPhotoUrl(String photoUrl) => this.photoUrl = photoUrl;

  String get getPhotoName => photoName;

  set setPhotoName(String photoName) => this.photoName = photoName;

  UserAccount.fromJson(Map<String, dynamic> dataMap)
      : this.fullName = dataMap["fullName"],
        this.email = dataMap["email"],
        this.username = dataMap["username"],
        this.password = dataMap["password"],
        this.bio = dataMap["bio"],
        this.gradeId = dataMap["gradeId"],
        this.photoUrl = dataMap["photoUrl"],
        this.photoName = dataMap["photoName"];

  Map<String, dynamic> toJson() {
    return {
      "fullName": this.fullName,
      "email": this.email,
      "username": this.username,
      "password": this.password,
      "bio": this.bio,
      "gradeId": this.gradeId,
      "photoUrl": this.photoUrl,
      "photoName": this.photoName,
    };
  }
}
