import 'dart:io';

List<String> menu = [
  'Бургер',
  'Пицца',
  'Салат',
  'Паста',
  'Кофе',
  'Чай'
];

Map<String, int> prices = {
  'Бургер': 450,
  'Пицца': 700,
  'Салат': 300,
  'Паста': 500,
  'Кофе': 150,
  'Чай': 100
};

Set<String> categories = {
  'Основное блюдо',
  'Салат',
  'Напиток'
};

class Order {
  List<String> dishes = [];

  void addDish(String dish) {
    dishes.add(dish);
  }
}

void showWelcome() {
  print('================================');
  print('       ДОБРО ПОЖАЛОВАТЬ!');
  print('================================');
  print('          КАФЕ "DART CAFE"');
  print('');
}

void showMenu(List<String> menu) {
  print('========== МЕНЮ ==========');

  for (int i = 0; i < menu.length; i++) {
    print('${i + 1}. ${menu[i]} - ${prices[menu[i]]} сом');
  }

  print('==========================');
}

int calculateTotal(
    List<String> order,
    Map<String, int> prices,
) {
  int total = 0;

  for (String dish in order) {
    total += prices[dish]!;
  }

  return total;
}

void makeOrder(Order order) {
  while (true) {
    stdout.write('\nВведите название блюда или "stop": ');
    String dish = stdin.readLineSync() ?? '';

    if (dish.toLowerCase() == 'stop') {
      break;
    }

    if (!menu.contains(dish)) {
      print('Такого блюда нет в меню.');
      continue;
    } else {
      order.addDish(dish);
      print('$dish добавлен в заказ.');
    }

    stdout.write('Добавить ещё блюдо? yes/no: ');
    String answer = stdin.readLineSync() ?? '';

    if (answer.toLowerCase() == 'no') {
      break;
    }
  }
}

int getDiscount(int age, bool hasCard) {
  bool adultAndCard = age >= 18 && hasCard;
  bool youngOrOld = age < 18 || age > 60;
  bool noCard = !hasCard;

  if (age < 18) {
    return 5;
  } else if (adultAndCard) {
    return 10;
  } else if (age > 60) {
    return 15;
  } else if (noCard) {
    return 0;
  } else {
    return 0;
  }
}

String getPaymentMethod() {
  print('\n========== ОПЛАТА ==========');
  print('1. Наличные');
  print('2. Карта');
  print('3. QR');

  stdout.write('Выберите способ оплаты: ');
  String choice = stdin.readLineSync() ?? '';

  switch (choice) {
    case '1':
      return 'Наличные';
    case '2':
      return 'Карта';
    case '3':
      return 'QR';
    default:
      return 'Неизвестный способ оплаты';
  }
}

void showReceipt(
    List<String> order,
    int total,
    int discount,
    String paymentMethod,
) {
  int discountMoney = total * discount ~/ 100;
  int finalPrice = total - discountMoney;

  print('\n================================');
  print('              ЧЕК');
  print('================================');

  for (String dish in order) {
    print('$dish - ${prices[dish]} сом');
  }

  print('--------------------------------');
  print('Общая сумма: $total сом');
  print('Скидка: $discount%');
  print('К оплате: $finalPrice сом');
  print('Способ оплаты: $paymentMethod');
  print('Спасибо за заказ!');
  print('================================');
}

int getBonusPoints() {
  return 10;
}