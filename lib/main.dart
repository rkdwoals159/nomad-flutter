import 'package:flutter/material.dart';
import 'package:toonflix/widgets/Button.dart';
import 'package:toonflix/widgets/currency_card.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.black,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 80,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            'Hey, Selena',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 38,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'Welcome back!',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  Text(
                    'Total balance',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white.withOpacity(0.8),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    '\$5 194 482',
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w600,
                      color: Colors.white.withOpacity(0.8),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Button(
                        text: "Transfer",
                        bgColor: Color(0XFFF1B33B),
                        textColor: Colors.black,
                      ),
                      Button(
                        text: "Request",
                        bgColor: Color(0xFF1F2123),
                        textColor: Colors.white,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        "Wallets",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "View all",
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const CurrencyCard(
                    name: "Euro",
                    code: '6 428',
                    amount: 'EUR',
                    icon: Icons.euro_rounded,
                    isInverted: false,
                    order: 0,
                  ),
                  const CurrencyCard(
                    name: "Bitcoin",
                    code: '6 428',
                    amount: 'BTC',
                    icon: Icons.currency_bitcoin,
                    isInverted: true,
                    order: 1,
                  ),
                  const CurrencyCard(
                    name: "Dollar",
                    code: '6 428',
                    amount: 'USD',
                    icon: Icons.attach_money_outlined,
                    isInverted: false,
                    order: 2,
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
