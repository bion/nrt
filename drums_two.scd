var renderer = "./nrt_sample_renderer.scd".loadRelative[0];
var score, measures = [
  8.collect {
    IdentityDictionary[
      \snick_1 -> Array.series(16, 1, 0.25),
      \thickhat -> Array.series(4, 1, 1),
      \Kick3 -> [1, 2, 4],
      \thick_kick -> [0.5, 0.75, 1.5, 1.75, 2.5, 3.75],
      \rimshot_1 -> [2.75],
      \ClapSnap -> [3.25],
      \Snap1 -> Array.series(8, 1, 0.5)
    ]
  }
].flat;

score = IdentityDictionary[
  \bpm -> 120,
  \eighthNoteCount -> 8,
  \measures -> measures
];

renderer.value(score, "drums_two");
