import 'package:flutter/material.dart';
import '../widgets/trip_card2.dart';
import '../models/place_model.dart';

class CategoryPage extends StatelessWidget {
  final String categoryName;

  CategoryPage({required this.categoryName});

  final List<Place> churchPlaces = [
    Place(
      title: 'Taal Church',
      location: 'Taal, Batangas',
      rating: 4.5,
      description: 'A historic church in Taal.',
      images: ['assets/images/taal.jpg'],
    ),
    Place(
      title: 'Lipa Cathedral',
      location: 'Lipa, Batangas',
      rating: 4.3,
      description: 'A beautiful cathedral in Lipa.',
      images: ['assets/images/lipachurch.jpg'],
    ),
    Place(
      title: 'Monte Maria Shrine',
      location: 'Batangas City',
      rating: 4.7,
      description: 'A sacred and serene pilgrimage site in Batangas, dedicated to the Virgin Mary',
      images: ['assets/images/monte.jpeg'],
    ),
  ];

  final List<Place> beachPlaces = [
    Place(
      title: 'Little Boracay',
      location: 'Alatagan, Batangas',
      rating: 4.8,
      description: 'A beautiful white sand beach.',
      images: ['assets/images/lilbora1.jpg'],
    ),
    Place(
      title: 'Masasa Beach',
      location: 'Tingloy, Batangas',
      rating: 4.7,
      description: 'A popular beach destination.',
      images: ['assets/images/masasab.jpg'],
    ),
  ];

  final List<Place> themeParkPlaces = [
    Place(
      title: 'J Castle',
      location: 'Tanauan City, Batangas, Philippines',
      rating: 3.8,
      description: 'J Castle offers a unique experience with its medieval-themed architecture.',
      images: ['assets/images/jcastle.jpg'],
    ),
    Place(
      title: 'Fantasy World',
      location: 'Lemery, Batangas, Philippines',
      rating: 4.5,
      description: 'Fantasy World offers a unique experience with its medieval-themed architecture.',
      images: ['assets/images/fantasyworld.jpg'],
    ),
  ];

  final List<Place> naturePlaces = [
    Place(
      title: 'Mt. Maculot',
      location: 'Cuenca, Batangas, Philippines',
      rating: 4.2,
      description: 'Amazing Mountains.',
      images: ['assets/images/mtmaculot.jpg'],
    ),
    Place(
      title: 'Mt.Gulugod Baboy',
      location: 'Mabini, Batangas, Philippines',
      rating: 4.5,
      description: 'Amazing Mountains.',
      images: ['assets/images/mtgb.jpg'],
    ),
     Place(
      title: 'The Old Grove Farmstead',
      location: 'Cuenca, Batangas, Philippines',
      rating: 4.5,
      description: 'Step into a rustic paradise at The Old Grove Farmstead',
      images: ['assets/images/togf1.jpg'],
    ),
    Place(
      title: 'Imelda\'s Garden',
      location: 'Lipa, Batangas, Philippines',
      rating: 4.5,
      description: 'A lush haven brimming with vibrant flora and serene landscapes',
      images: ['assets/images/ig1.jpg'],
    ),
  ];

  final List<Place> cafePlaces = [
    Place(
      title: 'Loghouse Cafe',
      location: 'Lipa, Batangas, Philippines',
      rating: 4.6,
      description: 'Experience the cozy charm of Loghouse Café in Lipa. This cafe is known as the littlr Baguio of Batangas.',
      images: ['assets/images/lh1.jpg'],
    ),
    Place(
      title: 'Libro Espresso',
      location: 'Lipa, Batangas, Philippines',
      rating: 4.3,
      description: 'A cozy cafe in Lipa that is a cafe for book lovers.',
      images: ['assets/images/libro1.jpg'],
    ),
  ];

  List<Place> getPlacesByCategory(String category) {
    switch (category) {
      case 'Churches':
        return churchPlaces;
      case 'Beaches':
        return beachPlaces;
      case 'Theme Park':
        return themeParkPlaces;
      case 'Nature':
        return naturePlaces;
      case 'Cafe':
        return cafePlaces;
      default:
        return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Place> places = getPlacesByCategory(categoryName);

    // Debugging output
    print('Selected Category: $categoryName');
    print('Places Count: ${places.length}');
    places.forEach((place) {
      print('Place: ${place.title}, Location: ${place.location}, Image: ${place.images.first}');
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryName,
          style: TextStyle(
            color: Colors.white, // Text color
          ),
        ),
        backgroundColor: Color.fromARGB(255, 67, 156, 141), // AppBar background color
        automaticallyImplyLeading: true,
      ),
      body: places.isEmpty
          ? Center(
              child: Text(
                'No places available for this category.',
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: places.length,
              itemBuilder: (context, index) {
                return TripCard2(
                  image: places[index].images.first,
                  title: places[index].title,
                  location: places[index].location,
                );
              },
            ),
    );
  }
}