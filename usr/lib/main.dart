import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'algebra_lesson_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'تطبيق الرياضيات',
      debugShowCheckedModeBanner: false,
      // Configure Arabic RTL support
      locale: const Locale('ar', 'SA'),
      supportedLocales: const [
        Locale('ar', 'SA'),
        Locale('en', 'US'),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1976D2)),
        useMaterial3: true,
        fontFamily: 'Arial', // Fallback for Arabic if system font isn't perfect
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/algebra_lesson': (context) => const AlgebraLessonScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('دروس الرياضيات'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildLessonCard(
            context,
            title: 'تبسيط العبارات الجبرية',
            subtitle: 'وحيدات الحد، الأسس السالبة، وقوانين القوى',
            icon: Icons.calculate,
            route: '/algebra_lesson',
          ),
          // Placeholder for future lessons
          _buildLessonCard(
            context,
            title: 'المعادلات الخطية',
            subtitle: 'قريباً...',
            icon: Icons.functions,
            route: null,
            isLocked: true,
          ),
        ],
      ),
    );
  }

  Widget _buildLessonCard(BuildContext context,
      {required String title,
      required String subtitle,
      required IconData icon,
      String? route,
      bool isLocked = false}) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: isLocked ? Colors.grey : Theme.of(context).colorScheme.primary,
          foregroundColor: Colors.white,
          child: Icon(isLocked ? Icons.lock : icon),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: isLocked
            ? null
            : () {
                if (route != null) {
                  Navigator.pushNamed(context, route);
                }
              },
      ),
    );
  }
}
