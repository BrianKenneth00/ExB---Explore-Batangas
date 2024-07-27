import 'package:flutter/material.dart';
import 'place_detail_page.dart';

class FavoritesPage extends StatefulWidget {
  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> _favorites = [
    {
      'image': 'images/cal2.jpg',
      'title': 'Caleruega Church',
      'location': 'Nasugbu, Batangas',
      'rating': 4.5,
      'description': 'Discover serenity and spiritual renewal at Caleruega Church, a picturesque sanctuary nestled in the lush hills of Nasugbu, Batangas. Renowned for its stunning architecture and tranquil surroundings, Caleruega Church offers a perfect retreat for reflection, prayer, and picturesque weddings. Experience peace and natural beauty in this sacred haven, where faith and nature harmoniously converge.',
      'images': [
        'images/cal2.jpg',
        'images/caleruega.jpg',
        'images/cal3.jpg',
      ],
    },
    {
      'image': 'images/togf1.jpg',
      'title': 'The Old Grove Farmstead',
      'location': 'Lipa, Batangas',
      'rating': 4.0,
      'description': 'Step into a rustic paradise at The Old Grove Farmstead, a charming destination in Lipa, Batangas. This picturesque farm offers a delightful blend of nature, history, and leisure, featuring a stunning red barn, serene lake, and lush gardens. Perfect for family outings, romantic getaways, and unforgettable events, The Old Grove Farmstead invites you to relax, explore, and create lasting memories in a beautiful countryside setting.',
      'images': [
        'images/togf1.jpg',
        'images/togf2.jpg',
        'images/togf3.jpg',
      ],
    },
    {
      'image': 'images/jcastle.jpg',
      'title': 'J Castles Theme Park',
      'location': 'Tanauan City, Batangas',
      'rating': 3.8,
      'description': 'Experience the ultimate adventure at J Castles Theme Park, \nwhere endless fun and excitement await! From thrilling roller coasters to magical fairy-tale castles, J Castles offers unforgettable attractions for all ages. Delight in our family-friendly shows, \nindulge in a variety of dining options, and create cherished memories with every visit. Discover the magic, joy, and wonder of J Castles Theme Park—where dreams come to life!',

      'images': [
        'images/jcastle.jpg',
        'images/jcas1.jpg',
        'images/jcas2.jpg',
      ],
    },
    {
      'image': 'images/taal.jpg',
      'title': 'Taal Basilica Church',
      'location': 'Taal, Batangas, Philippines',
      'rating': 4.5,
      'description': 'Discover the grandeur of Taal Basilica, the Basilica of St. Martin de Tours, in Taal, Batangas! Renowned as one of the largest churches in Asia, this majestic Baroque masterpiece, built in 1575, offers a glimpse into the Philippines\' rich history and heritage. Visit Taal Basilica and immerse yourself in its awe-inspiring architecture, serene atmosphere, and historical significance. Perfect for history enthusiasts, architecture buffs, and spiritual seekers alike, Taal Basilica is a must-visit destination that promises an unforgettable experience. Come and witness the timeless beauty of this iconic landmark!',
      'images': [
        'images/taal.jpg',
        'images/taal0.jpg',
        'images/taal1.jpg',
      ],
    },
    {
      'image': 'images/monte.jpeg',
      'title': 'Monte Maria Shrine',
      'location': 'Batangas City',
      'rating': 4.5,
      'description': 'Visit Monte Maria Shrine, a sacred and serene pilgrimage site in Batangas, dedicated to the Virgin Mary. Perched on a hilltop, this shrine offers breathtaking views of the surrounding landscapes and a peaceful atmosphere for prayer and reflection. With its impressive statue of the Blessed Mother and beautifully landscaped grounds, Monte Maria Shrine is a spiritual haven where visitors can find solace, inspiration, and a deep sense of connection to their faith.',
      'images': [
        'images/monte.jpeg',
        'images/monte.jpeg',
        'images/monte.jpeg',
      ],
    },
    
  ];
  List<Map<String, dynamic>> _filteredFavorites = [];

  @override
  void initState() {
    super.initState();
    _filteredFavorites = _favorites;
  }

  void _filterFavorites(String query) {
    final filtered = _favorites.where((favorite) {
      final titleLower = favorite['title']?.toLowerCase() ?? '';
      final locationLower = favorite['location']?.toLowerCase() ?? '';
      final searchLower = query.toLowerCase();

      return titleLower.contains(searchLower) || locationLower.contains(searchLower);
    }).toList();

    setState(() {
      _filteredFavorites = filtered;
    });
  }

  void _removeFavorite(int index) {
    setState(() {
      _favorites.removeAt(index);
      _filteredFavorites = _favorites;
    });
  }

  void _navigateToDetail(Map<String, dynamic> place) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PlaceDetailPage(item: place),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Favorites",
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255), // Text color
          ),
        ),
        backgroundColor: Color.fromARGB(255, 67, 156, 141), // AppBar background color
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search favorites...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
                fillColor: Colors.grey[200],
              ),
              onChanged: _filterFavorites,
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _filteredFavorites.length,
                itemBuilder: (context, index) {
                  final favorite = _filteredFavorites[index];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: ListTile(
                      leading: Image.asset(
                        favorite['image'],
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                      title: Text(favorite['title']),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.location_on, color: Color.fromARGB(255, 126, 230, 100), size: 16),
                              SizedBox(width: 4),
                              Text(favorite['location']),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.amber, size: 16),
                              SizedBox(width: 4),
                              Text('Rating: ${favorite['rating']}/5'),
                            ],
                          ),
                        ],
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.favorite, color: Colors.pink),
                        onPressed: () => _removeFavorite(index),
                      ),
                      onTap: () => _navigateToDetail(favorite), // Navigate to detail page on tap
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
