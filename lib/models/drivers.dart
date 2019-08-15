class Driver {
  final String id;
  final String username;
  final String pass;
  final String name;
  final String surname;
  final String region;
  final String phone;
  final String photo;
  final String carType;
  final String carPhoto;
  final String carDesc;

  Driver(this.id, this.username, this.pass, this.name, this.surname, this.region, this.phone, this.photo, this.carType, this.carPhoto, this.carDesc);

  Driver.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        username = json['username'],
        pass = json['pass'],
        name = json['name'],
        surname = json['surname'],
        region = json['region'],
        phone = json['phone'],
        photo = json['photo'],
        carType = json['carType'],
        carPhoto = json['carPhoto'],
        carDesc = json['carDesc'];

  Map<String, dynamic> toJson() =>
      {
        'id': id,
        'username': username,
        'pass': pass,
        'name': name,
        'surname': surname,
        'region': region,
        'phone': phone,
        'photo': photo,
        'carType': carType,
        'carPhoto': carPhoto,
        'carDesc': carDesc,
      };
}