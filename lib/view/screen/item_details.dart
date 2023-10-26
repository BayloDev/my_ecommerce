import 'package:flutter/material.dart';

class ItemsDetails extends StatelessWidget {
  const ItemsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.orange.shade100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.all(20),
                height: 120,
                width: 200,
                child: Image.asset(
                  'assets/images/onboarding_one.PNG',
                  height: 200,
                  fit: BoxFit.fill,
                ),
              ),
              const Spacer(),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Poco x3 Pro',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                      ),
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.star,
                                size: 18,
                                color: Colors.orange.withOpacity(0.9)),
                            Icon(Icons.star,
                                size: 18,
                                color: Colors.orange.withOpacity(0.9)),
                            Icon(Icons.star,
                                size: 18,
                                color: Colors.orange.withOpacity(0.9)),
                            Icon(Icons.star_half,
                                size: 18,
                                color: Colors.orange.withOpacity(0.9)),
                            Icon(Icons.star_border_outlined,
                                size: 18,
                                color: Colors.orange.withOpacity(0.9)),
                          ],
                        ),
                        const Spacer(),
                        const Text(
                          textAlign: TextAlign.center,
                          softWrap: true,
                          '200 DA',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Sold : 20',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black.withOpacity(0.6),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Description:',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black.withOpacity(0.6),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    SizedBox(
                      height: 100,
                      child: ListView(
                        children: [
                          Text(
                            'Poco x3 ProPoco x3 ProPoco x3 ProPoco x3 ProPoco x3 ProPoco x3 ProPoco x3 ProPoco x3 ProPoco x3 ProPoco x3 ProPoco x3 ProPoco x3 ProPoco x3 ProPoco x3 ProPoco x3 ProPoco x3 ProPoco x3 ProPoco x3 ProPoco x3 ProPoco x3 ProPoco x3 ProPoco x3 ProPoco x3 ProPoco x3 ProPoco x3 ProPoco x3 ProPoco x3 ProPoco x3 ProPoco x3 Pro',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black.withOpacity(0.7),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Color:',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.teal,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: 40,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.blue,
                              
                            ),
                            margin: const EdgeInsets.only(right: 10),
                            height: 40,
                            width: 40,
                            child: Icon(
                              Icons.check,
                              color: Colors.black.withOpacity(0.5),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 10),

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.red,
                            ),
                            height: 40,
                            width: 40,
                            child: Icon(
                              Icons.check,
                              color: Colors.black.withOpacity(0.5),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 10),

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.green,
                            ),
                            height: 40,
                            width: 40,
                            child: Icon(
                              Icons.check,
                              color: Colors.black.withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        MaterialButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: BorderSide(
                                width: 1, color: Colors.black.withOpacity(0.1)),
                          ),
                          elevation: 2,
                          color: Colors.white,
                          height: 40,
                          minWidth: 40,
                          splashColor: Colors.green,
                          onPressed: () {},
                          child: Icon(
                            Icons.remove,
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          textAlign: TextAlign.center,
                          softWrap: true,
                          '2',
                          style: TextStyle(
                            fontSize: 47,
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 10),
                        MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                              side: BorderSide(
                                  width: 1,
                                  color: Colors.black.withOpacity(0.1))),
                          elevation: 2,
                          color: Colors.white,
                          height: 40,
                          minWidth: 40,
                          splashColor: Colors.green,
                          onPressed: () {},
                          child: Icon(
                            Icons.add,
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                        const Spacer(),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Row(
                            children: [
                              Text(
                                'Add To Cart',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: 10),
                              Icon(
                                size: 20,
                                Icons.arrow_forward_rounded,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
