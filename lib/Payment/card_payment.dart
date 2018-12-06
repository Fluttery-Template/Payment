import 'package:payment/Payment/card.dart';
import 'package:payment/Payment/payment_card_tile.dart';
import 'package:flutter/material.dart';

class CardPayment extends StatefulWidget {
  @override
  _CardPaymentState createState() => _CardPaymentState();
}

class _CardPaymentState extends State<CardPayment> {
  final _totalAmount = 2210;
  int currentCardIndex = 0;
  bool _addNewCard = false;
  TextEditingController _cardNumber,
      _cardHolderName,
      _expMonth,
      _expYear,
      _cvvNumber;

  final _titleStyle = TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  final _proceedButtonStyle = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );

  final fakeCard = [
    PaymentCard(
      cardNumber: 'xxxx-9150',
      cardCompanyIcon: 'assets/visa.jpg',
    ),
    PaymentCard(
      cardNumber: 'xxxx-6609',
      cardCompanyIcon: 'assets/mastercard.png',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _cardNumber = TextEditingController();
    _cardHolderName = TextEditingController();
    _expMonth = TextEditingController();
    _expYear = TextEditingController();
    _cvvNumber = TextEditingController();
  }

  @override
  void dispose() {
    _cardHolderName.dispose();
    _cardNumber.dispose();
    _expMonth.dispose();
    _expYear.dispose();
    _cvvNumber.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Container(
        color: Colors.white,
        child: _buildTheBodyColumn(),
      ),
      bottomNavigationBar: _buildProceedButton(),
    );
  }

  Widget _buildTheBodyColumn() {
    return ListView(
      padding: const EdgeInsets.only(
          left: 32.0, right: 32.0, top: 16.0, bottom: 16.0),
      children: <Widget>[
        Text('Select card for the payment of \$$_totalAmount'),
        const SizedBox(height: 18.0),
        PaymentCardTile(
          paymentCard: fakeCard[0],
          isSelected: true,
        ),
        const SizedBox(height: 18.0),
        PaymentCardTile(
          paymentCard: fakeCard[1],
          isSelected: false,
        ),
        const SizedBox(height: 18.0),
        (!_addNewCard) ? _buildAddCardButton() : _buildNewCard(),
        _buildSafeAndSecureBanner(),
      ],
    );
  }

  Widget _buildNewCard() {
    return Container(
      padding: const EdgeInsets.only(
          left: 22.0, right: 22.0, top: 18.0, bottom: 18.0),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white,
        border: Border.all(color: Colors.orange[100]),
      ),
      child: _newCardForm(),
    );
  }

  Widget _newCardForm() {
    final height = 22.0;
    return Column(
      children: <Widget>[
        TextField(
          controller: _cardNumber,
          decoration: InputDecoration(
            labelText: 'Card number',
          ),
          keyboardType: TextInputType.number,
        ),
        SizedBox(height: height),
        TextField(
          controller: _cardHolderName,
          decoration: InputDecoration(
            labelText: 'CARD HOLDER NAME',
          ),
          keyboardType: TextInputType.text,
        ),
        SizedBox(height: height),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: TextField(
                controller: _expMonth,
                decoration: InputDecoration(
                  labelText: 'MM',
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(width: 8.0),
            Expanded(
              flex: 1,
              child: TextField(
                controller: _expYear,
                decoration: InputDecoration(
                  labelText: 'YY',
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(width: 16.0),
            Expanded(
              flex: 2,
              child: TextField(
                controller: _cvvNumber,
                decoration: InputDecoration(
                  labelText: 'CVV',
                ),
                keyboardType: TextInputType.number,
              ),
            ),
          ],
        ),
        SizedBox(height: height),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            FlatButton(
              onPressed: () {
                setState(() {
                  _addNewCard = false;
                });
              },
              child: Text('CANCEL'),
            ),
            MaterialButton(
              onPressed: () {
                //TODO:
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('ADD CART', style: TextStyle(color: Colors.white)),
              ),
              color: Colors.orange,
            )
          ],
        )
      ],
    );
  }

  Widget _buildSafeAndSecureBanner() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 90.0),
      child: Column(
        children: <Widget>[
          Image.asset(
            'assets/secure.png',
            height: 50.0,
            width: 50.0,
            color: Colors.orangeAccent,
          ),
          const SizedBox(height: 8.0),
          Text('100% Safe and secure payments.')
        ],
      ),
    );
  }

  Widget _buildAddCardButton() {
    return GestureDetector(
      onTap: () {
        setState(() {
          _addNewCard = true;
        });
      },
      child: Container(
        padding: const EdgeInsets.only(
            left: 8.0, right: 8.0, top: 18.0, bottom: 18.0),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.white,
          border: Border.all(color: Colors.orange[100]),
        ),
        child: Center(
          child: Text(
            '+ ADD NEW CARD',
            style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget _buildProceedButton() {
    return FlatButton(
      padding: const EdgeInsets.all(18.0),
      onPressed: () {},
      color: Colors.orange,
      child: Text(
        'PROCEED',
        style: _proceedButtonStyle,
      ),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      leading: IconButton(
        icon: Icon(
          Icons.keyboard_backspace,
          color: Colors.white,
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
      centerTitle: true,
      backgroundColor: Colors.orange,
      elevation: 0.0,
      title: Text('Payment', style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white,
      )),
    );
  }
}
