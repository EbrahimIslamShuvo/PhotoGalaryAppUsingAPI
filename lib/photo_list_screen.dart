import 'package:flutter/material.dart';

void main() {
  runApp(PhotoGalleryApp());
}

class PhotoGalleryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Photo Gallery',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PhotoGalleryPage(),
    );
  }
}

class PhotoGalleryPage extends StatelessWidget {
  final List<Map<String, String>> photos = [
    {'id': '1', 'title': 'Photo 1', 'url': 'https://via.placeholder.com/150'},
    {'id': '2', 'title': 'Photo 2', 'url': 'https://via.placeholder.com/150'},
    {'id': '3', 'title': 'Photo 3', 'url': 'https://via.placeholder.com/150'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('The photo gallery'),
      ),
      body: ListView.builder(
        itemCount: photos.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.network(
              photos[index]['url']!,
              width: 150,
              height: 150,
            ),
            title: Text(photos[index]['title']!),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PhotoDetailPage(
                    photo: photos[index],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class PhotoDetailPage extends StatelessWidget {
  final Map<String, String> photo;

  PhotoDetailPage({required this.photo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(photo['title']!),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              photo['url']!,
              width: 600,
              height: 600,
            ),
            SizedBox(height: 20),
            Text('Title: ${photo['title']}'),
            Text('ID: ${photo['id']}'),
          ],
        ),
      ),
    );
  }
}
