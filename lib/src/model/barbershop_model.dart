// ignore_for_file: public_member_api_docs, sort_constructors_first
class BarbershopModel {
  final int id;
  final String name;
  final String email;
  final List<String> openinDays;
  final List<int> openinHours;

  BarbershopModel({
    required this.id,
    required this.name,
    required this.email,
    required this.openinDays,
    required this.openinHours,
  });

  factory BarbershopModel.fromMap(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': int id,
        'name': String name,
        'email': String email,
        'opening_days': final List openinDays,
        'opening_hours': final List openinHours,
      } =>
        BarbershopModel(
          id: id,
          name: name,
          email: email,
          openinDays: openinDays.cast<String>(),
          openinHours: openinHours.cast<int>(),
        ),
      _ => throw ArgumentError('Invalid Json'),
    };
  }
}
