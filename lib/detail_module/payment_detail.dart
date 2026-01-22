import 'package:flutter/material.dart';

class PaymentDetail extends StatefulWidget {
  const PaymentDetail({super.key});

  @override
  State<PaymentDetail> createState() => _PaymentDetailState();
}

class _PaymentDetailState extends State<PaymentDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), body: _buildBody());
  }

  Widget _buildBody() {
    return Center(child: Text("Payment Thalath"));
  }
}
