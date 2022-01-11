import 'package:flutter/material.dart';
import 'package:peliculas_flutter/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final String movie = ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie';

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(),
          SliverList(
            delegate: SliverChildListDelegate([
              _PosterAndTitle(),
              _Overview(),
              _Overview(),
              CastingCards()
            ])
          )
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          padding: EdgeInsets.only(bottom: 5),
          color: Colors.black12,
          child: Text('movie.title', style: TextStyle(fontSize: 16),),
        ),
        background: FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage('https://via.placeholder.com/500x300'),
          fit: BoxFit.cover
        ),
      ),

    );
  }
}

class _PosterAndTitle extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final textTheme =  Theme.of(context).textTheme;

    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: FadeInImage(
            placeholder: AssetImage('assets/loading.gif'),
            image: NetworkImage('https://via.placeholder.com/200x300'),
            height: 125,
          )
        ),

        SizedBox(width: 20),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text('movie.title', style: textTheme.headline5, overflow:TextOverflow.ellipsis , maxLines: 2,),
          Text('movie.originalTitle', style: textTheme.subtitle1, overflow:TextOverflow.ellipsis , maxLines: 1,),

          Row(children: [
            Icon(Icons.star_outlined, size: 15, color: Colors.yellow,),
            SizedBox(width: 5,),
            Text('movie.voteAverage', style: textTheme.caption)
          ],)
        ],)
      ],),
    );
  }
}

class _Overview extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text('Velit ipsum labore ullamco laboris eiusmod commodo sint. Aute nisi cupidatat velit excepteur non est elit deserunt. Cillum ad id do sunt duis enim anim fugiat laboris id amet commodo culpa. Laborum Lorem non ex sunt occaecat adipisicing non exercitation qui velit cupidatat ipsum. Sit aliquip in reprehenderit nostrud cillum cillum consectetur veniam eiusmod adipisicing ut. Commodo eu do cillum nostrud incididunt duis dolore id aliquip laborum ut. In reprehenderit proident fugiat enim eiusmod id pariatur fugiat elit quis Lorem.', textAlign: TextAlign.justify, style: Theme.of(context).textTheme.subtitle1 ,)
    );
  }
}