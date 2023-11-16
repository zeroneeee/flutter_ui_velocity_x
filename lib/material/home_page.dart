import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

Color greenTouch = Vx.hexToColor("#788154");

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Vx.hexToColor("#e8eddb"),
      body: SafeArea(
        child: Column(
          children: [
            // Calender View
            const CalenderView().p24().h(context.percentHeight *
                (Vx.isAndroid || defaultTargetPlatform == TargetPlatform.iOS
                    ? 30
                    : 33)),
            //(Vx.isWeb ? 33 : 30)
            // Music Player View
            const MusicPlayerView().p24(),

            // Chat View
            const ChatView().p24(),
          ],
        ).scrollVertical(),
      ),
      // Botton Bar View
      bottomNavigationBar: const BottomBar(),
    );
  }
}

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        "https://avatars.githubusercontent.com/u/108087434?v=4"
            .circularNetworkImage(radius: 32),
        10.widthBox,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("VelocityX").text.bold.make(),
            const Text("chek this out!").text.caption(context).make(),
          ],
        ).box.p16.roundedLg.color(Vx.hexToColor("#fff6db")).make()
      ],
    );
  }
}

class MusicPlayerView extends StatelessWidget {
  const MusicPlayerView({super.key});

  @override
  Widget build(BuildContext context) {
    return RoundedBox(
      child: Column(
        children: [
          VxCapsule(
            backgroundColor: Vx.hexToColor("#c4ecd4"),
            width: 120,
            height: 28,
            child: [
              const Icon(
                Icons.phone_android,
              ).scale50(),
              const Text("Phone Speaker").text.xs.make(),
            ].hStack(),
          ).objectCenterRight(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VxBox()
                  .square(90)
                  .bgImage(const DecorationImage(
                      image: NetworkImage("http://picsum.photos/500"),
                      fit: BoxFit.cover))
                  .rounded
                  .make(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Song name right here").text.semiBold.make(),
                  const Text("artist name right here").text.sm.make(),
                ],
              ).pSymmetric(h: 16, v: 12)
            ],
          ),
          Slider(
            value: 35,
            inactiveColor: Vx.black,
            activeColor: Vx.black,
            min: 0,
            max: 100,
            onChanged: (value) {},
          ),
          HStack([
            const Text("1:20").text.make(),
            const Spacer(),
            const Text("3:20").text.make()
          ]).px24(),
          const HStack([
            Icon(
              Icons.shuffle,
              size: 24,
            ),
            Spacer(),
            Icon(
              Icons.skip_previous,
              size: 24,
            ),
            Spacer(),
            Icon(
              Icons.play_arrow,
              size: 24,
            ),
            Spacer(),
            Icon(
              Icons.skip_next,
              size: 24,
            ),
            Spacer(),
            Icon(
              Icons.repeat,
              size: 24,
            ),
          ])
        ],
      ),
    ).wFull(context);
  }
}

class CalenderView extends StatelessWidget {
  const CalenderView({super.key});

  @override
  Widget build(BuildContext context) {
    return RoundedBox(
      child: Row(
        children: [
          VStack(
            [
              const Text("MAY").text.xl4.thin.tighter.make(),
              const Text("28")
                  .text
                  .xl6
                  .size(19)
                  .tightest
                  .bold
                  .color(Vx.hexToColor("#595236"))
                  .fontFamily(GoogleFonts.poppins().fontFamily!)
                  .make(),
            ],
            crossAlignment: CrossAxisAlignment.center,
          ),
          const Spacer(),
          VStack([
            VxCapsule(
              height: 30,
              width: context.percentWidth * 50,
              backgroundColor: greenTouch,
              child: const Text("Google I/O 23")
                  .text
                  .white
                  .make()
                  .px12()
                  .objectCenterLeft(),
            ),
            const Spacer(),
            VStack(
              [
                const Text("Stand up").text.semiBold.make(),
                const Text("10:00 - 10:30 AM").text.make(),
              ],
              axisSize: MainAxisSize.max,
            )
                .box
                .border(color: greenTouch, width: 3)
                .p16
                .rounded
                .width(context.percentWidth * 50)
                .make(),
            const Spacer(),
            VxCapsule(
              height: 30,
              width: context.percentWidth * 50,
              backgroundColor: Vx.yellow200,
              child: const Text("Happy Hour")
                  .text
                  .make()
                  .px12()
                  .objectCenterLeft(),
            ),
          ])
        ],
      ),
    );
  }
}

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RoundedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FloatingActionButton(
              onPressed: () {},
              backgroundColor: greenTouch,
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
            const GreenIcon(
              icon: Icons.mic,
            ),
            const GreenIcon(
              icon: Icons.bookmark_outlined,
            ),
            const GreenIcon(
              icon: Icons.calendar_today,
            ),
            const GreenIcon(
              icon: Icons.brush,
            ),
          ],
        ),
      ).p24(),
    );
  }
}

class GreenIcon extends StatelessWidget {
  const GreenIcon({super.key, required this.icon});
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      color: greenTouch,
    );
  }
}

class RoundedBox extends StatelessWidget {
  const RoundedBox({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return VxBox(child: child)
        .color(Vx.hexToColor("fff6db"))
        .roundedLg
        .p24
        .make();
  }
}
