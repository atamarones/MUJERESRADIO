import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:prueba_auth/screens/profile_screen/components/video_player_screen.dart';

import '../../../constants.dart';
import '../../../model/channel_info.dart';
import '../../../model/viideos_list.dart';
import '../../../services/services.dart';

class BuildListVideo extends StatefulWidget {
  const BuildListVideo({Key? key}) : super(key: key);

  @override
  _BuildListVideoState createState() => _BuildListVideoState();
}

class _BuildListVideoState extends State<BuildListVideo> {
  //
  ChannelInfo? _channelInfo;
  VideosList? _videosList;
  Item? _item;
  bool? _loading;
  String? _playListId;
  String? _nextPageToken;
  ScrollController? _scrollController;

  @override
  void initState() {
    super.initState();
    _loading = true;
    _nextPageToken = '';
    _scrollController = ScrollController();
    _videosList = VideosList(videos: []);
    _videosList?.videos = [];
    _getChannelInfo();
  }

  _getChannelInfo() async {
    _channelInfo = await Services.getChannelInfo();
    _item = _channelInfo?.items![0];
    _playListId = _item?.contentDetails?.relatedPlaylists?.uploads;
    print('_playListId $_playListId');
    await _loadVideos();
    setState(() {
      _loading = false;
    });
  }

  _loadVideos() async {
    VideosList tempVideosList = await Services.getVideosList(
      playListId: 'PL1SAh140OrrNXAwt5SYALEE-VS458dAWY',
      //_playListId.toString(),
      pageToken: _nextPageToken.toString(),
    );
    _nextPageToken = tempVideosList.nextPageToken;
    _videosList?.videos.addAll(tempVideosList.videos);
    print('videos: ${_videosList?.videos.length}');
    print('_nextPageToken $_nextPageToken');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: NotificationListener<ScrollEndNotification>(
        onNotification: (ScrollNotification notification) {
          if (_videosList!.videos.length >=
              int.parse(_item?.statistics?.videoCount ?? '')) {
            return true;
          }
          if (notification.metrics.pixels ==
              notification.metrics.maxScrollExtent) {
            _loadVideos();
          }
          return true;
        },
        child: ListView.builder(
          controller: _scrollController,
          itemCount: _videosList!.videos.length,
          itemBuilder: (context, index) {
            VideoItem videoItem = _videosList!.videos[index];
            return InkWell(
              onTap: () async {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return VideoPlayerScreen(
                    videoItem: videoItem,
                  );
                }));
              },
              child: Container(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl:
                          videoItem.video?.thumbnails?.thumbnailsDefault?.url ??
                              '',
                    ),
                    const SizedBox(width: 20),
                    Flexible(child: Text(videoItem.video?.title ?? '', style: kTextNormal10BlackStyle,)),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
