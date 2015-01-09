var renderer = "../lib/instr_renderer.scd".loadRelative[0];
var score, measures;
var proto1;
var openingMeasures;

proto1 = IdentityDictionary[
  \synth -> \bass_s1,
  \outbus -> 0,
  \amp -> 16,
  \cutOffFreq -> 400,
  \envCurve -> -2,
  \duration -> 0.5
];

measures = [
  // measure 1
  IdentityDictionary[
    \gestures -> [
      IdentityDictionary[
        \proto -> proto1,
        \startBeat -> 1,
        \pitch -> PC(\d, 3)
      ],
      IdentityDictionary[
        \proto -> proto1,
        \startBeat -> 1.5,
        \pitch -> PC(\d, 3)
      ],
      IdentityDictionary[
        \proto -> proto1,
        \startBeat -> 2.25,
        \pitch -> PC(\d, 3)
      ],

      IdentityDictionary[
        \proto -> proto1,
        \startBeat -> 3,
        \pitch -> PC(\bf, 2)
      ],
      IdentityDictionary[
        \proto -> proto1,
        \startBeat -> 3.5,
        \pitch -> PC(\bf, 2)
      ],
      IdentityDictionary[
        \proto -> proto1,
        \startBeat -> 4.25,
        \pitch -> PC(\bf, 2)
      ]
    ]
  ],
  // measure 2
  IdentityDictionary[
    \gestures -> [
      IdentityDictionary[
        \proto -> proto1,
        \startBeat -> 1,
        \pitch -> PC(\g, 2)
      ],
      IdentityDictionary[
        \proto -> proto1,
        \startBeat -> 1.5,
        \pitch -> PC(\g, 2)
      ],
      IdentityDictionary[
        \proto -> proto1,
        \startBeat -> 2.25,
        \pitch -> PC(\g, 2)
      ],

      IdentityDictionary[
        \proto -> proto1,
        \startBeat -> 3,
        \pitch -> PC(\g, 2)
      ],
      IdentityDictionary[
        \proto -> proto1,
        \startBeat -> 3.5,
        \pitch -> PC(\g, 2)
      ],
      IdentityDictionary[
        \proto -> proto1,
        \startBeat -> 4.25,
        \pitch -> PC(\g, 2)
      ]
    ]
  ]
];

score = IdentityDictionary[
  \bpm -> 100,
  \eighthNoteCount -> 8,
  \measures -> measures
];

renderer.value(score, "mits_bass");
