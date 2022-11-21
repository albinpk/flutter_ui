import 'package:flutter/material.dart';

class DeliciousFoodApp extends StatelessWidget {
  const DeliciousFoodApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.light(),
      child: Scaffold(
        backgroundColor: Colors.lightBlue,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios_new),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.filter_alt_rounded),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.menu),
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // App name
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: Colors.white,
                      ),
                  children: const [
                    TextSpan(
                      text: 'Delicious ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: 'Food'),
                  ],
                ),
              ),
            ),

            // Food list
            const Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60),
                ),
                child: ColoredBox(
                  color: Colors.white,
                  child: _FoodList(),
                ),
              ),
            ),
            ColoredBox(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20, top: 10),
                child: SizedBox(
                  height: 55,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Search
                      AspectRatio(
                        aspectRatio: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(Icons.search),
                        ),
                      ),

                      // Cart
                      AspectRatio(
                        aspectRatio: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Stack(
                            alignment: Alignment.center,
                            children: const [
                              Icon(Icons.shopping_cart),
                              Positioned(
                                top: 5,
                                right: 5,
                                child: SizedBox.square(
                                  dimension: 20,
                                  child: ClipOval(
                                    child: ColoredBox(
                                      color: Colors.yellow,
                                      child: Center(
                                        child: Text(
                                          '2',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Checkout button
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF2E1F46),
                        ),
                        onPressed: () {},
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 15,
                          ),
                          child: Text('Checkout'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FoodList extends StatelessWidget {
  const _FoodList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Row(
            children: [
              // Food image
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  'https://images.unsplash.com/photo-1589302168068-964664d93dc0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1374&q=80',
                  height: 80,
                  width: 80,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress != null) {
                      return const SizedBox.square(
                        dimension: 80,
                        child: Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.grey,
                          ),
                        ),
                      );
                    }
                    return child;
                  },
                ),
              ),
              const SizedBox(width: 20),

              // Food name, price, rating
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Food name',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Colors.black87,
                          ),
                    ),
                    Text(
                      '\$10.00',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Colors.black54,
                          ),
                    ),
                    Row(
                      children: [
                        for (int i = 0; i < 5; i++)
                          Icon(
                            Icons.star,
                            size: 16,
                            color: i < 3
                                ? const Color(0xFFF1D323)
                                : Colors.black26,
                          )
                      ],
                    )
                  ],
                ),
              ),

              // Add to cart
              SizedBox.square(
                dimension: 40,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: const ColoredBox(
                    color: Colors.black12,
                    child: Icon(Icons.add),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
