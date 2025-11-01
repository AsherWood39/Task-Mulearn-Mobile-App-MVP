class UserModel {
  final String id;
  final String muid;
  final String name;
  final String email;
  final String password;
  final List<String> interests;
  final String xp;
  final String level;

  UserModel({
    required this.id,
    required this.muid,
    required this.name,
    required this.email,
    required this.password,
    this.interests = const [],
    this.xp = '0',
    this.level = '1',
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json['id'] as String? ?? '',
    muid: json['muid'] as String? ?? '',
    name: json['name'] as String? ?? '',
    email: json['email'] as String? ?? '',
    password: json['password'] as String? ?? '',
    interests: List<String>.from(json['interests'] ?? []),
    xp: json['xp'] as String? ?? '0',
    level: json['level'] as String? ?? '1',
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'muid': muid,
    'name': name,
    'email': email,
    'password': password,
    'interests': interests,
    'xp': xp,
    'level': level,
  };
}
