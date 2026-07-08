import 'package:flutter/material.dart';

class ChecklistItem {
  final String id;
  final String title;
  bool isCompleted;

  ChecklistItem({
    required this.id,
    required this.title,
    this.isCompleted = false,
  });
}

class Checklist {
  final String id;
  final String title;
  final String description;
  final IconData icon;
  final List<ChecklistItem> items;

  Checklist({
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
    required this.items,
  });
  
  double get progress {
    if (items.isEmpty) return 0.0;
    int completed = items.where((item) => item.isCompleted).length;
    return completed / items.length;
  }
}

final List<Checklist> mockChecklists = [
  Checklist(
    id: '1',
    title: 'Открытие смены (Зал)',
    description: 'Ежедневные задачи для официантов перед открытием.',
    icon: Icons.storefront,
    items: [
      ChecklistItem(id: '1_1', title: 'Включить освещение и музыку'),
      ChecklistItem(id: '1_2', title: 'Проверить чистоту столов и стульев'),
      ChecklistItem(id: '1_3', title: 'Подготовить станции (салфетки, приборы)'),
      ChecklistItem(id: '1_4', title: 'Проверить наличие меню'),
    ],
  ),
  Checklist(
    id: '2',
    title: 'Закрытие смены (Кухня)',
    description: 'Уборка и подготовка кухни к следующему дню.',
    icon: Icons.kitchen,
    items: [
      ChecklistItem(id: '2_1', title: 'Вымыть все рабочие поверхности'),
      ChecklistItem(id: '2_2', title: 'Убрать продукты в холодильник'),
      ChecklistItem(id: '2_3', title: 'Вынести мусор'),
      ChecklistItem(id: '2_4', title: 'Выключить оборудование'),
      ChecklistItem(id: '2_5', title: 'Проверить маркировки сроков годности'),
    ],
  ),
  Checklist(
    id: '3',
    title: 'Уборка гостевых зон',
    description: 'Регулярная проверка чистоты.',
    icon: Icons.cleaning_services,
    items: [
      ChecklistItem(id: '3_1', title: 'Пополнить диспенсеры с мылом и бумагой в санузлах'),
      ChecklistItem(id: '3_2', title: 'Очистить зеркала и раковины'),
      ChecklistItem(id: '3_3', title: 'Протереть входную группу'),
      ChecklistItem(id: '3_4', title: 'Вымыть пол'),
    ],
  ),
];
