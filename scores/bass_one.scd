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

openingMeasures = 4.collect {
  IdentityDictionary[
    \gestures -> [
      IdentityDictionary[
        \proto -> proto1,
        \startBeat -> 2.5,
        \pitch -> PC(\a, 2)
      ],

      IdentityDictionary[
        \proto -> proto1,
        \startBeat -> 3,
        \pitch -> PC(\e, 3)
      ]
    ]
  ]
};

measures =
openingMeasures
++ [

];

score = IdentityDictionary[
  \bpm -> 110,
  \eighthNoteCount -> 7,
  \measures -> measures
];

renderer.value(score, "bass_one");
