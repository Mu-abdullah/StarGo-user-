class UserModel {
  final String? id;
  final String? userName;
  final String? userphone;
  final String? userAdress;
  final DateTime? timeOfOrder;
  final List<Map<String, dynamic>>? orders;
  final String? note;

  UserModel({
    this.id,
    this.userName,
    this.userphone,
    this.userAdress,
    this.timeOfOrder,
    this.orders,
    this.note,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      userName: json['userName'],
      userphone: json['userphone'],
      userAdress: json['userAdress'],
      timeOfOrder: json['timeOfOrder'],
      orders: json['orders'] != null
          ? List<Map<String, dynamic>>.from(json['orders'])
          : null,
      note: json['note'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userName': userName,
      'userphone': userphone,
      'userAdress': userAdress,
      'timeOfOrder': timeOfOrder,
      'orders': orders,
      'note': note,
    };
  }
}
