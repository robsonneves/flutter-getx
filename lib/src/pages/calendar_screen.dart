import 'package:flutter/material.dart';
import 'package:flutter_getx/src/routes/routes.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<CalendarScreen> {
  @override
  Widget build(BuildContext context) {
    final desktop = ResponsiveBreakpoints.of(context).isDesktop;

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(desktop ? 100 : 30),
        child: SfCalendar(
          view: CalendarView.month,
          onTap: (CalendarTapDetails details) {
            // dynamic appointment = details.appointments;
            //CalendarElement element = details.targetElement;

            DateTime date = details.date!;
            String dta = '${date.day}-${date.month}-${date.year}';
            Get.toNamed("/dayRoute/$dta");
          },
          dataSource: MeetingDataSource(_getDataSource()),
          monthViewSettings: const MonthViewSettings(
              appointmentDisplayMode: MonthAppointmentDisplayMode.appointment),
        ),
      ),
    );
  }

  List<Meeting> _getDataSource() {
    final List<Meeting> meetings = <Meeting>[];
    final DateTime today = DateTime.now();
    final DateTime startTime = DateTime(today.year, today.month, today.day, 9);
    final DateTime startTime2 =
        DateTime(today.year, today.month, today.day + 3, 9);
    final DateTime startTime3 =
        DateTime(today.year, today.month, today.day + 5, 9);
    final DateTime endTime = startTime.add(const Duration(hours: 2));
    meetings.add(Meeting('Beto', startTime, endTime,
        const Color.fromARGB(255, 15, 134, 68), false));
    meetings.add(Meeting('Cascanéia', startTime2, endTime,
        const Color.fromARGB(255, 15, 61, 134), false));
    meetings.add(Meeting('InterPraias', startTime3, endTime,
        const Color.fromARGB(255, 134, 122, 15), false));
    return meetings;
  }
}

class MeetingDataSource extends CalendarDataSource {
  /// Creates a meeting data source, which used to set the appointment
  /// collection to the calendar
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return _getMeetingData(index).from;
  }

  @override
  DateTime getEndTime(int index) {
    return _getMeetingData(index).to;
  }

  @override
  String getSubject(int index) {
    return _getMeetingData(index).eventName;
  }

  @override
  Color getColor(int index) {
    return _getMeetingData(index).background;
  }

  @override
  bool isAllDay(int index) {
    return _getMeetingData(index).isAllDay;
  }

  Meeting _getMeetingData(int index) {
    final dynamic meeting = appointments![index];
    late final Meeting meetingData;
    if (meeting is Meeting) {
      meetingData = meeting;
    }

    return meetingData;
  }
}

/// Custom business object class which contains properties to hold the detailed
/// information about the event data which will be rendered in calendar.
class Meeting {
  /// Creates a meeting class with required details.
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  /// Event name which is equivalent to subject property of [Appointment].
  String eventName;

  /// From which is equivalent to start time property of [Appointment].
  DateTime from;

  /// To which is equivalent to end time property of [Appointment].
  DateTime to;

  /// Background which is equivalent to color property of [Appointment].
  Color background;

  /// IsAllDay which is equivalent to isAllDay property of [Appointment].
  bool isAllDay;
}
