var renderer = "./nrt_sample_renderer.scd".loadRelative[0];
var score, measures = [
  8.collect {
    IdentityDictionary[
      \snick_1 -> Array.series(14, 1, 0.25),
      \Kick3 -> [1, 3],
      \thick_kick -> [0.5, 0.75, 1.5, 1.75, 2.75, 3],
      \rimshot_1 -> [1.75, 3.5],
      \Clap1 -> [2.25],
      \Snap1 -> Array.series(7, 1, 0.5)
    ]
  }
].flat;

score = IdentityDictionary[
  \bpm -> 110,
  \eighthNoteCount -> 7,
  \measures -> measures
];

renderer.value(score, "drums_two");
