import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../core/functions/translate_database.dart';
import '../../../link_api.dart';

class CustomItemCard extends StatelessWidget {
  final dynamic controller;
  final int index;
  final List data;
  final Map<int, int> favorites;
  final Widget removeOrFavorite;
  const CustomItemCard({
    super.key,
    required this.controller,
    required this.index,
    required this.data,
    required this.favorites,
    required this.removeOrFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => controller.goToItemDetails(data[index]),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                      child: Hero(
                        tag: data[index]['items_id'],
                        child: CachedNetworkImage(
                          imageUrl:
                              '${AppLink.itemsImages}/${data[index]['items_image']}',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                    color: Color.fromARGB(255, 93, 187, 164),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 6,
                        ),
                        child: Text(
                          translateDatabase(
                            data[index]['items_name_ar'],
                            data[index]['items_name_en'],
                            data[index]['items_name_fr'],
                          ),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 6,
                          bottom: 2,
                        ),
                        child: Row(
                          children: [
                            const Text(
                              'Sold : ',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              '${data[index]['items_count']}',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                height: 1.2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Positioned(
              top: 0,
              left: 0,
              child: data[index]['items_discount'] != 0
                  ? Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 4,
                        vertical: 1,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.orange.withOpacity(0.9),
                        borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(10),
                          topLeft: Radius.circular(10),
                        ),
                      ),
                      child: Row(
                        children: [
                          Text(
                            '-${data[index]['items_discount']}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              height: 1,
                            ),
                          ),
                          const Text(
                            '%',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ))
                  : Container(),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 4,
                  vertical: 1,
                ),
                decoration: const BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(10),
                    topLeft: Radius.circular(10),
                  ),
                ),
                child: Row(
                  children: [
                    Text(
                      '${data[index]['items_price']}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        height: 1,
                      ),
                    ),
                    const Text(
                      '\$',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        inherit: false,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: removeOrFavorite,
            ),
            Positioned(
              bottom: 48,
              child: Row(
                children: [
                  Icon(
                    Icons.star,
                    size: 18,
                    color: Colors.black.withOpacity(0.7),
                  ),
                  Icon(
                    Icons.star,
                    size: 18,
                    color: Colors.black.withOpacity(0.7),
                  ),
                  Icon(
                    Icons.star,
                    size: 18,
                    color: Colors.black.withOpacity(0.7),
                  ),
                  Icon(
                    Icons.star_half,
                    size: 18,
                    color: Colors.black.withOpacity(0.7),
                  ),
                  Icon(
                    Icons.star_border_outlined,
                    size: 18,
                    color: Colors.black.withOpacity(0.7),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
