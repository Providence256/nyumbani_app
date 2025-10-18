import 'package:flutter/material.dart';
import 'package:nyumbani_app/features/home/home_screen.dart';
import 'package:nyumbani_app/models/listing.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ListingTitleAndDetails extends StatelessWidget {
  const ListingTitleAndDetails({
    super.key,
    required bool scrolled,
    required this.listing,
  }) : _scrolled = scrolled;

  final bool _scrolled;
  final Listing listing;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        spacing: 15,
        children: [
          _scrolled
              ? SizedBox.shrink()
              : AnimatedOpacity(
                  opacity: _scrolled ? 0.0 : 1.0,
                  duration: Duration(milliseconds: 300),
                  child: Text(
                    listing.title,
                    style: Theme.of(context).textTheme.headlineLarge,
                    textAlign: TextAlign.center,
                  ),
                ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              spacing: 10,
              children: [
                AmenityRow(
                  icon: PhosphorIcons.bed(),
                  text: '${listing.beds} Lits',
                ),
                AmenityRow(
                  icon: PhosphorIcons.bathtub(),
                  text: '${listing.bathRooms} douches',
                ),
                AmenityRow(
                  icon: PhosphorIcons.users(),
                  text: '${listing.maxGuest} visteurs',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
