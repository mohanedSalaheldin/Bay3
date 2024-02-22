import 'package:flutter/material.dart';

class ShoppingInformationCard extends StatelessWidget {
  const ShoppingInformationCard({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height / 4.4,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 25.0,
          vertical: 10.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ShoppingInfoItem(
              icon: Icons.person_4_outlined,
              txt: 'Rosina Doe',
            ),
            ShoppingInfoItem(
              icon: Icons.location_on_outlined,
              txt: 'Address: 43 Oxford Road M13 4GR Manchister,UK',
            ),
            ShoppingInfoItem(
              icon: Icons.phone_outlined,
              txt: '+249912467669',
            ),
          ],
        ),
      ),
    );
  }
}

class ShoppingInfoItem extends StatelessWidget {
  const ShoppingInfoItem({
    super.key,
    required this.icon,
    required this.txt,
  });
  final IconData icon;
  final String txt;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 35.0),
        const SizedBox(width: 10.0),
        SizedBox(
          width: 200,
          child: Text(
            txt,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),
      ],
    );
  }
}
