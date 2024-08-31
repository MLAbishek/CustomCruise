import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:sandycustom/config.dart';

class NearbyMechanicsScreen extends StatefulWidget {
  const NearbyMechanicsScreen({Key? key}) : super(key: key);

  @override
  _NearbyMechanicsScreenState createState() => _NearbyMechanicsScreenState();
}

class _NearbyMechanicsScreenState extends State<NearbyMechanicsScreen> {
  final List<Mechanic> mechanics = [
    Mechanic(
      name: "Elite Auto Care",
      address: "123 Main St, Anytown, USA",
      rating: 4.8,
      phoneNumber: "+1 (555) 123-4567",
      specialties: ["Engine Repair", "Transmission", "Brakes"],
      location: LatLng(51.509364, -0.128928),
    ),
    Mechanic(
      name: "Precision Garage",
      address: "456 Oak Ave, Somewhere City, USA",
      rating: 4.5,
      phoneNumber: "+1 (555) 987-6543",
      specialties: ["Electrical Systems", "Suspension", "Diagnostics"],
      location: LatLng(51.515364, -0.138928),
    ),
    Mechanic(
      name: "TurboTech Solutions",
      address: "789 Pine Rd, Another Place, USA",
      rating: 4.7,
      phoneNumber: "+1 (555) 246-8135",
      specialties: ["Performance Tuning", "Custom Fabrication", "Exhaust Systems"],
      location: LatLng(51.505364, -0.118928),
    ),
  ];

  bool _showMap = true;
  Mechanic? _selectedMechanic;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nearby Mechanics', style: GoogleFonts.raleway(color: Colors.orange[300])),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(_showMap ? Icons.list : Icons.map),
            onPressed: () {
              setState(() {
                _showMap = !_showMap;
                _selectedMechanic = null;
              });
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          _showMap ? _buildMap() : _buildList(),
          if (_selectedMechanic != null && _showMap)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: _buildMechanicInfoCard(_selectedMechanic!),
            ),
        ],
      ),
    );
  }

  Widget _buildMap() {
    return FlutterMap(
      options: MapOptions(
        center: LatLng(51.509364, -0.128928),
        zoom: 12,
        onTap: (_, __) {
          setState(() {
            _selectedMechanic = null;
          });
        },
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://api.maptiler.com/maps/basic-v2/{z}/{x}/{y}.png?key=${Config.mapTilerApiKey}',
          userAgentPackageName: 'com.example.app',
        ),
        MarkerLayer(
          markers: mechanics.map((mechanic) => Marker(
            point: mechanic.location,
            width: 40,
            height: 40,
            builder: (context) => GestureDetector(
              onTap: () {
                setState(() {
                  _selectedMechanic = mechanic;
                });
              },
              child: Icon(
                Icons.location_on,
                color: Colors.orange[700],
                size: 40,
              ),
            ),
          )).toList(),
        ),
      ],
    );
  }

  Widget _buildMechanicInfoCard(Mechanic mechanic) {
    return Card(
      margin: EdgeInsets.all(16),
      color: Colors.black.withOpacity(0.8),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              mechanic.name,
              style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.orange[300]),
            ),
            SizedBox(height: 8),
            Text(
              mechanic.address,
              style: GoogleFonts.roboto(color: Colors.white70),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.star, color: Colors.orange[300], size: 18),
                SizedBox(width: 4),
                Text(
                  mechanic.rating.toString(),
                  style: GoogleFonts.roboto(fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ],
            ),
            SizedBox(height: 16),
            ElevatedButton(
              child: Text('View Details'),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => _buildMechanicDetails(mechanic),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange[700],
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildList() {
    return ListView.builder(
      itemCount: mechanics.length,
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.orange[700],
              child: Icon(Icons.build, color: Colors.white),
            ),
            title: Text(
              mechanics[index].name,
              style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            subtitle: Text(
              mechanics[index].address,
              style: GoogleFonts.roboto(color: Colors.white70),
            ),
            trailing: Text(
              mechanics[index].rating.toString(),
              style: GoogleFonts.roboto(fontWeight: FontWeight.bold, color: Colors.orange[300]),
            ),
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => _buildMechanicDetails(mechanics[index]),
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildMechanicDetails(Mechanic mechanic) {
    return Container(
      color: Colors.black87,
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            mechanic.name,
            style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.orange[300]),
          ),
          SizedBox(height: 8),
          Text(
            mechanic.address,
            style: GoogleFonts.roboto(color: Colors.white70),
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Icon(Icons.star, color: Colors.orange[300]),
              SizedBox(width: 8),
              Text(
                '${mechanic.rating}',
                style: GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ],
          ),
          SizedBox(height: 16),
          Text(
            'Specialties:',
            style: GoogleFonts.poppins(fontWeight: FontWeight.w600, color: Colors.orange[300]),
          ),
          Wrap(
            spacing: 8,
            children: mechanic.specialties.map((specialty) => Chip(
              label: Text(specialty, style: GoogleFonts.roboto(fontSize: 12)),
              backgroundColor: Colors.orange[700]!.withOpacity(0.2),
            )).toList(),
          ),
          SizedBox(height: 16),
          ElevatedButton.icon(
            icon: Icon(Icons.phone),
            label: Text('Call Now'),
            onPressed: () {
              // Implement phone call functionality
              print("Calling ${mechanic.phoneNumber}");
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange[700],
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            ),
          ),
        ],
      ),
    );
  }
}

class Mechanic {
  final String name;
  final String address;
  final double rating;
  final String phoneNumber;
  final List<String> specialties;
  final LatLng location;

  const Mechanic({
    required this.name,
    required this.address,
    required this.rating,
    required this.phoneNumber,
    required this.specialties,
    required this.location,
  });
}