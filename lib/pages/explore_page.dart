import 'package:flutter/material.dart';
import 'place_detail_page.dart';

class ExplorePage extends StatefulWidget {
  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  // List to keep track of favorite items
  Set<int> _favoriteIndices = {};

  // Controller for the search input
  TextEditingController _searchController = TextEditingController();

  // List of items and filtered items
  List<Map<String, dynamic>> items = [
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
      'image': 'images/fort.jpg',
      'title': 'Fortune Island',
      'location': 'Nasugbu, Batangas',
      'rating': 4.2,
      'description': 'Fortune Island, nestled off Nasugbu, Batangas, offers stunning white sand beaches and crystal-clear waters. Explore Greek-inspired ruins, enjoy snorkeling and diving, and unwind in this serene tropical paradise. Perfect for a memorable getaway!',
      'images': [
        'images/start.jpg',
        'images/ftisla1.jpg',
        'images/fort.jpg',
      ],
    },
    {
      'image': 'images/kaybiang.jpg',
      'title': 'Kaybiang Tunnel',
      'location': 'Nasugbu - Ternate Road, Batangas',
      'rating': 4.1,
      'description': 'Kaybiang Tunnel, located in Nasugbu, Batangas, is a must-see engineering marvel. This impressive, 246-meter-long tunnel offers a unique and scenic drive through lush landscapes and striking coastal views. It’s a gateway to adventure and a perfect spot for unforgettable photos. Experience the thrill and beauty of Kaybiang Tunnel on your next road trip!',
      'images': [
        'images/kaybiang.jpg',
        'images/kayb1.jpg',
        'images/kayb2.jpg',
      ],
    },
    {
      'image': 'images/mtmalarayat.jpg',
      'title': 'Mt. Malarayat Golf and Country Club',
      'location': 'Lipa City, Batangas',
      'rating': 4.8,
      'description': 'Mt. Malarayat Golf and Country Club in Lipa City, Batangas, is a premier golf destination offering an exceptional blend of challenging fairways and breathtaking views. Nestled amidst lush mountains, this prestigious club features a meticulously designed 27-hole course that caters to golfers of all levels. Enjoy top-notch amenities, stunning landscapes, and a welcoming atmosphere. Perfect for both a relaxing round of golf and a memorable day out.',
      'images': [
        'images/mtmalarayat.jpg',
        'images/mal1.jpg',
        'images/mal2.jpg',
      ],
    },
    {
        'image': 'images/thefarm.jpg',
        'title': 'The Farm at San Benito',
        'location': 'Lipa City, Batangas', 
        'rating': 4.8,  
        'description': 'The Farm at San Benito, nestled in Lipa City, Batangas, is a luxurious wellness retreat offering a serene escape from the everyday. Immerse yourself in lush tropical landscapes while enjoying holistic health programs, gourmet organic cuisine, and rejuvenating spa treatments. Ideal for relaxation, detoxification, and revitalization, The Farm provides a tranquil sanctuary for those seeking balance and wellness in a stunning natural setting.',
        'images': [
            'images/thefarm.jpg',
            'images/thefarm1.jpg',
            'images/thefarm3.jpg',
        ],
    },
    {
        'image': 'images/fantasyworld.jpg',
        'title': 'Fantasy World',
        'location': 'Lemery, Batangas', 
        'rating': 4.5,  
        'description': 'Fantasy World in Batangas is a whimsical theme park that brings fairytales to life. Explore enchanting castles, delightful gardens, and charming attractions designed to spark imagination and joy. Whether you\'re wandering through magical landscapes or snapping photos against stunning backdrops, Fantasy World offers a unique escape into a world of wonder and adventure. Perfect for a fun-filled day with family and friends!',
        'images': [
            'images/fantasyworld.jpg',
            'images/fantasy2.jpg',
            'images/fantasy1.jpg',
        ],
    },
    {
        'image': 'images/masasab.jpg',
        'title': 'Masasa Beach',
        'location': 'Tingloy, Batangas', 
        'rating': 4.5, 
        'description': 'Masasa Beach in Tingloy, Batangas, is a pristine tropical paradise known for its crystal-clear waters and powdery white sand. Ideal for swimming, snorkeling, and relaxation, this secluded gem offers stunning natural beauty and tranquility. Escape the hustle and bustle and unwind on the serene shores of Masasa Beach, where you can soak up the sun and enjoy breathtaking ocean views.',
        'images': [
            'images/masasab.jpg',
            'images/masasab1.jpg',
            'images/masasab2.jpg',
        ],
    },
    {
        'image': 'images/mbfarm.jpg',
        'title': 'Milea Bee Farm',
        'location': 'San Jose, Batangas',  
        'rating': 4.3,  
        'description': 'Discover the magic of Milea Bee Farm, where nature’s sweetest treasures come to life! Nestled in a serene setting, our farm offers a unique glimpse into the fascinating world of beekeeping. Join us for a tour and learn about the vital role bees play in our ecosystem while sampling our pure, golden honey. Perfect for nature enthusiasts and families alike, Milea Bee Farm is a delightful experience that’s both educational and delicious. Come buzz with us and savor the sweetness of nature!',
        'images': [
            'images/mbfarm.jpg',
            'images/milea1.jpg',
            'images/milea2.jpg',
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

  // List to store the filtered items based on search query
  List<Map<String, dynamic>> filteredItems = [];

  @override
  void initState() {
    super.initState();
    // Initialize the filteredItems with all items initially
    filteredItems = List.from(items);
    _searchController.addListener(_filterItems);
  }

  @override
  void dispose() {
    _searchController.removeListener(_filterItems);
    _searchController.dispose();
    super.dispose();
  }

  void _filterItems() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      filteredItems = items.where((item) {
        return item['title'].toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Explore Places",
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255), // Text color
          ),
        ),
        backgroundColor: Color.fromARGB(255, 67, 156, 141), // AppBar background color
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    icon: Icon(Icons.search, color: Colors.grey),
                    hintText: 'Search for places...',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            LayoutBuilder(
              builder: (context, constraints) {
                // Determine the number of columns based on screen width
                int crossAxisCount;
                if (constraints.maxWidth < 600) {
                  crossAxisCount = 2; // Mobile devices
                } else if (constraints.maxWidth < 1200) {
                  crossAxisCount = 4; // Tablets and small laptops
                } else {
                  crossAxisCount = 5; // Larger screens
                }

                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0), // Padding inside GridView
                  height: MediaQuery.of(context).size.height - kToolbarHeight, // Adjust height as needed
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount, // Dynamic number of columns
                      crossAxisSpacing: 8.0, // Adjust spacing as needed
                      mainAxisSpacing: 8.0, // Adjust spacing as needed
                      childAspectRatio: 0.9, // Adjust aspect ratio to fit the layout
                    ),
                    itemCount: filteredItems.length,
                    itemBuilder: (BuildContext context, int index) {
                      final item = filteredItems[index];
                      final isFavorite = _favoriteIndices.contains(index);

                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PlaceDetailPage(item: item),
                            ),
                          );
                        },
                        child: Card(
                          elevation: 5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                                    child: Image.asset(
                                      item['image'],
                                      width: double.infinity,
                                      height: 120, // Adjust height as needed
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Positioned(
                                    right: 10,
                                    top: 10,
                                    child: IconButton(
                                      icon: Icon(
                                        isFavorite ? Icons.favorite : Icons.favorite_border,
                                        color: isFavorite ? Colors.red : Colors.red, // Color based on favorite status
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          if (isFavorite) {
                                            _favoriteIndices.remove(index);
                                          } else {
                                            _favoriteIndices.add(index);
                                          }
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        item['title'],
                                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                        overflow: TextOverflow.ellipsis, // Handle overflow
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.star, color: Colors.amber, size: 16),
                                        SizedBox(width: 4),
                                        Text(
                                          item['rating'].toStringAsFixed(1),
                                          style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  item['description'], // Add description here
                                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                                  maxLines: 2, // Limit description lines
                                  overflow: TextOverflow.ellipsis, // Show ellipsis for overflow
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
