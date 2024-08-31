import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:sandycustom/screens/MechanicRegistrationScreen.dart';
import 'CustomizationScreen.dart';
import 'MechanicRegistrationScreen.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CustomCruise', style: GoogleFonts.orbitron(color: Colors.orange[300], fontSize: 28)),
        actions: [
          IconButton(
            icon: Icon(Icons.settings, color: Colors.orange[300]),
            onPressed: () {
              _showSettingsBottomSheet(context);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/home_bg.jpg',
                  height: 200,
                  fit: BoxFit.cover,
                ).animate().fadeIn(duration: 600.ms).scale(),
              ),
              SizedBox(height: 24),
              Text(
                'Welcome to CustomCruise',
                style: GoogleFonts.raleway(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange[300],
                  shadows: [
                    Shadow(
                      blurRadius: 10.0,
                      color: Colors.orange.withOpacity(0.3),
                      offset: Offset(5.0, 5.0),
                    ),
                  ],
                ),
              ).animate().slideX().fadeIn(),
              SizedBox(height: 16),
              Text(
                'Revolutionize Your Vehicle Customization Experience',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ).animate().slideX().fadeIn(),
              SizedBox(height: 24),
              _buildAnimatedFeatureSection(context, 'AR Visualization', 'Visualize customizations in real-time using cutting-edge AR technology.', Icons.view_in_ar),
              _buildAnimatedFeatureSection(context, 'Mechanic Connection', 'Connect with local mechanics through our online bidding system.', Icons.build),
              _buildAnimatedFeatureSection(context, 'E-Commerce Integration', 'Shop for parts and accessories directly through our platform.', Icons.shopping_cart),
              _buildAnimatedFeatureSection(context, 'Community', 'Join a thriving community of car enthusiasts to share ideas and experiences.', Icons.people),
              _buildAnimatedFeatureSection(context, 'Performance Tracking', 'Monitor your vehicle\'s performance and get insights for improvements.', Icons.speed),
              _buildAnimatedFeatureSection(context, 'Custom Sound Profiles', 'Design and apply unique engine sound profiles for your vehicle.', Icons.music_note),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CustomizationScreen()),
                  );
                },
                child: Text('Start Customizing'),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                  textStyle: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ).animate().scale().shake(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAnimatedFeatureSection(BuildContext context, String title, String description, IconData icon) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.orange.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.orange[300], size: 40).animate().scale().fadeIn(),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.orange[300],
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  description,
                  style: GoogleFonts.roboto(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ).animate().slideX().fadeIn();
  }

  void _showSettingsBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            color: Color(0xFF1E1E1E),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.person, color: Colors.orange[300]),
                title: Text('Register as Mechanic', style: GoogleFonts.poppins(color: Colors.white)),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MechanicRegistrationScreen()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.notifications, color: Colors.orange[300]),
                title: Text('Notifications', style: GoogleFonts.poppins(color: Colors.white)),
                onTap: () {
                  // Navigate to notifications settings
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.security, color: Colors.orange[300]),
                title: Text('Privacy & Security', style: GoogleFonts.poppins(color: Colors.white)),
                onTap: () {
                  // Navigate to privacy settings
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.help, color: Colors.orange[300]),
                title: Text('Help & Support', style: GoogleFonts.poppins(color: Colors.white)),
                onTap: () {
                  // Navigate to help & support screen
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}