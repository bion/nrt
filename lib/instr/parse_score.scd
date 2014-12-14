var addNote = "./add_note.scd".loadRelative[0];
var bpmToBeatDur;
var mergeProto;
var bussNames = [\inbus, \outbus];
var reservedKeyProcessors;
var expandGesture;
var protoProcessor, pitchProcessor;
var resolveStartTime;

bpmToBeatDur = { |bpm|
  60.0 / bpm;
};

protoProcessor = { |gesture|
  var proto = gesture[\proto];
  var withoutProto = gesture.reject({|k,v| v == \proto});

  proto.keysValues {|key, value| withoutProto[key] = value};
  withoutProto;
};

pitchProcessor = { |gesture|
  var pitchClass = gesture[\pitch];
  var withoutPitch = gesture.reject({|k,v| v == \pitch});

  gesture[\freq] = pitchClass.freq;
  gesture;
};

expandGesture = { |gesture|
  gesture.keys.do {|key|
    if (reservedKeyProcessors.keys.includes(key)) {
      gesture = reservedKeyProcessors[key].value(gesture);
    };
  };

  gesture;
};

resolveStartTime = { |gesture, elapsedTime, beatDur|
  var startBeat = gesture[\startBeat];
  var withoutPitch = gesture.reject({|k,v| v == \startBeat});

  gesture[\start] = elapsedTime + (beatDur * (startBeat - 1));
  gesture;
};

reservedKeyProcessors = IdentityDictionary[
  \proto -> protoProcessor,
  \pitch -> pitchProcessor
];

{ |score, ctkScore|

  var elapsedTime = 1;

  score[\measures].do {|measure|
    var eighthsInMeasure = measure[\eighthNoteCount] ? score[\eighthNoteCount];
    var beatDur = bpmToBeatDur.value(measure[\bpm] ? score[\bpm]);

    measure[\gestures].do { |gesture|
      var expandedGesture;
      gesture = resolveStartTime.value(gesture, elapsedTime, beatDur);
      expandedGesture = expandGesture.value(gesture);

      addNote.value(expandedGesture, ctkScore);
    };

    elapsedTime = elapsedTime + ((eighthsInMeasure / 2) * beatDur);
  };
};
