import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lenter/models/book.dart';
import 'package:lenter/screens/book_description.dart';

class BookCard extends StatelessWidget {
  Book bookData;

  BookCard({Key? key,
  required this.bookData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => BookDescription(bookData: bookData,)));
        
      },
      child: SizedBox(
        height: 190,
        width: 90,
        child: Column(
          textDirection: TextDirection.rtl,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8), // Optional: add border radius
              child: Image.network(
                bookData.fields.coverLink,
                fit: BoxFit.cover, // Optional: set fit property to cover
                height: 132, width: 90, 
              ),
            ),
            SizedBox(height: 3.5,),
            Container(
              height: 34, width: 90,
              alignment: Alignment.centerLeft,
              child: Text(bookData.fields.title,
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,

                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                ),
              )
            ),
            SizedBox(height: 3.5,),
            Container(
              height: 17, width: 90,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.star_rate_rounded, color: Colors.yellow[600], size: 14,),
                  Text("${bookData.fields.averageRating}",
                    style: GoogleFonts.poppins(
                      color: Colors.yellow[600],
                      fontWeight: FontWeight.w300,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(width: 3,),
                  Text("(${bookData.fields.ratingCount})",
                    style: GoogleFonts.poppins(
                      color: Color.fromRGBO(255, 255, 255, 0.5),
                      fontWeight: FontWeight.w300,
                      letterSpacing: -0.8,
                      fontSize: 12,
                    ),
                  )
                ],
              ),
            )
          ]
        ),
      )
    );
  }
}