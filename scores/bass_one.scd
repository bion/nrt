var renderer = "../lib/instr_renderer.scd".loadRelative[0];
var score, measures;
var proto1;
var openingMeasures;

proto1 = IdentityDictionary[
  \synth -> \bass_s1,
  \outbus -> 0,
  \cutOffFreq -> 1000,
  \duration -> 1
];

openingMeasures = 4.collect {
  IdentityDictionary[
    \gestures -> [
      IdentityDictionary[
        \proto -> proto1,
        \startBeat -> 5,
        \pitch -> PC(\a, 2)
      ],

      IdentityDictionary[
        \proto -> proto1,
        \startBeat -> 6,
        \pitch -> PC(\b, 2)
      ]
    ]
  ]
};

measures =
openingMeasures
++ [

];

score = IdentityDictionary[
  \bpm -> 120,
  \eighthNoteCount -> 8,
  \measures -> measures
];

renderer.value(score, "bass_one");
