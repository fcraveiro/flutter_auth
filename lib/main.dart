//import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '/menu.dart';
import '/services/rotas.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'services/tema.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
//    SystemChrome.setSystemUIOverlayStyle(
//      const SystemUiOverlayStyle(
//        statusBarColor: Color.fromARGB(255, 21, 17, 47),
//      ),
//    );
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rotas Getx',
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: bgColor2,
        textTheme:
            GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme).apply(
          bodyColor: Colors.white,
          fontSizeFactor: 1.1,
          displayColor: Colors.yellow,
          fontSizeDelta: 1.2,
        ),
        appBarTheme: AppBarTheme(
          color: Colors.orange.shade800,
          elevation: 10,
          centerTitle: true,
          titleTextStyle: GoogleFonts.poppins(
            fontSize: 20,
            letterSpacing: .2,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: 7,
            fixedSize: const Size(270, 35),
            primary: const Color(0xFF48426D),
            onPrimary: const Color.fromARGB(255, 255, 255, 255),
            onSurface: Colors.black,
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          ),
        ),
        canvasColor: secondaryColor,
      ),
      darkTheme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
        textTheme:
            GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme).apply(
          bodyColor: Colors.white,
          fontSizeFactor: 1.1,
          displayColor: Colors.yellow,
          fontSizeDelta: 1.2,
        ),
        appBarTheme: AppBarTheme(
          color: const Color(0xFF48426D),
          elevation: 10,
          centerTitle: true,
          titleTextStyle: GoogleFonts.poppins(
            fontSize: 20,
            letterSpacing: .2,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: 7,
            fixedSize: const Size(270, 35),
            primary: const Color.fromARGB(255, 68, 78, 100),
            onPrimary: const Color.fromARGB(255, 255, 255, 255),
            onSurface: Colors.black,
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          ),
        ),
        canvasColor: secondaryColor,
      ),
      themeMode: ThemeService().theme,
      initialRoute: '/',
      unknownRoute: GetPage(name: '/notfound', page: () => const Menu()),
      getPages: rotas(),
    );
  }
}
