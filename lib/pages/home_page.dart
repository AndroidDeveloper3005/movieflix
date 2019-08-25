import 'package:flutter/material.dart';
import 'package:movieflix/pages/detail_pages.dart';
import '../data.dart';
import '../widgets/gradient_background.dart';

class HomePage extends  StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.height * 0.50
            
            ),
            child :_imageScrollBackground(),
            
        
    
          ),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.35
            ),
            child: gradientBackground(Colors.transparent , Color.fromRGBO(35, 45, 59, 1)),

          ),

          Padding(
            padding: EdgeInsets.fromLTRB(          
              MediaQuery.of(context).size.width * 0.025 ,
              MediaQuery.of(context).size.height * 0.05 ,
              MediaQuery.of(context).size.width * 0.025 , 
              MediaQuery.of(context).size.height * 0.01,
            ),
            child: _infoColumn(context),
          )

        
          

        ],

      ),
    );
  }

  Widget _imageScrollBackground(){
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      physics: PageScrollPhysics(),
      itemCount: featuredGames.length,
      itemBuilder: (context,index){
        return Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(            
            color: Colors.red,
            image: DecorationImage(
              image: NetworkImage(featuredGames[index].imageURL),
              fit: BoxFit.cover

            ),

          ),
        );
      } ,

    );
  }

  Widget _infoColumn(BuildContext _context){ 
    return Column(children: <Widget>[
      _topBar(),
      SizedBox(
        height: MediaQuery.of(_context).size.height * 0.24,
      ),
      Text(

        'Assasin\'s Creed Odyssey' , 
      style: TextStyle(
        color: Colors.white,
        fontSize: 34,
        fontWeight: FontWeight.w500,
        ) ,
      
      ),
      SizedBox(
        height: MediaQuery.of(_context).size.height * 0.02,
      ),

      _movielist(_context, games),
      Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(_context).size.height * 0.02,
          bottom:  MediaQuery.of(_context).size.height * 0.02, 
        ),
        child: _movieBanner(_context),

      ),
      _movielist(_context, games_2)


    ],);
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

  Widget _movielist(BuildContext _context,List<GameData> _games){
    return SizedBox(
      height: MediaQuery.of(_context).size.height * 0.17,
      width: MediaQuery.of(_context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
      itemCount: _games.length,
      itemBuilder: (context,index){
        //like onClick ->> go to detail Page
        return GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return  DetailPage(_games[index].name, _games[index].imageURL);
            }));
          },

          child: Padding(
          padding: EdgeInsets.only(right: 10),
          child: Container(
          width: MediaQuery.of(context).size.width * 0.30,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(_games[index].imageURL)
            ),
            borderRadius: BorderRadius.circular(5),
          ),

        ),

        ),

      

        );

      },


    ),

    );
  }

  Widget _movieBanner(BuildContext _context){
    return Container(
      height: MediaQuery.of(_context).size.height * 0.12 ,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            'https://www.pcgamesn.com/wp-content/uploads/2018/07/Upcoming-PC-games-Total-War-Three-Kingdoms-900x507.jpg')
          ),
          borderRadius: BorderRadius.circular(5),
      ),
    );

  }


}