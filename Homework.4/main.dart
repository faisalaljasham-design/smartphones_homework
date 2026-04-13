import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'متجر فيصل',
      locale: const Locale('ar', 'SA'),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.grey[200],
      ),
      home: const Directionality(
        textDirection: TextDirection.rtl,
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("قائمة منتجات فيصل"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: const <Widget>[
          ProductBox(
            name: "هواوي ميت X6",
            brand: "هواوي (Huawei)",
            description:
                "هاتف ذكي قابل للطي من هواوي بتصميم أنيق وشاشة داخلية كبيرة، يوفر تجربة استخدام مميزة للعمل والترفيه، مع أداء قوي يدعم تعدد المهام بسلاسة.",
            price: 4300,
            imageUrl:
                "https://m.media-amazon.com/images/I/61EYJ8qsk+L._AC_SX679_.jpg",
          ),
          ProductBox(
            name: "آيفون 16 برو",
            brand: "آبل (Apple)",
            description:
                "هاتف رائد من آبل بتصميم أنيق وكاميرات احترافية، يقدم أداء سريع بفضل المعالج الحديث، مع شاشة عالية الجودة وتجربة استخدام سلسة ومتكاملة.",
            price: 5200,
            imageUrl:
                "https://m.media-amazon.com/images/I/714TxWv1JYL._AC_SX679_.jpg",
          ),
          ProductBox(
            name: " سماعات أذن بلوتوث ساوندكور Anker P20i",
            brand: "Anker (ساوندكور)",
            description:
                "مشغلات صوت 10 مم تمنح صوتًا جهوريًا قويًا وواضحًا تقنية بلوتوث 5.3 لاتصال سريع ومستقر",
            price: 150,
            imageUrl:
                "https://m.media-amazon.com/images/I/61RAhaOOjJL._AC_SY300_SX300_QL70_ML2_.jpg",
          ),
          ProductBox(
            name: "Apple Watch Ultra 2",
            brand: "Apple",
            description:
                "شاشة Retina OLED ساطعة بحجم 49 مم مقاومة للخدوش, هيكل من التيتانيوم خفيف ومتين.",
            price: 3500,
            imageUrl:
                "https://m.media-amazon.com/images/I/71+B6iMEe5L._AC_SX679_.jpg",
          ),
        ],
      ),
    );
  }
}

class ProductBox extends StatefulWidget {
  const ProductBox({
    Key? key,
    required this.name,
    required this.brand,
    required this.description,
    required this.price,
    required this.imageUrl,
  }) : super(key: key);

  final String name;
  final String brand;
  final String description;
  final int price;
  final String imageUrl;

  @override
  State<ProductBox> createState() => _ProductBoxState();
}

class _ProductBoxState extends State<ProductBox> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => isExpanded = !isExpanded),
      child: Card(
        margin: const EdgeInsets.only(bottom: 20),
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  Container(
                    width: 140,
                    height: 140,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        widget.imageUrl,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.broken_image, size: 50),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "اضغط هنا للحصول على التفاصيل...",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              height: isExpanded ? null : 0,
              child: isExpanded
                  ? Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Divider(),
                          const SizedBox(height: 10),
                          _detailRow("اسم المنتج:", widget.name),
                          _detailRow("الماركة:", widget.brand),
                          _detailRow("السعر:", "${widget.price} ريال سعودي"),
                          const SizedBox(height: 15),
                          const Text(
                            "الوصف الكامل:",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blueGrey,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            widget.description,
                            style: const TextStyle(fontSize: 14, height: 1.5),
                          ),
                        ],
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _detailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(width: 10),
          Text(value, style: const TextStyle(color: Colors.blue)),
        ],
      ),
    );
  }
}
