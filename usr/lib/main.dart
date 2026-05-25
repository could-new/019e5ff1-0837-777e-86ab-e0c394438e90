import 'package:flutter/material.dart';

void main() {
  runApp(const MethodologyApp());
}

class MethodologyApp extends StatelessWidget {
  const MethodologyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Methodology Flowchart',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Roboto',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const FlowchartScreen(),
      },
    );
  }
}

class FlowchartScreen extends StatelessWidget {
  const FlowchartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Methodology Flowchart', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: InteractiveViewer(
            constrained: false,
            boundaryMargin: const EdgeInsets.all(100),
            minScale: 0.1,
            maxScale: 3.0,
            child: const Padding(
              padding: EdgeInsets.all(40.0),
              child: MethodologyFlowchart(),
            ),
          ),
        ),
      ),
    );
  }
}

class MethodologyFlowchart extends StatelessWidget {
  const MethodologyFlowchart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'Methodology Flowchart',
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, letterSpacing: 1.2),
        ),
        const SizedBox(height: 50),
        
        // Phase 1: Bead Preparation
        const _SectionTitle('Phase 1: Bead Preparation'),
        const SizedBox(height: 20),
        const BoxWidget('Selection of Raw Materials'),
        const ArrowDown(),
        const BoxWidget('Washing'),
        const ArrowDown(),
        const BoxWidget('Slicing'),
        const ArrowDown(),
        const BoxWidget('Soaking in 0.5% CaCl₂'),
        const ArrowDown(),
        const BoxWidget('Draining'),
        const ArrowDown(),
        const BoxWidget('Rinsing in Distilled Water'),
        const ArrowDown(),
        const BoxWidget('Grinding'),
        const ArrowDown(),
        const BoxWidget('Vitamin C Extraction'),
        const ArrowDown(height: 20),
        
        // Fork for variations
        CustomPaint(
          size: const Size(360, 20),
          painter: ForkPainter(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const BoxWidget('Variation 1\n25 g', width: 110),
            const SizedBox(width: 15),
            const BoxWidget('Variation 2\n50 g', width: 110),
            const SizedBox(width: 15),
            const BoxWidget('Variation 3\n75 g', width: 110),
          ],
        ),
        CustomPaint(
          size: const Size(360, 20),
          painter: MergePainter(),
        ),
        const ArrowDown(height: 20),
        
        const BoxWidget('Extraction'),
        const ArrowDown(),
        const BoxWidget('Selection of Best Yield'),
        const ArrowDown(),
        const BoxWidget('Quantification'),
        const ArrowDown(),
        const BoxWidget('Encapsulation'),
        const ArrowDown(),
        const BoxWidget('Encapsulation Matrix:\nPectin + Orange Peel Solution'),
        const ArrowDown(),
        const BoxWidget('Hardening the Beads in CaCl₂'),
        const ArrowDown(),
        const BoxWidget('Washing and Storage'),
        
        const SizedBox(height: 60),
        
        // Phase 2: Fermentation
        const _SectionTitle('Phase 2: Juice Fermentation'),
        const SizedBox(height: 20),
        const BoxWidget('Fermentation of Bilimbi Juice (100 ml)'),
        const ArrowDown(),
        const BoxWidget('Bilimbi Juice + 80 ml Water'),
        const ArrowDown(),
        const BoxWidget('10 ml Mint Juice + 25 g Monk Sugar'),
        const ArrowDown(),
        const BoxWidget('Store at Room Temperature\nfor 24 Hours'),
        const ArrowDown(),
        const BoxWidget('Store in Refrigerator\nfor 3–4 Days'),
        
        const SizedBox(height: 60),
        
        // Phase 3: Final Product
        const _SectionTitle('Phase 3: Final Assembly'),
        const SizedBox(height: 20),
        const ArrowDown(height: 40),
        const BoxWidget('Add Encapsulated Beads\n(Final Product)', width: 300, isFinal: true),
      ],
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  const _SectionTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
      ),
    );
  }
}

class BoxWidget extends StatelessWidget {
  final String text;
  final double width;
  final bool isFinal;

  const BoxWidget(this.text, {super.key, this.width = 250, this.isFinal = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width >= 250 ? 280 : width, // slightly wider default for readability
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: isFinal ? Colors.black : Colors.black87, width: isFinal ? 3.0 : 1.5),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3)),
        ],
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 15, // slightly larger

          fontWeight: isFinal ? FontWeight.bold : FontWeight.w500,
          color: Colors.black87,
          height: 1.3,
        ),
      ),
    );
  }
}

class ArrowDown extends StatelessWidget {
  final double height;
  const ArrowDown({super.key, this.height = 30});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(20, height),
      painter: DownArrowPainter(),
    );
  }
}

class DownArrowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black87
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    final path = Path();
    path.moveTo(size.width / 2, 0);
    path.lineTo(size.width / 2, size.height);
    canvas.drawPath(path, paint);

    // Draw arrowhead
    final arrowPaint = Paint()
      ..color = Colors.black87
      ..style = PaintingStyle.fill;
    
    final arrowPath = Path();
    arrowPath.moveTo(size.width / 2, size.height);
    arrowPath.lineTo(size.width / 2 - 5, size.height - 8);
    arrowPath.lineTo(size.width / 2 + 5, size.height - 8);
    arrowPath.close();
    
    canvas.drawPath(arrowPath, arrowPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class ForkPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black87
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    final path = Path();
    // Center drop
    path.moveTo(size.width / 2, 0);
    path.lineTo(size.width / 2, size.height / 2);
    // Horizontal line
    path.moveTo(size.width / 2 - 120, size.height / 2);
    path.lineTo(size.width / 2 + 120, size.height / 2);
    // Left drop
    path.moveTo(size.width / 2 - 120, size.height / 2);
    path.lineTo(size.width / 2 - 120, size.height);
    // Right drop
    path.moveTo(size.width / 2 + 120, size.height / 2);
    path.lineTo(size.width / 2 + 120, size.height);
    
    canvas.drawPath(path, paint);
    
    // Arrowheads
    final arrowPaint = Paint()..color = Colors.black87..style = PaintingStyle.fill;
    void drawArrow(double x, double y) {
      final p = Path();
      p.moveTo(x, y);
      p.lineTo(x - 5, y - 8);
      p.lineTo(x + 5, y - 8);
      p.close();
      canvas.drawPath(p, arrowPaint);
    }
    
    drawArrow(size.width / 2 - 120, size.height);
    drawArrow(size.width / 2, size.height);
    drawArrow(size.width / 2 + 120, size.height);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class MergePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black87
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    final path = Path();
    // Left drop
    path.moveTo(size.width / 2 - 120, 0);
    path.lineTo(size.width / 2 - 120, size.height / 2);
    // Center drop
    path.moveTo(size.width / 2, 0);
    path.lineTo(size.width / 2, size.height / 2);
    // Right drop
    path.moveTo(size.width / 2 + 120, 0);
    path.lineTo(size.width / 2 + 120, size.height / 2);
    // Horizontal line
    path.moveTo(size.width / 2 - 120, size.height / 2);
    path.lineTo(size.width / 2 + 120, size.height / 2);
    // Final center drop
    path.moveTo(size.width / 2, size.height / 2);
    path.lineTo(size.width / 2, size.height);
    
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class FinalMergePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black87
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    final path = Path();
    // Horizontal line connecting left and right branches
    // Left branch center is roughly at x = 0 (relative to this widget's center, we span the width)
    // Actually size.width is about the distance between the two column centers.
    
    path.moveTo(0, 0);
    path.lineTo(0, size.height / 2);
    
    path.moveTo(size.width, 0);
    path.lineTo(size.width, size.height / 2);
    
    path.moveTo(0, size.height / 2);
    path.lineTo(size.width, size.height / 2);
    
    path.moveTo(size.width / 2, size.height / 2);
    path.lineTo(size.width / 2, size.height);
    
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
