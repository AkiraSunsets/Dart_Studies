import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NuSenai',
      theme: ThemeData(
        brightness: Brightness.light,
        useMaterial3: true,
        primaryColor: const Color(0xFF800080),
      ),
      home: const NuMangeWidget(),
    );
  }
}

// ---------------- HOME ----------------
class NuMangeWidget extends StatefulWidget {
  const NuMangeWidget({super.key});

  @override
  State<NuMangeWidget> createState() => _NuMangeWidgetState();
}

class _NuMangeWidgetState extends State<NuMangeWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F4F8),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // HEADER
            Container(
              width: double.infinity,
              height: 170,
              color: const Color(0xFF800080),
              padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.network(
                      'https://i.pinimg.com/474x/aa/54/ae/aa54aede5362d48e3d26fbc37654c6ce.jpg',
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const Icon(Icons.menu, color: Colors.white, size: 35)
                ],
              ),
            ),

            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Olá Usuário!",
                    style: GoogleFonts.montserrat(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "R\$ 1.000.000,00",
                    style: GoogleFonts.montserrat(
                        fontSize: 24, fontWeight: FontWeight.w800),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // BOTÕES
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                HomeActionItem(
                  icon: Icons.qr_code,
                  label: "Pix",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PixWidget()));
                  },
                ),
                HomeActionItem(
                  icon: Icons.attach_money,
                  label: "Débito",
                  onTap: () {},
                ),
                HomeActionItem(
                  icon: Icons.credit_card, // Replaced FontAwesomeIcons.creditCard
                  label: "Crédito",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CreditoWidget()));
                  },
                ),
                HomeActionItem(
                  icon: Icons.receipt_long,
                  label: "Extrato",
                  onTap: () {},
                ),
              ],
            ),

            const SizedBox(height: 40),

            // CARTÕES
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 70,
              decoration: BoxDecoration(
                  color: const Color(0xFFE0E3E7),
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                children: [
                  const SizedBox(width: 20),
                  const Icon(Icons.credit_card), // Replaced FaIcon(FontAwesomeIcons.creditCard)
                  const SizedBox(width: 20),
                  Text(
                    "Meus cartões",
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class HomeActionItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const HomeActionItem({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      GestureDetector(
        onTap: onTap,
        child: Container(
          width: 70,
          height: 70,
          decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    blurRadius: 4,
                    color: Color(0x33000000),
                    offset: Offset(0, 2))
              ]),
          child: Center(child: Icon(icon, size: 24, color: const Color(0xFF800080))),
        ),
      ),
      const SizedBox(height: 10),
      Text(label,
          style: GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 12))
    ]);
  }
}


// ---------------- PIX (Refatorado para Input Real) ----------------
class PixWidget extends StatelessWidget {
  const PixWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFF1F4F8),
        appBar: AppBar(
          backgroundColor: const Color(0xFF800080),
          title: const Text("Pix", style: TextStyle(color: Colors.white)),
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(height: 30),
              Text("Transferir Pix?",
                  style: GoogleFonts.inter(
                      fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  hintText: "Digitar ou colar chave",
                  filled: true,
                  fillColor: const Color(0xFFE0E3E7),
                  prefixIcon: const Icon(Icons.vpn_key),
                  suffixIcon: const Icon(Icons.copy),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF800080),
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                ),
                onPressed: () {},
                child: const Text("Continuar", style: TextStyle(color: Colors.white)),
              )
            ],
          ),
        ));
  }
}

// ---------------- CRÉDITO ----------------
class CreditoWidget extends StatelessWidget {
  const CreditoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFF1F4F8),
        appBar: AppBar(
          backgroundColor: const Color(0xFF800080),
          title: const Text("Crédito", style: TextStyle(color: Colors.white)),
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        body: ListView( // Melhor que Column para listas de itens
          padding: const EdgeInsets.all(20),
          children: [
            const SizedBox(height: 10),
            Text("Deseja parcelar em quantas vezes?",
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                    fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 30),
            const InstallmentOptionCard(title: "1x R\$ 20,54", subtitle: "Total: R\$20,54"),
            const InstallmentOptionCard(title: "2x R\$ 10,44", subtitle: "Total: R\$20,88"),
            const InstallmentOptionCard(title: "3x R\$ 7,07", subtitle: "Total: R\$21,23"),
          ],
        ));
  }
}

class InstallmentOptionCard extends StatelessWidget {
  final String title;
  final String subtitle;

  const InstallmentOptionCard({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            height: 70,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 4, color: Colors.black.withOpacity(0.1))
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: GoogleFonts.inter(fontWeight: FontWeight.bold)),
                    Text(subtitle, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                  ],
                ),
                const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
              ],
            )));
  }
}

essa funciona
