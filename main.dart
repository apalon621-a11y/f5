stopimport 'dart:io';
import 'cafe.dart';

void main() {
  showWelcome();

  showMenu(menu);

  Order order = Order();

  makeOrder(order);

  if (order.dishes.isEmpty) {
    print('Вы ничего не заказали.');
    return;
  }

  int total = calculateTotal(order.dishes, prices);

  print('\nВаш заказ:');

  for (String dish in order.dishes) {
    print('$dish - ${prices[dish]} сом');
  }

  print('Итого: $total сом');

  stdout.write('\nВведите ваш возраст: ');
  int age = int.tryParse(stdin.readLineSync() ?? '') ?? 0;

  stdout.write('У вас есть карта постоянного клиента? yes/no: ');
  String answer = stdin.readLineSync() ?? '';

  bool hasCard = answer.toLowerCase() == 'yes';

  int discount = getDiscount(age, hasCard);

  String paymentMethod = getPaymentMethod();

  showReceipt(order.dishes, total, discount, paymentMethod);

  int bonus = getBonusPoints();

  print('\nВы получили $bonus бонусных баллов!');
}
