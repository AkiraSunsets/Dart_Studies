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
      title: 'NuSenai',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: const NuMangeWidget(), 
    );
  }
}

// --- TELA 1: HOME (NuMange) ---
class NuMangeWidget extends StatefulWidget {
  const NuMangeWidget({super.key});

  @override
  State<NuMangeWidget> createState() => _NuMangeWidgetState();
}

class _NuMangeWidgetState extends State<NuMangeWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Roxo
            Container(
              width: double.infinity,
              height: 172,
              decoration: const BoxDecoration(color: Color(0xFF800080)),
              child: Padding(
                padding: const EdgeInsets.only(top: 60, left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage('https://i.pinimg.com/474x/aa/54/ae/aa54aede5362d48e3d26fbc37654c6ce.jpg'),
                    ),
                    const SizedBox(height: 20),
                    const Text('Olá Usuário!', 
                      style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 30),

            // Linha de Botões (Pix e Crédito)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // BOTAO PIX
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const PixWidget()));
                    },
                    child: Column(
                      children: [
                        Container(
                          width: 70, height: 70,
                          decoration: BoxDecoration(color: Colors.grey[200], shape: BoxShape.circle),
                          child: const Icon(Icons.pix, size: 30),
                        ),
                        const SizedBox(height: 10),
                        const Text('Pix', style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  const SizedBox(width: 25),
                  
                  // BOTAO CRÉDITO
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const PixCopyWidget()));
                    },
                    child: Column(
                      children: [
                        Container(
                          width: 70, height: 70,
                          decoration: BoxDecoration(color: Colors.grey[200], shape: BoxShape.circle),
                          child: const Icon(Icons.credit_card, size: 30),
                        ),
                        const SizedBox(height: 10),
                        const Text('Crédito', style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 40),
            
            // Simulação de Cartões
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 70,
                decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
                child: const Row(
                  children: [
                    SizedBox(width: 20),
                    Icon(Icons.credit_card),
                    SizedBox(width: 20),
                    Text('Meus cartões', style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      // Barra Inferior com Ícone Home
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.home, color: Color(0xFF800080), size: 40),
                onPressed: () {}, // Já estamos na Home
              ),
              const SizedBox(width: 80),
              const Icon(Icons.attach_money, color: Colors.grey, size: 40),
            ],
          ),
        ),
      ),
    );
  }
}

// --- TELA 2: PIX ---
class PixWidget extends StatelessWidget {
  const PixWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF800080),
        title: const Text('Pix', style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Transferir pix?', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 50),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF800080)),
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.home, color: Colors.white),
              label: const Text('Voltar para a tela Home', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}

// --- TELA 3: CRÉDITO ---
class PixCopyWidget extends StatelessWidget {
  const PixCopyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF800080),
        title: const Text('Crédito', style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Deseja parcelar?', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 50),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF800080)),
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.home, color: Colors.white),
              label: const Text('Voltar para a tela Home', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
