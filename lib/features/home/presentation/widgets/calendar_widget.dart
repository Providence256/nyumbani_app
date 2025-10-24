import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:nyumbani_app/common/custom_divider.dart';
import 'package:nyumbani_app/common/modal_header.dart';
import 'package:nyumbani_app/features/booking/presentation/booking_state_notifier.dart';
import 'package:nyumbani_app/helpers/helper_functions.dart';
import 'package:nyumbani_app/models/calendar_mode.dart';
import 'package:nyumbani_app/models/date_range.dart';
import 'package:nyumbani_app/providers/date_range_notifier.dart';
import 'package:nyumbani_app/utils/constants/app_colors.dart';
import 'package:nyumbani_app/utils/constants/app_sizes.dart';
import 'package:paged_vertical_calendar/paged_vertical_calendar.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarWidget extends ConsumerStatefulWidget {
  const CalendarWidget({super.key, this.mode = CalendarMode.search});

  final CalendarMode mode;

  @override
  ConsumerState<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends ConsumerState<CalendarWidget> {
  DateRange? _defaultDateRange;

  @override
  void initState() {
    super.initState();
    if (widget.mode == CalendarMode.booking) {
      _defaultDateRange = ref.read(bookingNotifierProvider).dateRange;
    }
  }

  DateRange get _displayedDateRange {
    if (widget.mode == CalendarMode.booking && _defaultDateRange != null) {
      return _defaultDateRange!;
    }

    return ref.watch(dateRangeProvider);
  }

  void _onDateSelected(DateTime date) {
    if (isPastDay(date)) return;

    if (widget.mode == CalendarMode.search) {
      ref.read(dateRangeProvider.notifier).selectDates(date);
    } else {
      setState(() {
        if (_defaultDateRange?.checkInDate == null) {
          _defaultDateRange = DateRange(checkInDate: date, checkOutDate: null);
        } else if (_defaultDateRange?.checkOutDate == null) {
          if (date.isBefore(_defaultDateRange!.checkInDate!)) {
            _defaultDateRange = DateRange(
              checkInDate: date,
              checkOutDate: null,
            );
          } else {
            _defaultDateRange = _defaultDateRange!.copyWith(
              checkInDate: _defaultDateRange!.checkInDate,
              checkOutDate: date,
            );
          }
        } else {
          _defaultDateRange = DateRange(checkInDate: date, checkOutDate: null);
        }
      });
    }
  }

  bool isPastDay(DateTime date) {
    final isPast = date.isBefore(DateTime.now().subtract(Duration(days: 1)));

    return isPast;
  }

  bool isInRange(DateTime date, DateRange dateRange) {
    if (dateRange.checkInDate == null) return false;

    if (dateRange.checkOutDate == null) return date == dateRange.checkInDate;

    return ((date == dateRange.checkInDate ||
            date.isAfter(dateRange.checkInDate!)) &&
        (date == dateRange.checkOutDate ||
            date.isBefore(dateRange.checkOutDate!)));
  }

  bool isToday(DateTime date) {
    final isToday = isSameDay(date, DateTime.now());
    return isToday;
  }

  @override
  Widget build(BuildContext context) {
    final dateRange = _displayedDateRange;
    return Container(
      height: MediaQuery.sizeOf(context).height,
      padding: EdgeInsets.symmetric(horizontal: AppSizes.p10),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppSizes.p20)),
      ),
      child: Column(
        spacing: AppSizes.p16,
        children: [
          ModalHeader(
            title: widget.mode == CalendarMode.search
                ? 'Sélectionner les dates'
                : 'Modifier les dates',
          ),
          Expanded(
            child: PagedVerticalCalendar(
              minDate: DateTime.utc(2025, 10),
              maxDate: DateTime.utc(2030, 12, 31),
              startWeekWithSunday: false,
              monthBuilder: (context, month, year) {
                return Column(
                  spacing: AppSizes.p10,
                  children: [
                    Text(
                      HelperFunctions.formatMonthYear(DateTime(year, month)),
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: AppSizes.p10),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _weekText('Lun'),
                          _weekText('Mar'),
                          _weekText('Mer'),
                          _weekText('Jeu'),
                          _weekText('Ven'),
                          _weekText('Sam'),
                          _weekText('Dim'),
                        ],
                      ),
                    ),
                  ],
                );
              },
              dayBuilder: (context, date) {
                final isStart =
                    dateRange.checkInDate != null &&
                    isSameDay(date, dateRange.checkInDate);
                final isEnd =
                    dateRange.checkOutDate != null &&
                    isSameDay(date, dateRange.checkOutDate);

                Color? bgColor;
                Color? textColor = Theme.of(context).colorScheme.onSurface;
                BorderRadiusGeometry? borderRadius;

                if (isStart) {
                  bgColor = AppColors.primary;
                  textColor = Colors.white;
                  borderRadius = BorderRadius.only(
                    topLeft: Radius.circular(AppSizes.p4),
                    bottomLeft: Radius.circular(AppSizes.p4),
                  );
                } else if (isEnd) {
                  bgColor = AppColors.primary;
                  textColor = Colors.white;
                  borderRadius = BorderRadius.only(
                    topRight: Radius.circular(AppSizes.p4),
                    bottomRight: Radius.circular(AppSizes.p4),
                  );
                } else if (isInRange(date, dateRange)) {
                  bgColor = AppColors.primary.withValues(alpha: 0.3);
                  textColor = Colors.white;
                } else if (isToday(date)) {
                  textColor = AppColors.primary;
                }

                return Column(
                  children: [
                    Container(
                      height: 37,
                      decoration: BoxDecoration(
                        color: bgColor,
                        borderRadius: borderRadius,
                      ),
                      child: Center(
                        child: Text(
                          DateFormat('d', 'fr_FR').format(date),
                          style: Theme.of(context).textTheme.labelLarge!
                              .copyWith(
                                color: isPastDay(date)
                                    ? AppColors.textSecondaryLight
                                    : textColor,
                                fontWeight: isToday(date)
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                                decoration: isToday(date)
                                    ? TextDecoration.underline
                                    : null,
                              ),
                        ),
                      ),
                    ),
                    CustomDivider(),
                  ],
                );
              },
              onDayPressed: _onDateSelected,
            ),
          ),
          _buildFooter(dateRange),
        ],
      ),
    );
  }

  Widget _weekText(String text) {
    return Padding(padding: EdgeInsets.all(4), child: Text(text));
  }

  Widget _buildFooter(DateRange dateRange) {
    final hasValidRange =
        dateRange.checkInDate != null && dateRange.checkOutDate != null;
    return Container(
      width: double.infinity,
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
      child: Consumer(
        builder: (context, ref, child) {
          return Column(
            spacing: 10,
            children: [
              hasValidRange
                  ? Text(
                      '${HelperFunctions.formatDay(dateRange.checkInDate!)} - ${HelperFunctions.formatFullDate(dateRange.checkOutDate!)}  (${HelperFunctions.calculateNights(dateRange.checkInDate, dateRange.checkOutDate)} Nuits)',
                      style: Theme.of(context).textTheme.labelLarge,
                    )
                  : Text(
                      'Sélectionner les date de début et de fin',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
              if (dateRange.checkInDate != null ||
                  dateRange.checkOutDate != null)
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      ref
                          .read(bookingNotifierProvider.notifier)
                          .updateDateRange(dateRange);
                      context.pop();
                    },
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
                      'Selectionne dates',
                      style: Theme.of(
                        context,
                      ).textTheme.labelLarge!.copyWith(color: Colors.white),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
