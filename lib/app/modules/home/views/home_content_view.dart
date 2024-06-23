import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_cancellable_tile_provider/flutter_map_cancellable_tile_provider.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:teleglobal_operate/app/modules/home/controllers/home_controller.dart';
import 'package:teleglobal_operate/app/utils/themes/colors.dart';
import 'package:teleglobal_operate/app/widgets/dashboard_tile.dart';

class HomeContentView extends StatelessWidget {
  const HomeContentView({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Container(
            width: width,
            height: height * .5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: AppColors.secondaryBackground,
              boxShadow: const [
                BoxShadow(
                  blurRadius: 4,
                  spreadRadius: 0,
                  offset: Offset(0, 4),
                  color: Color.fromARGB(8, 47, 46, 46),
                )
              ],
            ),
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: FlutterMap(
                  options: const MapOptions(
                    initialZoom: 5.1,
                    maxZoom: 8,
                    initialCenter: LatLng(-2.8, 116.2),
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                          'https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}',
                      additionalOptions: const {
                        'accessToken':
                            'pk.eyJ1IjoiaGFudHVqaWlpaSIsImEiOiJjbHhrajlmd3AwMjNwMmlwa2x3MHE3cjJ0In0.9uql1E-11WhFIs0JwBje2g',
                        'id': 'mapbox/light-v11',
                      },
                    ),
                    MarkerLayer(
                      markers: controller.locations.map(
                        (location) {
                          return Marker(
                            width: 20.0,
                            height: 20.0,
                            point: LatLng(location['lat'], location['long']),
                            child: InkWell(
                              onTap: () => debugPrint("Ini diklik"),
                              child: const Icon(
                                Icons.location_on,
                                color: AppColors.orangeAccent,
                                size: 20.0,
                              ),
                            ),
                          );
                        },
                      ).toList(),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              DashboardTile(
                height: height,
                width: width,
                title: "Site Up",
                data: "420",
                description: "Total Site 420/520",
              ),
              const SizedBox(width: 16),
              DashboardTile(
                height: height,
                width: width,
                title: "Site Down",
                data: "80",
                description: "Total Site 80/520",
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              DashboardTile(
                height: height,
                width: width,
                title: "Trouble Ticket Open",
                data: "87",
                description: DateTime.now().toIso8601String(),
              ),
              const SizedBox(width: 16),
              DashboardTile(
                height: height,
                width: width,
                title: "SLA Monthly",
                data: "98 %",
                description: DateTime.now().toIso8601String(),
              ),
            ],
          )
        ],
      ),
    );
  }
}
