var bpmToBeatDur, matchReservedKeys;
var addNote = "./add_note.scd".loadRelative[0];

bpmToBeatDur = { |bpm|
  60.0 / bpm;
};

matchReservedKeys = { |value, key|
  (key == \bpm)
  || (key == \eigthNoteCount)
};

{ |score, bufferDictionary, ctkScore|
  var elapsedTime = 1;

  score[\measures].do { |measure|
    var eighthsInMeasure = measure[\eighthNoteCount] ? score[\eighthNoteCount];
    var beatDur = bpmToBeatDur.value(measure[\bpm] ? score[\bpm]);

    measure.reject(matchReservedKeys).keysValuesDo { |bufferName, beatArray|
      var buffer = bufferDictionary[bufferName];

      if (buffer.isNil) { Error("No buffer found for key: " ++ bufferName).throw };

      beatArray.do { |beat|
        var args = IdentityDictionary[];
        args[\start] = (beatDur * (beat - 1)) + elapsedTime;

        addNote.value(args, buffer, ctkScore);
      };
    };

    elapsedTime = elapsedTime + ((eighthsInMeasure / 2) * beatDur);
  };
};
