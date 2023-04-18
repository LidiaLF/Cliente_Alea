import 'dart:math';
import 'package:calendar_agenda/calendar_agenda.dart';
import 'package:flutter/material.dart';
class CalendarWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CalendarWidgetState();
  }
}

class _CalendarWidgetState extends State<CalendarWidget> {
  CalendarAgendaController _calendarAgendaControllerAppBar = CalendarAgendaController();
  Random random = Random();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CalendarAgenda(
      controller: _calendarAgendaControllerAppBar,
      appbar: true,
      selectedDayPosition: SelectedDayPosition.left,
      leading: IconButton(
        icon: Icon(
          Icons.menu,
          color: Colors.white,
        ),
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
      ),
      weekDay: WeekDay.long,
      fullCalendarScroll: FullCalendarScroll.horizontal,
      fullCalendarDay: WeekDay.long,
      selectedDateColor: Colors.green.shade900,
      locale: 'gl',
      initialDate: DateTime.now(),
      calendarEventColor: Colors.green,
      firstDate: DateTime.now().subtract(Duration(days: 140)),
      lastDate: DateTime.now().add(Duration(days: 60)),
      events: List.generate(
          100,
              (index) => DateTime.now()
              .subtract(Duration(days: index * random.nextInt(5)))),
      onDateSelected: (date) {
        setState(() {});
      },

    );
  }
}
