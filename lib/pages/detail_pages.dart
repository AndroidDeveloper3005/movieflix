import 'package:flutter/material.dart';
import '../data.dart';
import '../widgets/gradient_background.dart';

class DetailPage extends StatelessWidget{
  final String title;
  final String image;

  DetailPage(this.title , this.image);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.height * 0.50,
            ) ,
            child: _backgroundImage(context),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.30,
            ),
            child:gradientBackground(
            Colors.transparent,
             Color.fromRGBO(35, 45, 59, 1)
             ),
          ),
          Padding(  
            padding: EdgeInsets.fromLTRB(          
              MediaQuery.of(context).size.width * 0.025 ,
              MediaQuery.of(context).size.height * 0.05 ,
              MediaQuery.of(context).size.width * 0.025 , 
              MediaQuery.of(context).size.height * 0.05,
            ),      
            child: _infoColumn(context),

          ),


        ],

      ),
    );
  }

  Widget _backgroundImage(BuildContext _context){
    return Container(
          width: MediaQuery.of(_context).size.width,
          height: MediaQuery.of(_context).size.height,
          decoration: BoxDecoration(            
            color: Colors.red,
            image: DecorationImage(
              image: NetworkImage(image),
              fit: BoxFit.cover

            ),

          ),
        );
  }

  Widget _infoColumn(BuildContext _context){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _topBar(),
        SizedBox(
          height: MediaQuery.of(_context).size.height * 0.21,
        ),
        Text(
          title.split(' ').map((f){
            if (f == title.split(' ').last){
              return '\n' + f ;

            }else{
              return f + " ";

            }

          }).join(),
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 35           
          )     

        ),
        Padding(
          padding: EdgeInsets.fromLTRB(
              0 ,
              MediaQuery.of(_context).size.height * 0.01 ,
              0 , 
              MediaQuery.of(_context).size.height * 0.01,
          ),
          child: Text(
          "EA Games",
          style: TextStyle(
            fontSize: 15,
            color: Colors.red[700],
            fontWeight: FontWeight.w300
          ),
        ),
        ),
        _infoText(_context),
        Padding(
          padding: EdgeInsets.fromLTRB(
              0 ,
              MediaQuery.of(_context).size.height * 0.02 ,
              0 , 
              MediaQuery.of(_context).size.height * 0.01,
          ),
          child: Text(
          "Snapshot",
          style: TextStyle(
            fontSize: 15,
            color: Colors.white,
            fontWeight: FontWeight.w500
          ),
        ),
        ),
        _snapshot(_context, screenshots)

      ],

    );
  }

  Widget _infoText(BuildContext _context){
    String details = "This review focuses solely on the newly released Firestorm battle royale mode. To see what we thought of the single-player and multiplayer sides of Battlefield V, check out those reviews. \nBetter late than never, Battlefield V has patched in its take on the battle royale genre. Firestorm mode takes the large environments, realistic weapons, and vehicle warfare Battlefield players know and love and injects them into a beautiful map. However, what Firestorm doesn’t do is move the needle in terms of originality and innovation, and it fails to come up with hooks that keep me coming back to play.";
    return Text(
      details,
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w200,
        fontSize: 13,

      ),
      
    );

  }

  Widget _snapshot(BuildContext _context,List<String> _snapshot){

    return SizedBox(
      height: MediaQuery.of(_context).size.height * 0.156,
      width: MediaQuery.of(_context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: PageScrollPhysics(),
      itemCount: _snapshot.length,
      itemBuilder: (context,index){
        //like onClick ->> go to detail Page
        return  Padding(
          padding: EdgeInsets.only(right: 10),
          child: Container(
          width: MediaQuery.of(context).size.width * 0.45,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(_snapshot[index])
            ),
            borderRadius: BorderRadius.circular(5),
          ),

        ),

        );

      },


    ),

    );

  }

    Widget _topBar(){
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.menu,
            color: Colors.white,
            size: 25,
            ),
            Row(
              children: <Widget>[
                Icon( 
                  Icons.search,
                  color: Colors.white,
                  size: 25,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Icon(                  
                  Icons.notifications,
                  color: Colors.white,
                  size: 25,
              ),

              ),

                ],
            )

        ],
      ),

    );
  }

}