var renderer = "../lib/nrt_sample_renderer.scd".loadRelative[0];
var score, measures = [
  128.collect {
    IdentityDictionary[
      \Kick4 -> [3],
      \fuzzsnare -> [1.5, 3],
      \kick_boom1 -> [1],
      \warmkick -> [1 - 0.25, 1, 2, 3, 4],
      \Hat3 -> [1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5],
      \TightHat -> Array.series(16, 1, 0.25)
    ]
  }
].flatten;

score = IdentityDictionary[
  \bpm -> 120,
  \eighthNoteCount -> 8,
  \measures -> measures
];

renderer.value(score, "drums_one");
