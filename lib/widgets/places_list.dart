import 'package:favoriteplace/models/place.dart';
import 'package:favoriteplace/screens/places_details.dart';
import 'package:flutter/material.dart';

class PlacesList extends StatelessWidget {
  final List<Place> places;
  const PlacesList({super.key, required this.places});

  @override
  Widget build(BuildContext context) {
    if (places.isEmpty) {
      return Center(
        child: Text(
          'No places yet. Add some',
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      );
    }
    return ListView.builder(
        itemCount: places.length,
        itemBuilder: (context, index) => ListTile(
              leading: CircleAvatar(
                backgroundImage: FileImage(places[index].image),
                radius: 26,
              ),
              title: Text(
                places[index].title,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (ctx) => PlaceDetails(place: places[index])));
              },
            ));
  }
}
