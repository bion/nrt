var renderer = "./nrt_sample_renderer.scd".loadRelative[0];
var score, measures = [
  // IdentityDictionary[
  //   \Kick4 -> [2, 4],
  //   \BigKick1 -> [1 - 0.125, 1, 3],
  //   \thickhat -> [1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5],
  //   \snick_1 -> [1.25, 1.75, 2.25, 2.75, 3.25, 3.75, 4.25, 4.75],
  //   \TightHat -> Array.series(32, 1, 0.125)
  // ],
  IdentityDictionary[
    \Kick4 -> [3],
    \kick_boom1 -> [1],
    \warmkick -> [1 - 0.25, 1, 2, 3, 4],
    \Hat3 -> [1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5],
    \TightHat -> Array.series(16, 1, 0.25)
  ],
  IdentityDictionary[
    \Kick4 -> [3],
    \kick_boom1 -> [1],
    \warmkick -> [1 - 0.25, 1, 2, 3, 4],
    \Hat3 -> [1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5],
    \TightHat -> Array.series(16, 1, 0.25)
  ],
  IdentityDictionary[
    \Kick4 -> [3],
    \kick_boom1 -> [1],
    \warmkick -> [1 - 0.25, 1, 2, 3, 4],
    \Hat3 -> [1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5],
    \TightHat -> Array.series(16, 1, 0.25)
  ],
  IdentityDictionary[
    \Kick4 -> [3],
    \kick_boom1 -> [1],
    \warmkick -> [1 - 0.25, 1, 2, 3, 4],
    \Hat3 -> [1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5],
    \TightHat -> Array.series(16, 1, 0.25)
  ],
].flatten;

score = IdentityDictionary[
  \bpm -> 120,
  \eighthNoteCount -> 8,
  \measures -> measures
];

renderer.value(score, "drums_one");