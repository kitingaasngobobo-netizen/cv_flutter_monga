import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CV Monga',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const LoginPage(),
    );
  }
}

// ============ PAGE 1 : CONNEXION ============
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _userController = TextEditingController();
  final _passController = TextEditingController();

  void _login() {
    if (_userController.text == 'monga' && _passController.text == '1234') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Identifiant ou mot de passe incorrect. Essaie monga / 1234')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const CircleAvatar(radius: 50, backgroundColor: Colors.white, child: Text('M', style: TextStyle(fontSize: 50, color: Colors.blue))),
              const SizedBox(height: 16),
              const Text('Bienvenue', style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)),
              const Text('CV de Monga', style: TextStyle(color: Colors.white70, fontSize: 16)),
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
                child: Column(
                  children: [
                    TextField(controller: _userController, decoration: const InputDecoration(labelText: 'Identifiant', prefixIcon: Icon(Icons.person), border: OutlineInputBorder())),
                    const SizedBox(height: 16),
                    TextField(controller: _passController, obscureText: true, decoration: const InputDecoration(labelText: 'Mot de passe', prefixIcon: Icon(Icons.lock), border: OutlineInputBorder())),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(onPressed: _login, style: ElevatedButton.styleFrom(backgroundColor: Colors.blue[900], padding: const EdgeInsets.all(16)), child: const Text('Se connecter', style: TextStyle(fontSize: 18, color: Colors.white))),
                    ),
                    const SizedBox(height: 10),
                    const Text('Demo : monga / 1234', style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ============ PAGE PRINCIPALE AVEC NAVIGATION ============
class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;
  final List<Widget> _pages = const [CVPage(), FamillePage(), ContactPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (i) => setState(() => _index = i),
        selectedItemColor: Colors.blue[900],
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Mon CV'),
          BottomNavigationBarItem(icon: Icon(Icons.family_restroom), label: 'Famille'),
          BottomNavigationBarItem(icon: Icon(Icons.contact_phone), label: 'Contact'),
        ],
      ),
    );
  }
}

// ============ PAGE 2 : CV ============
class CVPage extends StatelessWidget {
  const CVPage({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.infinity, color: Colors.blue[900], padding: const EdgeInsets.all(24),
            child: const Column(children: [
              CircleAvatar(radius: 50, backgroundColor: Colors.white, child: Text('M', style: TextStyle(fontSize: 50, color: Colors.blue))),
              SizedBox(height: 12),
              Text('MONGA', style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)),
              Text('Développeur Flutter & Web', style: TextStyle(color: Colors.white70, fontSize: 16)),
              SizedBox(height: 8),
              Text('Goma, RDC | 0992166583', style: TextStyle(color: Colors.white70)),
              Text('Kitingaasngobobo@gmail.com', style: TextStyle(color: Colors.white70)),
            ]),
          ),
          _section('À propos de moi', 'Je m\'appelle Monga, développeur à Goma. Je crée des applications mobiles avec Flutter et des sites web avec PHP. Je suis motivé et je cherche un stage / un travail.'),
          _section('Formation', '• Informatique - Goma\n• Auto-formation Flutter / Dart'),
          _section('Expériences / Projets', '• Projet Monga CRUD - Gestion avec PHP\n• Projet Geosi CRUD - Gestion\n• Projet Fabien CRUD - Gestion\n• Application CV - Flutter (cv_flutter_monga)'),
          _section('Compétences Techniques', '• Flutter / Dart\n• PHP / MySQL\n• HTML / CSS\n• WAMP / CRUD'),
          _section('Langues', '• Français - Très bien\n• Swahili - Langue maternelle\n• Anglais - Moyen'),
          _section('Centres d\'intérêt', '• Football\n• Musique\n• Lecture\n• Technologie'),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
  static Widget _section(String titre, String texte) {
    return Container(
      width: double.infinity, margin: const EdgeInsets.all(12), padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 5)]),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(titre, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue)),
        const SizedBox(height: 8),
        Text(texte, style: const TextStyle(fontSize: 16)),
      ]),
    );
  }
}

// ============ PAGE 3 : FAMILLE ============
class FamillePage extends StatelessWidget {
  const FamillePage({super.key});
  @override
  Widget build(BuildContext context) {
    final famille = [
      {'nom': 'Wilonja', 'lien': 'Papa', 'job': 'Conservateur', 'lettre': 'W'},
      {'nom': 'Mahane', 'lien': 'Maman', 'job': 'Logisticienne', 'lettre': 'M'},
      {'nom': 'Urbain', 'lien': 'Frère', 'job': 'Frère de Monga', 'lettre': 'U'},
      {'nom': 'Paulange', 'lien': 'Sœur', 'job': 'Sœur de Monga', 'lettre': 'P'},
      {'nom': 'Tim', 'lien': 'Frère', 'job': 'Frère de Monga', 'lettre': 'T'},
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('Ma Famille'), backgroundColor: Colors.blue[900], foregroundColor: Colors.white),
      body: ListView.builder(
        itemCount: famille.length,
        itemBuilder: (context, i) {
          final m = famille[i];
          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              leading: CircleAvatar(backgroundColor: Colors.blue[900], child: Text(m['lettre']!, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
              title: Text(m['nom']!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              subtitle: Text('${m['lien']} - ${m['job']}'),
              trailing: const Icon(Icons.family_restroom, color: Colors.blue),
            ),
          );
        },
      ),
    );
  }
}

// ============ PAGE 4 : CONTACT ============
class ContactPage extends StatelessWidget {
  const ContactPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contact'), backgroundColor: Colors.blue[900], foregroundColor: Colors.white),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          ListTile(leading: Icon(Icons.phone, color: Colors.blue), title: Text('Téléphone'), subtitle: Text('0992166583')),
          ListTile(leading: Icon(Icons.email, color: Colors.blue), title: Text('Email'), subtitle: Text('Kitingaasngobobo@gmail.com')),
          ListTile(leading: Icon(Icons.location_on, color: Colors.blue), title: Text('Adresse'), subtitle: Text('Goma, Nord-Kivu, RDC')),
          ListTile(leading: Icon(Icons.link, color: Colors.blue), title: Text('LinkedIn'), subtitle: Text('linkedin.com/in/monga')),
          ListTile(leading: Icon(Icons.code, color: Colors.blue), title: Text('GitHub'), subtitle: Text('github.com/monga / cv_flutter_monga')),
          SizedBox(height: 20),
          Text('N\'hésitez pas à me contacter pour un stage ou un projet !', textAlign: TextAlign.center, style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}