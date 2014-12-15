var addNote = "./add_note.scd".loadRelative[0];
var bpmToBeatDur;
var mergeProto;
var bussNames = [\inbus, \outbus];
var reservedKeyProcessors;
var expandGesture;
var protoProcessor, pitchProcessor;
var resolveStartTime;
var resolveDuration;

bpmToBeatDur = { |bpm|
  60.0 / bpm;
};

protoProcessor = { |gesture|
  var proto = gesture[\proto];
  var withoutProto = gesture.reject({|k,v| v == \proto});

  proto.keysValuesDo {|key, value| withoutProto[key] = value};
  withoutProto;
};

pitchProcessor = { |gesture|
  var pitchClass = gesture[\pitch];
  var withoutPitch = gesture.reject({|k,v| v == \pitch});

  withoutPitch[\freq] = pitchClass.freq;
  withoutPitch;
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
  var withoutStartBeat = gesture.reject({|k,v| v == \startBeat});

  withoutStartBeat[\start] = elapsedTime + (beatDur * (startBeat - 1));
  withoutStartBeat;
};

resolveDuration = { |gesture, beatDur|
  var logicalDuration = gesture[\duration];
  var withoutDuration = gesture.reject({|k,v| v == \duration});

  withoutDuration[\duration] = logicalDuration * beatDur;
  withoutDuration;
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
      var expandedGesture = expandGesture.value(gesture);

      expandedGesture = resolveStartTime.value(expandedGesture, elapsedTime, beatDur);
      expandedGesture = resolveDuration.value(expandedGesture, beatDur);

      addNote.value(expandedGesture, ctkScore);
    };

    elapsedTime = elapsedTime + ((eighthsInMeasure / 2) * beatDur);
  };
};
