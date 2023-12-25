import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book Store',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: BookListPage(),
    );
  }
}

class BookListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NAME OF THE BOOKS'),
      ),
      body: ListView(
        children: [
          CardWidget(
            bookName: 'Normal People',
            authorName: 'Sally Ronne',
            rating: 4.2,
            imageUrl: 'https://offtheshelf.b-cdn.net/app/uploads/2019/12/Normal-People.jpg',
          ),
          CardWidget(
            bookName: 'Such a Fun Age',
            authorName: 'Kiley Reid',
            rating: 4.5,
            imageUrl: 'https://offtheshelf.b-cdn.net/app/uploads/2019/12/Such-a-fun-age.jpg',
          ),
          CardWidget(
            bookName: 'Behold the Dreamers',
            authorName: 'Imbolo Mbue',
            rating: 4.2,
            imageUrl: 'https://offtheshelf.b-cdn.net/app/uploads/2017/02/behold-the-dreamers.jpg',
          ),
          CardWidget(
            bookName: 'The Square of Sevens',
            authorName: ' Laura Shepherd-Robinson',
            rating: 4.4,
            imageUrl: 'https://d28hgpri8am2if.cloudfront.net/book_images/onix/cvr9781668031124/the-square-of-sevens-9781668031124_xlg.jpg',
          ),
          CardWidget(
            bookName: 'Gull Island',
            authorName: ' Anna Porter',
            rating: 4.1,
            imageUrl: 'https://d28hgpri8am2if.cloudfront.net/book_images/onix/cvr9781668017708/gull-island-9781668017708_xlg.jpg'
          ),
          CardWidget(
            bookName: 'First Born',
            authorName: ' Will Dean',
            rating: 4.2,
            imageUrl: 'https://d28hgpri8am2if.cloudfront.net/book_images/onix/cvr9781982156527/first-born-9781982156527_xlg.jpg',
          ),
        ],
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  final String bookName;
  final String authorName;
  final double rating;
  final String imageUrl;

  const CardWidget({
    required this.bookName,
    required this.authorName,
    required this.rating,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        leading: Container(
          width: 100,
          height: 5000,
          color: Colors.blue,
          child: Image.network(imageUrl),
        ),
        title: Text(bookName),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(authorName),
            Text('Rating: $rating'),
          ],
        ),
        trailing: ElevatedButton.icon(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BuyNowPage(
                  bookName: bookName,
                  authorName: authorName,
                  rating: rating,
                  imageUrl: imageUrl,
                ),
              ),
            );
          },
          icon: Icon(Icons.shopping_cart),
          label: Text('Buy Now'),
        ),
      ),
    );
  }
}

class BuyNowPage extends StatelessWidget {
  final String bookName;
  final String authorName;
  final double rating;
  final String imageUrl;

  const BuyNowPage({
    required this.bookName,
    required this.authorName,
    required this.rating,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buy Now'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 200,
              height: 200,
              color: Colors.greenAccent,
              child: Image.network(imageUrl),
            ),
            SizedBox(height: 16.0),
            Text(
              bookName,
              style: TextStyle(fontSize: 100.0, fontWeight: FontWeight.bold),
            ),
            Text('by $authorName'),
            Text('Rating: $rating'),
            SizedBox(height: 16.0),
            Text('Tarot cards, crystals, manifestation, and spoken affirmations dominate our zeitgeist. So why not read a book about a fortune teller who holds fate in the palm of her hand? In 1730s England, a young girl named Red travels from village to village, predicting fortunes with her father. Their method of relaying the future via playing cards is known as the Square of Sevens. After Red’s father dies, one fact becomes crystal clear: she can predict everyone’s fate but her own. On a dazzling journey that takes her from Bath to London, Red searches for answers about her dead parents, her card-shuffling inheritance, and the mysterious enemies that covet its power.'),
            SizedBox(height: 16.0),
            Text('Price: \$39.99'),
            SizedBox(height: 16.0),
            DropdownButton<String>(
              value: 'Option 1',
              onChanged: (String? newValue) {

              },
              items: [
                'Option 1',
                'Option 2',
                'Option 3',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}
