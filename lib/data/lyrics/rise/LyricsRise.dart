import 'package:flutter/material.dart';
import 'package:izoneapp/data/Song.dart';

class LyricsRise implements Song {
  final BuildContext context;

  LyricsRise(this.context);

  @override
  Duration get length => Duration(minutes: 3, seconds: 12);

  @override
  Map<String, List<String>> get lyrics => {
        "eng": [
          "We're gonna ri—, ri—, ri—, ri—, rise 'til we fall.",
          "They say we got no, no, no, no future at all.",
          "They wanna ke—, ke—, keep us out. Can't hold us down anymore.",
          "We're gonna ri—, ri—, ri—, ri—, rise 'til we fall.",
          "",
          "When we hit the bottom,",
          "Nothin' gon' stop us.",
          "Climb to the top with you.",
          "We could be the greatest,",
          "Ones who never made it.",
          "Yeah, I could be talking to you.",
          "",
          "They tryna hate, hate, hate,",
          "But we won't change, change anything at all.",
          "We're gonna ri—, ri—, ri—, ri—, rise 'til we fall.",
          "",
          "They think we're just drop-outs",
          "Living at our mom's house.",
          "Parents must be so proud.",
          "They know it all.",
          "",
          "No, they don't speak our language.",
          "They say we're too savage.",
          "No, no. We don't give a—anymore.",
          "",
          "We're gonna ri—, ri—, ri—, ri—, rise 'til we fall.",
          "We're gonna ri—, ri—, ri—, ri—, rise 'til we fall.",
          "",
          "No, they don't speak our language.",
          "They say we're too savage,",
          "No, no. We don't give a—anymore.",
          "",
          "We're gonna ri—, ri—, ri—, ri—, rise.",
          "We're gonna ri—, ri—, ri—, ri—, rise.",
          "We're gonna ri—, ri—, ri—, ri—, rise.",
          "We're gonna ri—, ri—, ri—, ri—, rise 'til we fall.",
          "",
          "Say we're going no—, no—, no—, no—, no—, no—, nowhere,",
          "But what they don't know, know, know is we don't don't care.",
          "",
          "We're gon' keepin' on, keepin' on going til' we can't go no more.",
          "We're gonna ri—, ri—, ri—, ri—, rise 'til we fall.",
          "",
          "When we hit the bottom,",
          "Nothin' gon' stop us.",
          "Climb to the top with you.",
          "We could be the greatest,",
          "Ones who never made it.",
          "Yeah, I could be talking to you.",
          "",
          "They tryna hate, hate, hate,",
          "But we won't change, change anything at all.",
          "We're gonna ri—, ri—, ri—, ri—, rise 'til we fall.",
          "",
          "They think we're just drop-outs",
          "Living at our mom's house.",
          "Parents must be so proud.",
          "They know it all.",
          "",
          "No, they don't speak our language.",
          "They say we're too savage,",
          "No, no. We don't give a—anymore.",
          "",
          "We're gonna ri—, ri—, ri—, ri—, rise 'til we fall.",
          "We're gonna ri—, ri—, ri—, ri—, rise 'til we fall.",
          "",
          "No, they don't speak our language.",
          "They say we're too savage,",
          "No, no. We don't give a—anymore.",
          "",
          "We're gonna ri—, ri—, ri—, ri—, rise.",
          "We're gonna ri—, ri—, ri—, ri—, rise.",
          "We're gonna ri—, ri—, ri—, ri—, rise.",
          "We're gonna ri—, ri—, ri—, ri—, rise 'til we fall.",
        ]
      };

  @override
  String get title => 'Rise';
}
