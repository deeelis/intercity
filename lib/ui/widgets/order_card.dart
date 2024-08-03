import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../domain/models/order.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({
    super.key,
    required this.order,
  });

  final Order order;

  String dateFormat(Duration duration) {
    return "${duration.inHours}h ${duration.inMinutes % 60}m";
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 2),
            color: const Color(0xFFFFFFFF).withOpacity(0.2),
            blurRadius: 2,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  DateFormat(
                    'dd MMMM, EE',
                  ).format(DateTime.parse(order.bookedAt)),
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
                Text(
                  DateFormat(
                    'dd MMMM, EE',
                  ).format(DateTime.parse(order.estimatedEndedAt)),
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  DateFormat.Hm().format(DateTime.parse(order.bookedAt)),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                const Divider(),
                Text(
                  "${dateFormat(DateTime.parse(order.estimatedEndedAt).difference(DateTime.parse(order.bookedAt)))} in a way",
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
                const Divider(),
                Text(
                  "~${DateFormat.Hm().format(DateTime.parse(order.estimatedEndedAt))}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    order.locationFrom,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
                Flexible(
                  child: Text(
                    order.locationTo,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${order.driverPrice}₽",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                TextButton(onPressed: () {}, child: const Text("Подробнее")),
              ],
            )
          ],
        ),
      ),
    );
  }
}
