import 'package:api/model/page_swipe.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardView extends StatelessWidget {
  const CardView({super.key, required this.swipe});

  final Swipe swipe;

  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Card(
      margin: const EdgeInsets.all(10),
      color: swipe.color,
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 8, top: size.height*.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '25%',
                    style: GoogleFonts.abyssinicaSil(
                      textStyle: const TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    softWrap: true,
                  ),
                  Text(
                    "Today's Special!",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  SizedBox(
                    // width: 70,
                    // height: 50,
                    child: Text(
                      swipe.text.toString(),
                      style: GoogleFonts.abyssinicaSil(
                        textStyle: const TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(12),
                  bottomRight: Radius.circular(12)),
              child: Image.network(
                swipe.image,
                height: double.infinity,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
