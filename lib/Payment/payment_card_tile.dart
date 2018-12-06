import 'package:payment/Payment/card.dart';
import 'package:flutter/material.dart';

class PaymentCardTile extends StatefulWidget {
  final PaymentCard paymentCard;
  final bool isSelected;

  const PaymentCardTile({
    Key key,
    this.paymentCard,
    this.isSelected,
  }) : super(key: key);

  @override
  _PaymentCardTileState createState() => _PaymentCardTileState();
}

class _PaymentCardTileState extends State<PaymentCardTile> {
  final _unChecked = Icon(
    Icons.radio_button_unchecked,
    color: Colors.orange[100],
  );
  final _checked = Icon(
    Icons.check_circle,
    color: Colors.orange,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.only(left: 8.0, right: 8.0, top: 2.0, bottom: 2.0),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white,
        border: Border.all(color: Colors.orange[100]),
        boxShadow: (!widget.isSelected)
            ? []
            : [
                BoxShadow(
                  color: Colors.orange[100],
                  spreadRadius: 8.0,
                  blurRadius: 12.0,
                ),
              ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 8.0),
        leading: (widget.isSelected) ? _checked : _unChecked,
        title: Text(
          widget.paymentCard.cardNumber,
          style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
        ),
        trailing: Image.asset(
          widget.paymentCard.cardCompanyIcon,
          height: 60.0,
          width: 40.0,
        ),
      ),
    );
  }
}
