class ShitModel {
  String email;
  int invitationStatus;

  ShitModel(this.email, this.invitationStatus);

  factory ShitModel.fromJson(Map<String, dynamic> json) {
    return ShitModel(
      json['email'],
      json['invitationStatus'],
    );
  }
}
