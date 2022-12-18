import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import '../../../constants.dart';

class MyBottomNavigationBar extends StatelessWidget {
  final _player = AudioPlayer();
  MyBottomNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      margin: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
      padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
      color: Colors.transparent.withOpacity(0.0),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(50.0),
            bottomLeft: Radius.zero,
            topRight: Radius.circular(50.0),
            bottomRight: Radius.zero),
        child: Container(
            padding: const EdgeInsets.only(
                left: 10.0, top: 0.0, right: 0.0, bottom: 0.0),
            color: Colors.black87.withOpacity(0.9),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: StreamBuilder<SequenceState?>(
                        stream: _player.sequenceStateStream,
                        builder: (context, snapshot) {
                          final state = snapshot.data;
                          if (state?.sequence.isEmpty ?? true) {
                            return const SizedBox();
                          }
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                          );
                        },
                      ),
                    ),
                    ControlButtons(_player),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Estas escuchando ♪',
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: background_color),
                    ),
                    Text(
                      'Mujeres Radio Net',
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}

/// Displays the play/pause button and volume/speed sliders.
class ControlButtons extends StatefulWidget {
  final AudioPlayer player;

  const ControlButtons(this.player, {Key? key}) : super(key: key);

  @override
  State<ControlButtons> createState() => _ControlButtonsState();
}

class _ControlButtonsState extends State<ControlButtons> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        /// This StreamBuilder rebuilds whenever the player state changes, which
        /// includes the playing/paused state and also the
        /// loading/buffering/ready state. Depending on the state we show the
        /// appropriate button or loading indicator.
        StreamBuilder<PlayerState>(
          stream: widget.player.playerStateStream,
          builder: (context, snapshot) {
            final playerState = snapshot.data;
            final processingState = playerState?.processingState;
            final playing = playerState?.playing;
            if (processingState == ProcessingState.loading ||
                processingState == ProcessingState.buffering) {
              return Container(
                margin: const EdgeInsets.all(8.0),
                child: const CircularProgressIndicator(),
              );
            } else if (playing != true) {
              return IconButton(
                icon: const Icon(Icons.play_circle),
                iconSize: 45.0,
                color: Colors.white,
                onPressed: widget.player.play,
              );
            } else if (processingState != ProcessingState.completed) {
              return SizedBox(
                child: IconButton(
                  icon: const Icon(Icons.pause),
                  iconSize: 54.0,
                  color: Colors.white,
                  onPressed: widget.player.pause,
                ),
              );
            } else {
              return IconButton(
                icon: const Icon(Icons.replay),
                iconSize: 64.0,
                onPressed: () => widget.player.seek(Duration.zero),
              );
            }
          },
        ),
      ],
    );
  }
}
