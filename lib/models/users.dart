class User {
  final String id;
  final String region;
  final String username;
  final String pass;
  final String name;
  final String surname;
  final String phone;
  final String photo;

  User(this.id, this.region, this.username, this.name, this.surname, this.phone, this.pass, this.photo);

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        region = json['region'],
        username = json['username'],
        pass = json['pass'],
        name = json['name'],
        surname = json['surname'],
        phone = json['phone'],
        photo = json['photo'];

  Map<String, dynamic> toJson() =>
    {
      'id': id,
      'region': region,
      'username': username,
      'pass': pass,
      'name': name,
      'surname': surname,
      'phone': phone,
      'photo': photo,
    };
}