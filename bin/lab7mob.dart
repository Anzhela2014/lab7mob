import 'dart:io';
import 'package:lab7mob/character.dart';    
import 'package:lab7mob/characters.dart';   
import 'package:lab7mob/battle.dart';       
void printClasses() {
  print('');
  print('Выберите класс персонажа:');
  print('1 - ⚔️ Воин preview (брони: 5)');
  print('2 - 🔮 Маг preview (мана: 60/60)');
  print('3 - 🏹 Лучник preview (шанс крита: 30%)');
}
Character selectCharacter(String prompt) {
  stdout.write('$prompt – введите имя персонажа: ');
  String? name = stdin.readLineSync();
  
  if (name == null || name.trim().isEmpty) {
    name = 'Герой';
  } else {
    name = name.trim();
  }

  printClasses();

  while (true) {
    stdout.write('Выберите класс (1/2/3): ');
    String? choice = stdin.readLineSync();
    
    switch (choice?.trim()) {
      case '1':
        return Warrior(name: name);
      case '2':
        return Mage(name: name);
      case '3':
        return Archer(name: name);
      default:
        print('Неверный выбор. Введите 1, 2 или 3.');
    }
  }
}
void main() {
  print('⚔️ RPG БИТВА ⚔️');
  Character player = selectCharacter('Игрок');
  Character enemy = selectCharacter('Противник');
  battle(player, enemy);

  stdout.write('Сыграть ещё раз? (да/нет): ');
  String? again = stdin.readLineSync();

  if (again?.trim().toLowerCase() == 'да') {
    main(); 
  } else {
    print('Спасибо за игру!');
  }
}