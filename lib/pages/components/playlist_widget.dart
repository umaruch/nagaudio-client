import 'package:flutter/material.dart';

import 'package:nagaudio/pages/widgets/track_menu.dart';
import 'package:nagaudio/models/song.dart';


class TracksView extends StatelessWidget {
  final List<Song> songs;
  final int currentSongPos;

  TracksView(this.songs, this.currentSongPos);

  Widget build(BuildContext context) { 
    return Expanded(
      child: ReorderableListView.builder(
        itemBuilder: (BuildContext context, int index){
          return ListTile(

            key: ValueKey(songs[index].id),
            title: Text(
              songs[index].title,
              style: currentSongPos==index?
                TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                  color: Colors.green
                ):
                Theme.of(context).textTheme.headline2
            ),
            subtitle: Text(
              songs[index].artist, 
              style: Theme.of(context).textTheme.subtitle1,
            ),
            trailing: IconButton(
              icon: Icon(
                Icons.more_vert,
                color: Colors.grey,
              ),
              onPressed: (){
                TrackMenuWidget(songs[index]).show(context);
              }
            ),
          );
        },
        itemCount: songs.length, 
        onReorder: (oldIndex, newIndex){
        }
      ),
    );
  }
}