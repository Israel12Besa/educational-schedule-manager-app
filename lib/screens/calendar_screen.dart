import 'package:flutter/material.dart';
import '../main.dart';  // Import for _RootScreenState

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  children: [
                    // Calendar Header
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                '24',
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Wed',
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    'Jan 2020',
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.green[100],
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  'Today',
                                  style: TextStyle(
                                    color: Colors.green[700],
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          // Week Calendar
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                _buildDateCell('21', 'S', false),
                                _buildDateCell('22', 'M', false),
                                _buildDateCell('23', 'T', false),
                                _buildDateCell('24', 'W', true),
                                _buildDateCell('25', 'T', false),
                                _buildDateCell('26', 'F', false),
                                _buildDateCell('27', 'S', false),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                    // Schedule List
                    Expanded(
                      child: ListView(
                        padding: const EdgeInsets.all(20),
                        children: [
                          _buildScheduleItem(
                            time: '11:35',
                            subject: 'Mathematics',
                            chapter: 'Chapter 1: Introduction',
                            room: 'Room 6-206',
                            teacher: 'Brooklyn Williamson',
                            color: const Color(0xFF4CAF50),
                          ),
                          const SizedBox(height: 20),
                          _buildScheduleItem(
                            time: '13:15',
                            subject: 'Biology',
                            chapter: 'Chapter 3: Animal Kingdom',
                            room: 'Room 2-159',
                            teacher: 'Julia Watson',
                            color: Colors.orange,
                          ),
                          const SizedBox(height: 20),
                          _buildScheduleItem(
                            time: '15:10',
                            subject: 'Geography',
                            chapter: 'Chapter 2: Economy USA',
                            room: 'Room 1-403',
                            teacher: 'Jenny Alexander',
                            color: Colors.blue,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Bottom Navigation
            Container(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () => context.findAncestorStateOfType<_RootScreenState>()?.
                        _onItemTapped(0),
                    child: Icon(Icons.home, 
                        color: Colors.white.withOpacity(0.5)),
                  ),
                  GestureDetector(
                    onTap: () => context.findAncestorStateOfType<_RootScreenState>()?.
                        _onItemTapped(1),
                    child: const Icon(Icons.calendar_today, 
                        color: Colors.white),
                  ),
                  GestureDetector(
                    onTap: () => context.findAncestorStateOfType<_RootScreenState>()?.
                        _onItemTapped(2),
                    child: Icon(Icons.chat_bubble_outline,
                        color: Colors.white.withOpacity(0.5)),
                  ),
                  GestureDetector(
                    onTap: () => context.findAncestorStateOfType<_RootScreenState>()?.
                        _onItemTapped(3),
                    child: Icon(Icons.person_outline,
                        color: Colors.white.withOpacity(0.5)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDateCell(String date, String day, bool isSelected) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      width: 40,
      child: Column(
        children: [
          Text(
            day,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: isSelected ? const Color(0xFFFF7F50) : Colors.transparent,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                date,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScheduleItem({
    required String time,
    required String subject,
    required String chapter,
    required String room,
    required String teacher,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Text(
                time,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                time.contains(':') ? time.split(':')[0] : '',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      subject,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Icon(Icons.more_horiz, color: Colors.grey[400]),
                  ],
                ),
                const SizedBox(height: 5),
                Text(
                  chapter,
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Icon(Icons.room, size: 16, color: Colors.grey[600]),
                    const SizedBox(width: 5),
                    Text(
                      room,
                      style: TextStyle(
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Icon(Icons.person_outline, size: 16, color: Colors.grey[600]),
                    const SizedBox(width: 5),
                    Text(
                      teacher,
                      style: TextStyle(
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
