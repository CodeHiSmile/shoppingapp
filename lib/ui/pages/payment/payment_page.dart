import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:nx/models/entities/product_entity.dart';
import 'package:nx/ui/components/base_button.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 8),
            Row(
              children: <Widget>[
                const SizedBox(width: 18),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
                const Spacer(),
                const Text(
                  "Shopping Bag",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Spacer(),
                const Icon(Icons.card_travel),
                const SizedBox(width: 18),
              ],
            ),
            const SizedBox(height: 32),
            Expanded(
              child: ListView.separated(
                itemCount: listProduct.length,
                separatorBuilder: (context, index) => const SizedBox(height: 16),
                padding: const EdgeInsets.symmetric(horizontal: 18),
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: 80,
                    child: Row(
                      children: <Widget>[
                        Container(
                          height: 80,
                          width: 80,
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          decoration: BoxDecoration(
                            color: const Color(0xFFb9a381),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Image.network(listProduct[index].urlImage ?? ''),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      listProduct[index].nameProduct ?? '',
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 22,
                                    width: 22,
                                    padding: const EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(color: Colors.grey, width: 0.5),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Image.network(
                                      'https://static.thenounproject.com/png/2238556-200.png',
                                      color: Colors.deepOrangeAccent,
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 6),
                              Text(
                                listProduct[index].volume ?? '',
                                style: const TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      '\$${listProduct[index].price ?? 0}',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 24,
                                    width: 24,
                                    padding: const EdgeInsets.symmetric(horizontal: 3),
                                    decoration: BoxDecoration(
                                      color: const Color(0xfff3d09f),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Image.network(
                                      'https://cdn2.iconfinder.com/data/icons/interface-part-2/32/minus-512.png',
                                      color: Colors.white,
                                      width: 18,
                                      height: 18,
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  const Text(
                                    "1",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Container(
                                    height: 24,
                                    width: 24,
                                    // padding: const EdgeInsets.symmetric(horizontal: 3),
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: const Center(
                                      child: Icon(
                                        Icons.add,
                                        size: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            _item("Subtotal", "248.84"),
            _item("Shipping", "12.00"),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: DottedBorder(
                dashPattern: const [4, 3],
                customPath: (size) {
                  return Path()
                    ..moveTo(0, 6)
                    ..lineTo(size.width, 6);
                },
                child: Container(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Container(),
                ),
              ),
            ),
            _item("Total", "260.84", isTotal: true),
            const SizedBox(height: 44),
            BaseButton(
              onTap: () {},
              title: "Go to Checkout",
              spacingBottom: 16,
            ),
          ],
        ),
      ),
    );
  }

  Widget _item(String title, String money, {bool isTotal = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 44),
      margin: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
          Text(
            "\$$money",
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
