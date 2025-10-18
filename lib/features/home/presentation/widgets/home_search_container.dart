import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nyumbani_app/common/custom_divider.dart';
import 'package:nyumbani_app/features/home/presentation/widgets/calendar_widget.dart';
import 'package:nyumbani_app/helpers/helper_functions.dart';
import 'package:nyumbani_app/providers/date_range_notifier.dart';
import 'package:nyumbani_app/utils/constants/app_sizes.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class HomeSearchContainer extends ConsumerWidget {
  const HomeSearchContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dateRange = ref.watch(dateRangeProvider);
    return Container(
      width: double.infinity,
      height: 260,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.onPrimaryFixed,
            blurRadius: 15,
            offset: Offset(0, 5),
          ),
        ],
        borderRadius: BorderRadius.circular(AppSizes.p20),
      ),
      child: Column(
        spacing: 10,
        children: [
          SearchElementRow(
            icon: PhosphorIcons.magnifyingGlass(),
            text: 'Kinshasa, DRC',
          ),
          CustomDivider(),
          SearchElementRow(
            onTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                useRootNavigator: true,
                useSafeArea: true,
                builder: (_) {
                  return CalendarWidget();
                },
              );
            },
            text:
                '${HelperFunctions.formatDay(dateRange.checkInDate ?? DateTime.now())} - ${HelperFunctions.formatFullDate(dateRange.checkOutDate ?? DateTime.now().add(Duration(days: 2)))}',
            icon: PhosphorIcons.calendar(),
          ),
          CustomDivider(),
          SearchElementRow(
            text: '1 chambre - 2 adultes - pas d\'enfant',
            icon: PhosphorIcons.user(),
          ),
          SizedBox(height: 5),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(PhosphorIcons.magnifyingGlass(), size: 20),
              label: Text('Rechercher'),
            ),
          ),
        ],
      ),
    );
  }
}

class SearchElementRow extends StatelessWidget {
  const SearchElementRow({
    super.key,
    required this.text,
    required this.icon,
    this.onTap,
  });

  final String text;
  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        spacing: 15,
        children: [
          Icon(icon, color: Theme.of(context).colorScheme.primaryContainer),
          Text(text, style: Theme.of(context).textTheme.labelLarge),
        ],
      ),
    );
  }
}
