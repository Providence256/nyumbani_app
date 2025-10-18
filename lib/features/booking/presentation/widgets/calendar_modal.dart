import 'package:flutter/material.dart';
import 'package:nyumbani_app/common/modal_header.dart';
import 'package:nyumbani_app/utils/constants/app_colors.dart';
import 'package:nyumbani_app/utils/constants/app_sizes.dart';

class CalendarModal extends StatefulWidget {
  const CalendarModal({super.key, this.initialRange});

  final DateTimeRange? initialRange;

  @override
  State<CalendarModal> createState() => _CalendarModalState();
}

class _CalendarModalState extends State<CalendarModal> {
  DateTime? _startDate;
  DateTime? _endDate;
  late DateTime _focusedMonth;
  final int _monthsToShow = 12;

  @override
  void initState() {
    super.initState();
    _startDate = widget.initialRange?.start;
    _endDate = widget.initialRange?.end;
    _focusedMonth = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppSizes.p20)),
      ),
      child: Column(
        children: [
          ModalHeader(title: 'Selectionner les dates'),
          _buildDateInfo(),
          Expanded(
            child: ListView.builder(
              itemCount: _monthsToShow,
              itemBuilder: (context, index) {
                final month = DateTime(
                  _focusedMonth.year,
                  _focusedMonth.month + index,
                );
                return _buildMonthView(month);
              },
            ),
          ),
          _buildFooter(),
        ],
      ),
    );
  }

  Widget _buildDateInfo() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.p16,
        vertical: AppSizes.p12,
      ),
      child: Row(children: [

      ],),
    );
  }

  Widget _buildMonthView(DateTime month) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: AppSizes.p16,
            horizontal: AppSizes.p12,
          ),
          child: Text(
            '${_getMonthName(month.month)} ${month.year}',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        _buildWeekdayHeader(),
        _buildCalendarGrid(month),
      ],
    );
  }

  Widget _buildWeekdayHeader() {
    const weekdays = ['Dim', 'Lun', 'Mar', 'Mer', 'Jeu', 'Ven', 'Sam'];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: weekdays.map((day) {
        return Expanded(
          child: Center(
            child: Text(day, style: Theme.of(context).textTheme.labelLarge),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildCalendarGrid(DateTime month) {
    final firstDayOfMonth = DateTime(month.year, month.month, 1);
    final lastDayOfMonth = DateTime(month.year, month.month + 1, 0);
    final daysInMonth = lastDayOfMonth.day;
    final startWeekday = firstDayOfMonth.weekday;

    final rows = <Widget>[];
    var dayCounter = 1;

    for (var week = 0; week < 6; week++) {
      final cells = <Widget>[];

      for (var day = 0; day < 7; day++) {
        if (week == 0 && day < startWeekday) {
          cells.add(Expanded(child: SizedBox()));
        } else if (dayCounter > daysInMonth) {
          cells.add(Expanded(child: SizedBox()));
        } else {
          final date = DateTime(month.year, month.month, dayCounter);
          cells.add(Expanded(child: _buildDayCell(date)));
          dayCounter++;
        }
      }

      rows.add(Row(children: cells));
      if (dayCounter > daysInMonth) break;
    }
    return Column(children: rows);
  }

  Widget _buildDayCell(DateTime date) {
    final isToday = _isSameDay(date, DateTime.now());
    final isStart = _startDate != null && _isSameDay(date, _startDate!);
    final isEnd = _endDate != null && _isSameDay(date, _endDate!);
    final isInRange =
        _startDate != null &&
        _endDate != null &&
        date.isAfter(_startDate!) &&
        date.isBefore(_endDate!);
    final isPast = date.isBefore(DateTime.now().subtract(Duration(days: 1)));

    Color? bgColor;
    Color? textColor = Theme.of(context).colorScheme.onSurface;
    bool showCircle = false;

    if (isStart || isEnd) {
      bgColor = Colors.black;
      textColor = Colors.white;
      showCircle = true;
    } else if (isInRange) {
      bgColor = Colors.grey.shade200;
    }

    return GestureDetector(
      child: Container(
        margin: EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: bgColor,
          shape: showCircle ? BoxShape.circle : BoxShape.rectangle,
        ),
        child: AspectRatio(
          aspectRatio: 1,
          child: Center(
            child: Text(
              '${date.day}',
              style: TextStyle(
                color: isPast ? AppColors.textSecondaryLight : textColor,
                fontWeight: isToday ? FontWeight.bold : FontWeight.normal,
                decoration: isToday ? TextDecoration.underline : null,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFooter() {
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
            onPressed: () {},
            child: Text(
              'Effacer dates',
              style: Theme.of(
                context,
              ).textTheme.labelLarge!.copyWith(color: AppColors.primary),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
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
              'Confirmer',
              style: Theme.of(
                context,
              ).textTheme.labelLarge!.copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  String _getMonthName(int month) {
    const months = [
      'Janvier',
      'Fevrier',
      'Mars',
      'Avril',
      'Mai',
      'Juin',
      'Juillet',
      'Aoüt',
      'Septembre',
      'Octobre',
      'Novembre',
      'Decembre',
    ];

    return months[month - 1];
  }
}
