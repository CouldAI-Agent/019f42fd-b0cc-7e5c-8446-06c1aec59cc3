import 'package:flutter/material.dart';

void main() {
  runApp(const UFCApp());
}

class UFCApp extends StatelessWidget {
  const UFCApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UFC Fighter Profile',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF121212),
        colorScheme: ColorScheme.dark(
          primary: const Color(0xFFD4AF37), // Champion Gold
          secondary: const Color(0xFFE31837), // UFC Red
          surface: const Color(0xFF1E1E1E),
        ),
        fontFamily: 'Roboto', // Fallback for a clean look
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const FighterProfileScreen(),
      },
    );
  }
}

class FighterProfileScreen extends StatelessWidget {
  const FighterProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 600;

    return Scaffold(
      body: Stack(
        children: [
          // Background Image with Gradient Overlay
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: size.height * (isMobile ? 0.65 : 0.8),
            child: ShaderMask(
              shaderCallback: (rect) {
                return const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black12,
                    Colors.black87,
                    Color(0xFF121212),
                  ],
                  stops: [0.0, 0.7, 1.0],
                ).createShader(rect);
              },
              blendMode: BlendMode.darken,
              child: Image.network(
                // Using a striking sports/MMA action placeholder as a stand-in
                'https://images.unsplash.com/photo-1599586120429-48281b6f0ece?q=80&w=2070&auto=format&fit=crop',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: const Color(0xFF2A2A2A),
                  child: const Center(
                    child: Icon(Icons.sports_mma, size: 80, color: Colors.white24),
                  ),
                ),
              ),
            ),
          ),

          // Main Content
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Header (UFC Logo & Title)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'UFC',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w900,
                          color: Color(0xFFE31837),
                          letterSpacing: 2,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.share, color: Colors.white70),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                
                const Spacer(),

                // Fighter Name & Title
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: const Color(0xFFD4AF37), // Gold
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Text(
                          'LIGHTWEIGHT CHAMPION',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            letterSpacing: 1.5,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'ISLAM',
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                          letterSpacing: 4,
                          height: 1.0,
                        ),
                      ),
                      const Text(
                        'MAKHACHEV',
                        style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                          letterSpacing: 2,
                          height: 1.0,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.location_on, size: 16, color: Colors.white54),
                          const SizedBox(width: 4),
                          Text(
                            'Makhachkala, Dagestan, Russia',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade400,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 32),

                // Stats Row
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1E1E1E),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        blurRadius: 10,
                        offset: const Offset(0, -5),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildStatItem('RECORD', '25-1-0'),
                      _buildDivider(),
                      _buildStatItem('HEIGHT', '5\'10"'),
                      _buildDivider(),
                      _buildStatItem('WEIGHT', '155 LB'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Colors.grey.shade500,
            letterSpacing: 1.2,
          ),
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return Container(
      height: 40,
      width: 1,
      color: Colors.grey.shade800,
    );
  }
}
