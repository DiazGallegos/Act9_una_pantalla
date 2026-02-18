import 'package:flutter/material.dart';

void main() {
  runApp(const BurgerKingApp());
}

class BurgerKingApp extends StatelessWidget {
  const BurgerKingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      home: const BKLoadingScreen(),
    );
  }
}

// --- PANTALLA DE CARGA ---
class BKLoadingScreen extends StatefulWidget {
  const BKLoadingScreen({super.key});

  @override
  State<BKLoadingScreen> createState() => _BKLoadingScreenState();
}

class _BKLoadingScreenState extends State<BKLoadingScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MainHomeScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF0F0F0F),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.lunch_dining, size: 100, color: Color(0xFFFF8200)),
            SizedBox(height: 30),
            CircularProgressIndicator(color: Color(0xFFFF8200)),
            SizedBox(height: 20),
            Text(
              "COCINANDO TU EXPERIENCIA...",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// --- PANTALLA PRINCIPAL ---
class MainHomeScreen extends StatelessWidget {
  const MainHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color bkOrange = Color(0xFFFF8200);

    return Scaffold(
      backgroundColor: const Color(0xFF0F0F0F),
      appBar: AppBar(
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black, bkOrange, Colors.black],
            ),
          ),
        ),
        title: const Text("BURGER KING", style: TextStyle(fontWeight: FontWeight.w900)),
        leading: const Icon(Icons.menu),
        actions: const [
          Icon(Icons.person_outline),
          SizedBox(width: 15),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildBanner(),
          const SizedBox(height: 20),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            children: [
              _buildCard("WHOPPER", bkOrange, Icons.restaurant),
              _buildCard("BEBIDAS", const Color(0xFF0065BD), Icons.local_drink),
              _buildCard("CUPONES", const Color(0xFFFFBC0D), Icons.confirmation_number),
              _buildCard("LUGAR", const Color(0xFF008A20), Icons.location_on),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: bkOrange,
        unselectedItemColor: Colors.white54,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.local_offer), label: "Ofertas"),
          BottomNavigationBarItem(icon: Icon(Icons.place), label: "Lugar"),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: "Más"),
        ],
      ),
    );
  }

  // Se movieron las funciones DENTRO de la clase MainHomeScreen
  Widget _buildBanner() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFFBEBD7),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          const Text(
            "Tus recompensas esperan",
            style: TextStyle(color: Color(0xFF502918), fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFD62300)),
            child: const Text("Regístrate aquí", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(String title, Color color, IconData icon) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: Colors.white),
          const SizedBox(height: 10),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        ],
      ),
    );
  }
}