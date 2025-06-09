// lib/screens/course_page.dart

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../models/place.dart';
import '../services/api_service.dart';
import '../widgets/custom_bottom_nav_bar.dart';

class CourseDetailPage extends StatefulWidget {
  final String courseId;

  const CourseDetailPage({super.key, required this.courseId});

  @override
  State<CourseDetailPage> createState() => _CourseDetailPageState();
}

class _CourseDetailPageState extends State<CourseDetailPage> {
  late GoogleMapController mapController;
  List<Place> places = [];
  final Set<Marker> _markers = {};
  final List<LatLng> _polylinePoints = [];

  @override
  void initState() {
    super.initState();
    _loadCourseDetails();
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Future<void> _loadCourseDetails() async {
    final result = await ApiService.fetchCourseDetail(widget.courseId);

    setState(() {
      places = result;
      _markers.addAll(result.map((place) => Marker(
            markerId: MarkerId(place.title),
            position: LatLng(place.latitude!, place.longitude!),
            infoWindow: InfoWindow(title: place.title),
          )));
      _polylinePoints.addAll(result.map((place) => LatLng(place.latitude!, place.longitude!)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: const CameraPosition(
              target: LatLng(37.5446, 127.0559),
              zoom: 15.0,
            ),
            markers: _markers,
            polylines: {
              Polyline(
                polylineId: const PolylineId('route'),
                points: _polylinePoints,
                color: Colors.blue,
                width: 5,
              ),
            },
            zoomControlsEnabled: false,
            mapToolbarEnabled: false,
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.6,
            minChildSize: 0.4,
            maxChildSize: 0.9,
            builder: (context, scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                child: SingleChildScrollView(
                  controller: scrollController,
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Container(
                        width: 40,
                        height: 4,
                        margin: const EdgeInsets.only(bottom: 12),
                        decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      const Text('성수 산책', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      const Text('@play_king', style: TextStyle(fontSize: 13, color: Colors.grey)),
                      const SizedBox(height: 30),
                      Column(
                        children: List.generate(
                          places.length,
                          (index) => _buildPlaceItem(index + 1, places[index], index != places.length - 1),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: const CustomBottomNavBar(currentIndex: null),
    );
  }

  Widget _buildPlaceItem(int step, Place place, bool showLine) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            CircleAvatar(
              radius: 16,
              backgroundColor: Colors.orange,
              child: Text('$step', style: const TextStyle(color: Colors.white)),
            ),
            if (showLine) Container(width: 2, height: 40, color: Colors.orange),
          ],
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(place.title, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(place.address ?? '', style: const TextStyle(fontSize: 12, color: Colors.grey)),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
