import 'package:flutter/material.dart';
import 'package:multi_screen_app/data/Items.dart';
import 'package:multi_screen_app/widgets/Item_meta_data.dart';
import 'package:transparent_image/transparent_image.dart';

class ItemCardView extends StatelessWidget {
  const ItemCardView({super.key, required this.item, required this.selectItem});

  final Item item;
  final void Function(BuildContext context, Item item) selectItem;

  String get ComplexityText {
    return item.complexity.name[0].toUpperCase() +
        item.complexity.name.substring(1).toLowerCase();
  }

  String get AffordabilityText {
    return item.affordability.name[0].toUpperCase() +
        item.complexity.name.substring(1).toLowerCase();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () {
          selectItem(context, item);
        },
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(item.imageUrl),
              fit: BoxFit.cover,
              height: 200,
            ),
            Positioned(
                right: 0,
                bottom: 0,
                left: 0,
                child: Container(
                  color: Colors.black54,
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 44),
                  child: Column(
                    children: [
                      Text(
                        item.title,
                        maxLines: 2,
                        style:
                            const TextStyle(fontSize: 20, color: Colors.white),
                        textAlign: TextAlign.center,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ItemMetaData(
                              icon: Icons.schedule,
                              labelvalue: '${item.duration} min'),
                          const SizedBox(
                            width: 20,
                          ),
                          ItemMetaData(
                              icon: Icons.work, labelvalue: ComplexityText),
                          const SizedBox(
                            width: 20,
                          ),
                          ItemMetaData(
                              icon: Icons.attach_money,
                              labelvalue: AffordabilityText)
                        ],
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
