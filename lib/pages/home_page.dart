import 'package:flutter/material.dart';
import '../widgets/trip_card.dart'; 
import 'place_detail_page.dart'; 
import 'category_page.dart';
import 'explore_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _horizontalScrollController = ScrollController();
  final ScrollController _verticalScrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> _filteredTopTrips = [];
  List<Map<String, dynamic>> _filteredMorePlaces = [];

  final List<String> categories = [
    'Theme Park',
    'Beaches',
    'Churches',
    'Cafe',
    'Nature',
  ];

  final List<IconData> categoryIcons = [
    Icons.local_play,
    Icons.beach_access,
    Icons.church,
    Icons.local_cafe,
    Icons.landscape,
    Icons.nature,
  ];

  final List<Map<String, dynamic>> topTrips = [
    {
      'image': 'assets/images/taal.jpg',
      'title': 'Taal Basilica Church',
      'location': 'Taal, Batangas, Philippines',
      'rating': 4.5,
      'description': 'Discover the grandeur of Taal Basilica, the Basilica of St. Martin de Tours, in Taal, Batangas! Renowned as one of the largest churches in Asia, this majestic Baroque masterpiece, built in 1575, offers a glimpse into the Philippines\' rich history and heritage. Visit Taal Basilica and immerse yourself in its awe-inspiring architecture, serene atmosphere, and historical significance. Perfect for history enthusiasts, architecture buffs, and spiritual seekers alike, Taal Basilica is a must-visit destination that promises an unforgettable experience. Come and witness the timeless beauty of this iconic landmark!',
      'images': [
        'assets/images/taal.jpg',
        'images/taal0.jpg',
        'images/taal1.jpg',
      ],
    },
    {
      'image': 'images/lipachurch.jpg',
      'title': 'Lipa Cathedral Church',
      'location': 'Lipa, Batangas',
      'rating': 4.0,
      'description': 'Explore Lipa Basilica, the Metropolitan Cathedral of San Sebastian, in Lipa City, Batangas! Marvel at its stunning neo-Romanesque architecture and rich history since 1605. Perfect for history buffs, architecture enthusiasts, and spiritual seekers, Lipa Basilica offers a serene and inspiring visit. Discover this iconic landmark today!',
      'images': [
        'images/lipachurch.jpg',
        'images/lipa1.jpg',
        'images/lipachurch.jpg',
      ],
    },
    {
        'image': 'images/masasab.jpg',
        'title': 'Masasa Beach',
        'location': 'Lobo, Batangas, Philippines', 
        'rating': 4.5, 
        'description': 'A picturesque church on a hill.',
        'images': [
            'images/masasab.jpg',
            'images/masasab.jpg',
            'images/masasab.jpg',
        ],
    },
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
      'image': 'assets/images/monte.jpeg',
      'title': 'Monte Maria Shrine',
      'location': 'Batangas City',
      'rating': 4.5,
      'description': 'Visit Monte Maria Shrine, a sacred and serene pilgrimage site in Batangas, dedicated to the Virgin Mary. Perched on a hilltop, this shrine offers breathtaking views of the surrounding landscapes and a peaceful atmosphere for prayer and reflection. With its impressive statue of the Blessed Mother and beautifully landscaped grounds, Monte Maria Shrine is a spiritual haven where visitors can find solace, inspiration, and a deep sense of connection to their faith.',
      'images': [
        'assets/images/monte.jpeg',
        'assets/images/monte.jpeg',
        'assets/images/monte.jpeg',
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
      'image': 'images/lilbora1.jpg',
      'title': 'Little Boracay',
      'location': 'Calatagan, Batangas',
      'rating': 4.2,
      'description': 'Escape to Little Boracay in Calatagan, a hidden gem known for its pristine white sand beaches and crystal-clear waters. This tropical paradise offers a serene retreat from the hustle and bustle, perfect for sunbathing, swimming, and beachcombing. Enjoy stunning sunsets, vibrant marine life, and a tranquil ambiance that makes Little Boracay an ideal destination for relaxation and adventure alike.',
      'images': [
        'images/lilbora1.jpg',
        'images/lilbora2.jpg',
        'images/lilbora3.jpg',
      ],
    },   
    {
        'image': 'assets/images/thefarm.jpg',
        'title': 'The Farm at San Benito',
        'location': 'Lipa City, Batangas, Philippines', 
        'rating': 4.8,  
        'description': 'A health and wellness resort.',
        'images': [
            'assets/images/thefarm.jpg',
            'assets/images/thefarm.jpg',
            'assets/images/thefarm.jpg',
        ],
    },
    {
        'image': 'images/mtmaculot.jpg',
        'title': 'Mt. Maculot',
        'location': 'Cuenca, Batangas, Philippines',  
        'rating': 4.6,  
        'description': 'A picturesque church on a hill.',
        'images': [
            'images/mtmaculot.jpg',
            'images/mtmaculot.jpg',
            'images/mtmaculot.jpg',
        ],
    },    
  ];

  final List<Map<String, dynamic>> morePlaces = [        
    {
      'image': 'images/lh1.jpg',
      'title': 'Loghouse Cafe',
      'location': 'Lipa, Batangas',
      'rating': 4.1,
      'description': 'Experience the cozy charm of Loghouse Café in Lipa, often called the little Baguio of Batangas. Nestled in lush surroundings, this café offers a delightful retreat with its wooden interiors, warm ambiance, and scenic views. Savor delicious comfort food, specialty coffees, and homemade pastries as you relax in a setting reminiscent of Baguio’s serene mountain vibes. Perfect for unwinding, Loghouse Café provides a refreshing escape and a taste of nature’s tranquility.',
      'images': [
        'images/lh1.jpg',
        'images/lh2.png',
        'images/lh3.jpg',
      ],
    },
    {
      'image': 'images/ig2.jpg',
      'title': 'Imelda\'s Garden',
      'location': 'Cuenca, Batangas',
      'rating': 4.8,
      'description': 'Discover the enchanting beauty of Imelda\'s Garden in Cuenca, a lush haven brimming with vibrant flora and serene landscapes. This picturesque garden offers a tranquil escape, perfect for leisurely strolls, intimate gatherings, and capturing stunning photos. Immerse yourself in the captivating array of flowers and greenery, and experience the peaceful ambiance that makes Imelda\'s Garden a true botanical paradise in the heart of Cuenca.',
      'images': [
        'images/ig1.jpg',
        'images/ig2.jpg',
        'images/ig3.jpg',
      ],
    },
    {
      'image': 'assets/images/fort.jpg',
      'title': 'Fortune Island',
      'location': 'Nasugbu, Batangas',
      'rating': 4.2,
      'description': 'Fortune Island is a secluded paradise with beautiful beaches and ruins.',
      'images': [
        'assets/images/fort.jpg',
        'assets/images/fort.jpg',
        'assets/images/fort.jpg',
      ],
    },
    {
      'image': 'assets/images/kaybiang.jpg',
      'title': 'Kaybiang Tunnel',
      'location': 'Nasugbu - Ternate Road, Philippines',
      'rating': 4.1,
      'description': 'The longest tunnel in the Philippines.',
      'images': [
        'assets/images/kaybiang.jpg',
        'assets/images/kaybiang.jpg',
        'assets/images/kaybiang.jpg'
      ],
    },
    {
      'image': 'assets/images/mtmalarayat.jpg',
      'title': 'Mt. Malarayat',
      'location': 'Lipa City, Batangas, Philippines',
      'rating': 4.8,
      'description': 'A mountain resort and golf club.',
      'images': [
        'assets/images/mtmalarayat.jpg',
        'assets/images/mtmalarayat.jpg',
        'assets/images/mtmalarayat.jpg',
      ],
    },
    {
        'image': 'assets/images/lobo.jpg',
        'title': 'Lobo Beach',
        'location': 'Lobo, Batangas, Philippines',  
        'rating': 4.5,  
        'description': 'A serene beach destination.',
        'images': [
            'assets/images/lobo.jpg',
            'assets/images/lobo.jpg',
            'assets/images/lobo.jpg',
        ],
    },
    {
        'image': 'images/fantasyworld.jpg',
        'title': 'Fantasy World',
        'location': 'Lemery, Batangas, Philippines', 
        'rating': 4.5,  
        'description': 'A picturesque church on a hill.',
        'images': [
            'images/fantasyworld.jpg',
            'images/fantasyworld.jpg',
            'images/fantasyworld.jpg',
        ],
    },    
    {
        'image': 'images/mbfarm.jpg',
        'title': 'Milea Bee Farm',
        'location': 'San Jose, Batangas, Philippines',  
        'rating': 4.3,  
        'description': 'A picturesque church on a hill.',
        'images': [
            'images/mbfarm.jpg',
            'images/mbfarm.jpg',
            'images/mbfarm.jpg',
        ],
    },
    {
        'image': 'images/verdeisland.jpg',
        'title': 'Verde Island',
        'location': 'Batangas City, Philippines',  
        'rating': 4.7, 
        'description': 'A picturesque church on a hill.',
        'images': [
            'images/verdeisland.jpg',
            'images/verdeisland.jpg',
            'images/verdeisland.jpg',
        ],
    },
    {
        'image': 'images/mtgb.jpg',
        'title': 'Mt. Gulugod Baboy',
        'location': 'Mabini, Batangas, Philippines',  
        'rating': 4.4, 
        'description': 'A picturesque church on a hill.',
        'images': [
            'images/mtgb.jpg',
            'images/mtgb.jpg',
            'images/mtgb.jpg',
        ],
    },
  ];  


  @override
  void initState() {
    super.initState();
    _filteredTopTrips = topTrips; // Initialize with all top trips items
    _filteredMorePlaces = morePlaces; // Initialize with all more places items
  }

  void _scrollLeft() {
    if (_horizontalScrollController.hasClients) {
      final newOffset = _horizontalScrollController.offset - 200;
      _horizontalScrollController.animateTo(
        newOffset < 0 ? 0 : newOffset, // Prevent scrolling beyond start
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _scrollRight() {
    if (_horizontalScrollController.hasClients) {
      final maxOffset = _horizontalScrollController.position.maxScrollExtent;
      final newOffset = _horizontalScrollController.offset + 200;
      _horizontalScrollController.animateTo(
        newOffset > maxOffset ? maxOffset : newOffset, // Prevent scrolling beyond end
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _scrollDown() {
    if (_verticalScrollController.hasClients) {
      _verticalScrollController.animateTo(
        _verticalScrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  void _filterPlaces(String query) {
    final filteredTopTrips = topTrips.where((item) {
      final titleLower = item['title']?.toLowerCase() ?? '';
      final locationLower = item['location']?.toLowerCase() ?? '';
      final searchLower = query.toLowerCase();

      return titleLower.contains(searchLower) || locationLower.contains(searchLower);
    }).toList();

    final filteredMorePlaces = morePlaces.where((item) {
      final titleLower = item['title']?.toLowerCase() ?? '';
      final locationLower = item['location']?.toLowerCase() ?? '';
      final searchLower = query.toLowerCase();

      return titleLower.contains(searchLower) || locationLower.contains(searchLower);
    }).toList();

    setState(() {
      _filteredTopTrips = filteredTopTrips;
      _filteredMorePlaces = filteredMorePlaces;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home",
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255), // Text color
          ),
        ),
        backgroundColor: Color.fromARGB(255, 67, 156, 141), // AppBar background color
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
      controller: _verticalScrollController,
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            SizedBox(height: 10),
            Text(
              "Let's Explore Batangas!",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: const Color.fromARGB(255, 0, 0, 0)),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search for places...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
                fillColor: Colors.grey[200],
              ),
              onChanged: _filterPlaces,
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: SizedBox(
                height: 140,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Categories',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CategoryPage(
                                      categoryName: categories[index],
                                    ),
                                  ),
                                );
                              },
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    height: 70,
                                    width: 70,
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 67, 156, 141),
                                      borderRadius: BorderRadius.circular(80),
                                    ),
                                    child: Icon(
                                      categoryIcons[index],
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    categories[index],
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Text(
              'Top Trips',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Nearby',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ExplorePage()),
                    );
                  },
                  child: Row(
                    children: [
                      Text(
                        'Explore',
                        style: TextStyle(fontSize: 16, color: Colors.blue),
                      ),
                      Icon(Icons.arrow_forward_ios, size: 20, color: Colors.blue),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Container(
            height: 250,
            child: Stack(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  controller: _horizontalScrollController, // Use the horizontal controller here
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    children: _filteredTopTrips.map((item) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PlaceDetailPage(item: item),
                            ),
                          );
                        },
                        child: TripCard(
                          image: item['image'],
                          title: item['title'],
                          location: item['location'],
                        ),
                      );
                    }).toList(),
                  ),
                ),
                Positioned(
                  left: 20,
                  top: 0,
                  bottom: 20,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_ios, size: 30, color: Color.fromARGB(255, 0, 119, 255)),
                    onPressed: _scrollLeft,
                  ),
                ),
                Positioned(
                  right: 15,
                  top: 0,
                  bottom: 20,
                  child: IconButton(
                    icon: Icon(Icons.arrow_forward_ios, size: 30, color: Color.fromARGB(255, 0, 119, 255)),
                    onPressed: _scrollRight,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
            Text(
              'Suggested',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Container(
              height: 200, 
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: _filteredMorePlaces.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = _filteredMorePlaces[index];
                  final rating = item['rating'] ?? 0.0; 

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PlaceDetailPage(item: item),
                          ),
                        );
                      },
                      child: Container(
                        height: 100, 
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 4,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.horizontal(left: Radius.circular(10)),
                              child: Image.asset(
                                item['image'] ?? '', 
                                width: 150, 
                                height: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 23.0, left: 20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item['title'] ?? '', // Handle null values
                                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 5),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                          size: 16,
                                        ),
                                        SizedBox(width: 4),
                                        Text(
                                          rating.toStringAsFixed(1), // Show rating with 1 decimal place
                                          style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
      ),
    );
  }
}
