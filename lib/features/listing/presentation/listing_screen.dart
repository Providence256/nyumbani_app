import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nyumbani_app/common/async_value_widget.dart';
import 'package:nyumbani_app/common/curved_edges/custom_curved_edges.dart';
import 'package:nyumbani_app/common/heart_icon_container.dart';
import 'package:nyumbani_app/features/listing/data/listing_repository.dart';
import 'package:nyumbani_app/features/listing/presentation/widgets/listing_amenities_list.dart';
import 'package:nyumbani_app/features/listing/presentation/widgets/listing_description.dart';
import 'package:nyumbani_app/features/listing/presentation/widgets/listing_host_container.dart';
import 'package:nyumbani_app/features/listing/presentation/widgets/listing_title_details.dart';
import 'package:nyumbani_app/features/listing/presentation/widgets/listing_user_review.dart';
import 'package:nyumbani_app/routing/app_router.dart';
import 'package:nyumbani_app/utils/constants/app_colors.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ListingScreen extends ConsumerStatefulWidget {
  const ListingScreen({super.key, required this.listingId});
  final String listingId;

  @override
  ConsumerState<ListingScreen> createState() => _ListingScreenState();
}

class _ListingScreenState extends ConsumerState<ListingScreen> {
  bool _scrolled = false;

  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final listingValue = ref.watch(watchListingProvider(widget.listingId));
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification.metrics.axis == Axis.vertical) {
          setState(() {
            _scrolled = notification.metrics.pixels > 150;
          });
        }

        return false;
      },
      child: Scaffold(
        body: AsyncValueWidget(
          value: listingValue,
          data: (listing) => listing == null
              ? Center(child: Text('No data found'))
              : CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      pinned: true,
                      expandedHeight: 300,
                      backgroundColor: Theme.of(
                        context,
                      ).scaffoldBackgroundColor,
                      title: AnimatedOpacity(
                        opacity: _scrolled ? 1.0 : 0.0,
                        duration: Duration(milliseconds: 300),
                        child: Text(
                          listing.title,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ),
                      leading: AnimatedOpacity(
                        opacity: _scrolled ? 1.0 : 0.0,
                        duration: Duration(milliseconds: 300),
                        child: IconButton(
                          onPressed: () => context.pop(),
                          icon: Icon(
                            PhosphorIcons.arrowLeft(),
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                      ),
                      actions: [
                        AnimatedOpacity(
                          opacity: _scrolled ? 1.0 : 0.0,
                          duration: Duration(milliseconds: 300),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              PhosphorIcons.heart(),
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                      flexibleSpace: FlexibleSpaceBar(
                        background: ClipPath(
                          clipper: CustomCurvedEdges(),
                          child: Stack(
                            children: [
                              PageView.builder(
                                controller: _pageController,
                                itemCount: listing.images.length,
                                onPageChanged: (index) {
                                  setState(() {
                                    _currentPage = index;
                                  });
                                },
                                itemBuilder: (context, index) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                          listing.images[index],
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  );
                                },
                              ),
                              Positioned(
                                bottom: 40,
                                left: 0,
                                right: 0,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: List.generate(
                                    listing.images.length,
                                    (index) {
                                      return AnimatedContainer(
                                        duration: Duration(milliseconds: 300),
                                        margin: EdgeInsets.symmetric(
                                          horizontal: 4,
                                        ),
                                        width: _currentPage == index ? 16 : 8,
                                        height: 8,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            4,
                                          ),
                                          color: _currentPage == index
                                              ? AppColors.primary
                                              : Colors.white.withValues(
                                                  alpha: 0.5,
                                                ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),

                              if (!_scrolled)
                                Positioned(
                                  top: MediaQuery.of(context).padding.top + 32,
                                  right: 16,
                                  child: HeartIconContainer(),
                                ),
                              if (!_scrolled)
                                Positioned(
                                  top: MediaQuery.of(context).padding.top + 32,
                                  left: 16,
                                  child: BackButtonIconContainer(),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    // Property details content
                    SliverToBoxAdapter(
                      child: ListingTitleAndDetails(
                        scrolled: _scrolled,
                        listing: listing,
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            listing.amenities.isEmpty
                                ? SizedBox.shrink()
                                : ListingAmenitieList(listing: listing),
                            SizedBox(height: 10),
                            ListingDescription(listing: listing),

                            SizedBox(height: 20),
                            // Host container
                            ListingHostContainer(),

                            SizedBox(height: 20),
                            //Review
                            UserReviewComment(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
        ),
        bottomNavigationBar: Consumer(
          builder: (context, ref, child) {
            final listingValue = ref.watch(
              watchListingProvider(widget.listingId),
            );
            return AsyncValueWidget(
              value: listingValue,
              data: (listing) => listing == null
                  ? Center(child: Text('no data found'))
                  : Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 15,
                            offset: Offset(0, 5),
                            color: Theme.of(context).colorScheme.onPrimaryFixed,
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              '\$${listing.price}',
                              style: Theme.of(context).textTheme.headlineSmall!
                                  .copyWith(
                                    decoration: TextDecoration.underline,
                                  ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: ElevatedButton(
                              onPressed: () {
                                context.goNamed(
                                  pathParameters: {'id': widget.listingId},
                                  AppRoute.bookingReview.name,
                                );
                              },
                              child: Text('Reserver'),
                            ),
                          ),
                        ],
                      ),
                    ),
            );
          },
        ),
      ),
    );
  }
}
