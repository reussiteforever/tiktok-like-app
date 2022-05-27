import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

//LINK FOR READING YOUTUBE LINKS
//https://www.youtube.com/watch?v=7IG5kRFIMZw
//https://github.com/sarbagyastha/youtube_player_flutter/tree/master/packages/youtube_player_flutter/example

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //Videoplayer controller
  VideoPlayerController _controller = VideoPlayerController.network('');
  //pageview controller
  final controller = PageController();

  //Youtubeview controller
  late YoutubePlayerController _ycontroller;

  //List of youtube video Id
  dynamic listIds = ['uuZE_IRwLNI', '2psEtVb9zLM', 'U1th94xR694'];

  static const imgUrl =
      "https://media-exp1.licdn.com/dms/image/C4E03AQHLNbPqnWBhRg/profile-displayphoto-shrink_400_400/0/1652783151281?e=1658966400&v=beta&t=7mdMrGQg_Z8URzIijiEeyCQPrdLHPSPQCr-K8LcJj_8";
  controllerInit(String videoId) {
    return _ycontroller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
      ),
    );
  }

  @override
  void initState() {
    controllerInit('uuZE_IRwLNI');
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
          PageView(
            scrollDirection: Axis.vertical,
            controller: controller,
            children: [
              youtubePlayer('uuZE_IRwLNI',_ycontroller, size),
              youtubePlayer('2psEtVb9zLM',_ycontroller, size),
              youtubePlayer('U1th94xR694',_ycontroller, size),
              Container(
                color: Colors.black,
              )
            ],
          ),
          Positioned(
            bottom: 20,
            right: 0,
            child: Column(
              children: [
                lateralIcon(Icons.thumb_up),
                lateralIcon(Icons.thumb_down),
                lateralIcon(Icons.message),
                lateralIcon(Icons.shortcut),
                lateralIcon(Icons.horizontal_rule_sharp),
                lateralIcon(Icons.person),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            left: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("For a dollar, who's the worst artist to exist ?", style: TextStyle(color: Colors.white),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const CircleAvatar(
                      backgroundImage: NetworkImage(imgUrl),
                    ),
                    const Text("Abdel-Khafid", style: TextStyle(color: Colors.white),),
                    ElevatedButton(
                      style: ButtonStyle(backgroundColor: MaterialStateColor.resolveWith((states) => Colors.red)),
                      onPressed: () {
                        // Respond to button press
                      },
                      child: const Text('S\'ABONNER'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ]),
      ),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.white,
        unselectedItemColor: Colors.white,
        items: [
          bottomItem(Icons.home, ''),
          bottomItem(Icons.share, 'Shorts'),
          bottomItem(Icons.add_rounded, ''),
          bottomItem(Icons.browse_gallery, 'Abonnements'),
          bottomItem(Icons.playlist_play_sharp, 'Bibliothèques'),
        ],
        onTap: (value) {},
      ),
    );
  }

  Widget youtubePlayer(String videoId, YoutubePlayerController controller, Size size) {
    YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
      ),
    );
    return YoutubePlayer(
      controller: controller
        ..fitWidth(size)
        ..fitHeight(size)
        ..play()
        ..setSize(size),
      onReady: () {
        print('Player is ready.');
      },
    );
  }

  BottomNavigationBarItem bottomItem(IconData icondata, String label) {
    return BottomNavigationBarItem(icon: Icon(icondata), label: label, backgroundColor: Colors.black);
  }

  Widget lateralIcon(IconData iconData) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0, top: 10, right: 20),
      child: Icon(
        iconData,
        color: Colors.white,
        size: 32,
      ),
    );
  }
}
