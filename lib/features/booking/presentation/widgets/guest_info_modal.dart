import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nyumbani_app/common/modal_header.dart';
import 'package:nyumbani_app/features/booking/presentation/booking_state_notifier.dart';
import 'package:nyumbani_app/models/listing.dart';
import 'package:nyumbani_app/utils/constants/app_colors.dart';
import 'package:nyumbani_app/utils/constants/app_sizes.dart';

class GuestInfoModal extends ConsumerStatefulWidget {
  const GuestInfoModal({super.key, required this.listing});
  final Listing listing;

  @override
  ConsumerState<GuestInfoModal> createState() => _GuestInfoModalState();
}

class _GuestInfoModalState extends ConsumerState<GuestInfoModal> {
  late int _tempAdults;
  late int _tempChildren;
  late int _tempBabies;

  @override
  void initState() {
    super.initState();

    final currentGuestInfo = ref.read(bookingNotifierProvider).guestInfo;
    _tempAdults = currentGuestInfo.adults;
    _tempChildren = currentGuestInfo.children;
    _tempBabies = currentGuestInfo.babies;
  }

  int get _availableAdults {
    return min(widget.listing.maxGuest - _tempChildren, 10);
  }

  int get _availbleChildren {
    return min(widget.listing.maxGuest - _tempAdults, 10);
  }

  void _updateTempAdults(int value) {
    setState(() {
      _tempAdults = min(value, _availableAdults);
    });
  }

  void _updatTempChildren(int value) {
    setState(() {
      _tempChildren = min(value, _availbleChildren);
    });
  }

  void _updateTempBabies(int value) {
    setState(() {
      _tempBabies = value;
    });
  }

  void _saveChanges() {
    ref.read(bookingNotifierProvider.notifier).updateAdults(_tempAdults);
    ref.read(bookingNotifierProvider.notifier).updateChildren(_tempChildren);

    ref.read(bookingNotifierProvider.notifier).updateInfants(_tempBabies);

    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.65,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppSizes.p20)),
      ),
      child: Column(
        children: [
          ModalHeader(title: 'Changer des Visiteurs'),
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSizes.p16,
                    vertical: AppSizes.p10,
                  ),
                  child: Text(
                    'Ce lieu peut accueillir un maximum de ${widget.listing.maxGuest} visiteurs, bébés non compris',
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: AppColors.textSecondaryLight,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                _buildGuestDetails(
                  context: context,
                  title: 'Adultes',
                  subTitle: 'Ages 13+',
                  isAdult: true,
                  value: _tempAdults,
                  maxGuest: _availableAdults,
                  onchanged: _updateTempAdults,
                ),
                SizedBox(height: 40),
                _buildGuestDetails(
                  context: context,
                  maxGuest: _availbleChildren,
                  title: 'Enfants',
                  subTitle: 'Ages 2 - 12',
                  isAdult: false,
                  value: _tempChildren,
                  onchanged: _updatTempChildren,
                ),
                SizedBox(height: 40),
                _buildGuestDetails(
                  context: context,
                  title: 'Bébé',
                  subTitle: 'Moins de 2 ans',
                  isAdult: false,
                  value: _tempBabies,
                  maxGuest: max(0, 10),
                  onchanged: _updateTempBabies,
                ),
              ],
            ),
          ),

          _buildFooter(context: context),
        ],
      ),
    );
  }

  Widget _buildGuestDetails({
    required BuildContext context,
    required String title,
    required String subTitle,
    required int value,
    required int maxGuest,
    required bool isAdult,
    required ValueChanged<int>? onchanged,
  }) {
    final int defaultValue;

    isAdult ? defaultValue = 1 : defaultValue = 0;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.p16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 4,
            children: [
              Text(title, style: Theme.of(context).textTheme.bodyLarge),
              Text(
                subTitle,
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: AppColors.textSecondaryDark,
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildIconButton(
                context: context,
                icon: Icons.remove,
                onPressed: onchanged != null && value > defaultValue
                    ? () => onchanged.call(value - 1)
                    : null,
              ),
              SizedBox(
                width: 30,
                child: Text(
                  value.toString(),
                  textAlign: TextAlign.center,
                  style: Theme.of(
                    context,
                  ).textTheme.labelLarge!.copyWith(fontSize: 16),
                ),
              ),
              _buildIconButton(
                context: context,
                icon: Icons.add,
                onPressed: onchanged != null && value < maxGuest
                    ? () => onchanged.call(value + 1)
                    : null,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildIconButton({
    required BuildContext context,
    required IconData icon,
    required Function()? onPressed,
  }) {
    return SizedBox(
      width: 33,
      height: 33,
      child: IconButton(
        padding: EdgeInsets.zero,
        onPressed: onPressed,
        style: IconButton.styleFrom(
          backgroundColor: AppColors.textSecondaryDark.withValues(alpha: 0.7),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.p8),
          ),
          disabledBackgroundColor: AppColors.backgroundDark.withValues(
            alpha: 0.1,
          ),
        ),
        icon: Icon(
          icon,
          color: Theme.of(context).colorScheme.onSurface,
          size: 18,
        ),
      ),
    );
  }

  Widget _buildFooter({required BuildContext context}) {
    return Container(
      padding: EdgeInsets.all(AppSizes.p16),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        border: Border(
          top: BorderSide(
            color: AppColors.textSecondaryDark.withValues(alpha: 0.2),
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () => context.pop(),
            child: Text(
              'Quitter',
              style: Theme.of(
                context,
              ).textTheme.labelLarge!.copyWith(color: AppColors.primary),
            ),
          ),
          ElevatedButton(
            onPressed: _saveChanges,
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(
                horizontal: AppSizes.p24,
                vertical: AppSizes.p12,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              'Sauvegarder',
              style: Theme.of(
                context,
              ).textTheme.labelLarge!.copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
