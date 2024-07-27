import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';

class PlaceDetailPage extends StatefulWidget {
  final Map<String, dynamic> item;

  PlaceDetailPage({required this.item});

  @override
  _PlaceDetailPageState createState() => _PlaceDetailPageState();
}

class _PlaceDetailPageState extends State<PlaceDetailPage> {
  bool _showReviewInput = false;
  bool _isEditing = false;
  int? _editingIndex;
  double _rating = 3.0;
  bool _isFavorited = false; // Track whether the place is favorited or not

  final TextEditingController _reviewController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  List<Map<String, dynamic>> _reviews = [
    {'username': 'john_doe', 'title': 'Great place!', 'content': 'Really enjoyed the visit. The place is wonderful.', 'rating': 4.5},
    {'username': 'jane_smith', 'title': 'Not bad', 'content': 'It was okay, but there were some issues.', 'rating': 3.0},
    {'username': 'travel_guru', 'title': 'Would visit again', 'content': 'The experience was fantastic. Highly recommend!', 'rating': 5.0},
  ];
  final String currentUser = 'nathalieanicas'; // Replace with the actual current username

  void _toggleReviewInput() {
    setState(() {
      _showReviewInput = !_showReviewInput;
      if (!_showReviewInput) {
        _isEditing = false;
        _editingIndex = null;
        _reviewController.clear();
        _titleController.clear();
      }
    });
  }

  void _submitReview() {
    final reviewText = _reviewController.text;
    final reviewTitle = _titleController.text;
    if (reviewText.isNotEmpty && reviewTitle.isNotEmpty) {
      setState(() {
        if (_isEditing && _editingIndex != null) {
          _reviews[_editingIndex!] = {
            'username': currentUser,
            'title': reviewTitle,
            'content': reviewText,
            'rating': _rating,
          };
        } else {
          _reviews.add({
            'username': currentUser,
            'title': reviewTitle,
            'content': reviewText,
            'rating': _rating,
          });
        }
        _reviewController.clear();
        _titleController.clear();
        _showReviewInput = false;
        _isEditing = false;
        _editingIndex = null;
      });
    }
  }

  void _editReview(int index) {
    setState(() {
      _isEditing = true;
      _editingIndex = index;
      _reviewController.text = _reviews[index]['content'] ?? '';
      _titleController.text = _reviews[index]['title'] ?? '';
      _rating = _reviews[index]['rating']?.toDouble() ?? 3.0;
      _showReviewInput = true;
    });
  }

  void _deleteReview(int index) {
    setState(() {
      _reviews.removeAt(index);
    });
  }

  void _launchURL(String url) async {
    try {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not launch $url')),
      );
    }
  }

  void _toggleFavorite() {
    setState(() {
      _isFavorited = !_isFavorited;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<String> images = List<String>.from(widget.item['images'] ?? [
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
    ]);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.item['title'] ?? 'Details',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 67, 156, 141),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  height: 200,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  aspectRatio: 16 / 9,
                  viewportFraction: 1.0,
                ),
                items: images.map<Widget>((image) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.asset(
                            image,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Center(child: Text('Image not found'));
                            },
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              SizedBox(height: 16),
              Text(
                widget.item['title'] ?? 'Title not available',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.amber),
                  SizedBox(width: 4),
                  Text(
                    widget.item['rating']?.toStringAsFixed(1) ?? 'N/A',
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  ),
                  SizedBox(width: 16),
                  Icon(Icons.location_on, color: Colors.blue),
                  SizedBox(width: 4),
                  Text(
                    widget.item['location'] ?? 'Location not available',
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(
                      _isFavorited ? Icons.favorite : Icons.favorite_border,
                      color: _isFavorited ? Colors.red : Colors.grey,
                    ),
                    onPressed: _toggleFavorite,
                  ),
                ],
              ),
              Divider(thickness: 2, color: Colors.grey[300]),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      IconButton(
                        icon: Icon(Icons.public, color: Color.fromARGB(255, 64, 148, 132)),
                        onPressed: () {
                          _launchURL('https://www.theoldgrovefarmstead.ph/'); // Replace with the actual URL
                        },
                      ),
                      SizedBox(height: 4),
                      Text('Website', style: TextStyle(fontSize: 12, color: Colors.black)),
                    ],
                  ),
                  SizedBox(width: 16),
                  Column(
                    children: [
                      IconButton(
                        icon: Icon(Icons.map, color: Color.fromARGB(255, 64, 148, 132)),
                        onPressed: () {
                          _launchURL('https://www.google.com/maps/dir/13.7629623,121.0678958/the+old+grove+farmstead+google+maps/@13.852779,121.0222724,12z/data=!3m1!4b1!4m9!4m8!1m1!4e1!1m5!1m1!1s0x33bd6dbd67da9909:0x2c3700f4696b445a!2m2!1d121.1356255!2d13.9335206?entry=ttu'); // Replace with the actual URL
                        },
                      ),
                      SizedBox(height: 4),
                      Text('Map', style: TextStyle(fontSize: 12, color: Colors.black)),
                    ],
                  ),
                  SizedBox(width: 16),
                  Column(
                    children: [
                      IconButton(
                        icon: Icon(Icons.facebook, color: Color.fromARGB(255, 64, 148, 132)),
                        onPressed: () {
                          _launchURL('https://www.facebook.com/TheOldGroveFarmstead/'); // Replace with the actual URL
                        },
                      ),
                      SizedBox(height: 4),
                      Text('Facebook', style: TextStyle(fontSize: 12, color: Colors.black)),
                    ],
                  ),
                  SizedBox(width: 16),
                  Column(
                    children: [
                      IconButton(
                        icon: Icon(Icons.phone, color:Color.fromARGB(255, 64, 148, 132)),
                        onPressed: () {
                          _launchURL('tel:+639178952829'); // Replace with the actual phone number
                        },
                      ),
                      SizedBox(height: 4),
                      Text('Call', style: TextStyle(fontSize: 12, color: Colors.black)),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'About Destination',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      widget.item['description'] ?? 'Description not available',
                      style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Reviews',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: _toggleReviewInput,
                    child: Text(_showReviewInput ? 'Cancel' : 'Add Review'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 67, 156, 141),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: _reviews.length,
                itemBuilder: (context, index) {
                  final review = _reviews[index];
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    padding: EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          review['title'] ?? 'No title',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text('by ${review['username']}'),
                        SizedBox(height: 4),
                        Text(review['content'] ?? 'No content'),
                        SizedBox(height: 4),
                        Row(
                          children: List.generate(5, (i) {
                            return Icon(
                              Icons.star,
                              color: i < review['rating'] ? Colors.amber : Colors.grey,
                            );
                          }),
                        ),
                        if (review['username'] == currentUser)
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(Icons.edit, color: Colors.blue),
                                onPressed: () => _editReview(index),
                              ),
                              IconButton(
                                icon: Icon(Icons.delete, color: Colors.red),
                                onPressed: () => _deleteReview(index),
                              ),
                            ],
                          ),
                      ],
                    ),
                  );
                },
              ),
              if (_showReviewInput) ...[
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Title:'),
                      TextField(
                        controller: _titleController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Review title...',
                        ),
                      ),
                      SizedBox(height: 8),
                      Text('Rating:'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: List.generate(5, (index) {
                          return IconButton(
                            icon: Icon(
                              Icons.star,
                              color: index < _rating ? Colors.amber : Colors.grey,
                            ),
                            onPressed: () {
                              setState(() {
                                _rating = index + 1.0;
                              });
                            },
                          );
                        }),
                      ),
                      SizedBox(height: 8),
                      TextField(
                        controller: _reviewController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Write your review...',
                          suffixIcon: IconButton(
                            icon: Icon(
                              Icons.send,
                              color: Colors.blue,
                            ),
                            onPressed: _submitReview,
                          ),
                        ),
                        maxLines: 3,
                      ),
                    ],
                  ),
                ),
              ],
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
