
class Player {
  String id;
  String name;
  bool gender;
  String colors;
  int level;
  int strength;
  int power;

  Player({
    this.id = '',
    this.name = 'Hero',
    this.gender = true,
    this.colors = 'color.blue',
    this.level = 0,
    this.strength = 0,
    this.power = 0,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'gender': gender,
      'colors': colors,
      'level': level,
      'strength': strength,
      'power': power,
    };
  }
}
