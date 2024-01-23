import 'package:flutter/material.dart';

void main() {
  runApp(const MyHomePage(
    title: 'Theme Mode',
  ));
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isDark = false;
  ThemeMode themeColor = ThemeMode.system;
  Color color = Colors.green;
  Color textColor = Colors.black;
  Icon icon = const Icon(Icons.light_mode);
  void changeTheme(ThemeMode themeMode) {
    setState(() {
      themeColor = themeMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.green, useMaterial3: true),
      themeMode: themeColor,
      darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(color)),
                    onPressed: () {
                      changeTheme(ThemeMode.dark);
                      setState(() {
                        isDark = true;
                        if (isDark) {
                          color = Colors.blue;
                        }
                      });
                    },
                    child: const Text(
                      'DarK Mode',
                      style: TextStyle(color: Colors.white),
                    )),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(color)),
                    onPressed: () {
                      changeTheme(ThemeMode.light);
                      setState(() {
                        isDark = false;
                        if (isDark == false) {
                          color = Colors.green;
                        }
                      });
                    },
                    child: const Text(
                      'Light Mode',
                      style: TextStyle(color: Colors.white),
                    )),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Theme(
                      data: ThemeData(
                          textSelectionTheme: TextSelectionThemeData(
                              selectionColor: color,
                              selectionHandleColor: Colors.white)),
                      child: SelectableText(
                        'Change Theme Mode',
                        onSelectionChanged: (selection, cause) {},
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Switch(
                      value: isDark,
                      thumbIcon: MaterialStatePropertyAll(icon),
                      activeColor: Colors.blue,
                      inactiveThumbColor: Colors.green,
                      activeTrackColor: Colors.white,
                      onChanged: (value) {
                        isDark = value;
                        if (isDark == true) {
                          changeTheme(ThemeMode.dark);
                          color = Colors.blue;
                          icon = const Icon(Icons.dark_mode);
                        } else {
                          changeTheme(ThemeMode.light);
                          color = Colors.green;
                          icon = const Icon(Icons.light_mode);
                        }
                      },
                    ),
                  ],
                )
              ],
            ),
          )),
    );
  }
}
