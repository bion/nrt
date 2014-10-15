var bpmToBeatDur;

bpmToBeatDur = { |bpm|
  60.0 / bpm;
};

matchReservedKeys = { |value, key|
  (key == \bpm)
  || (key == \eigthNoteCount)
};

{ |score, samples|
  var elapsedTime = 1;

  score.measures.do { |measure|
    var eighthsInMeasure = measure.eightNoteCount ? score.eightNoteCount;
    var beatDur = bpmToBeatDur.(measure.bpm ? score.bpm);

    measure.reject(matchReservedKeys).keysValuesDo { |sampleName, beatArray|
      var sample = samples[sampleName];

      beatArray.do { |beat|
        var args = ();
        args.start = (beat - 1) + elapsedTime;

        sample.play(args)
      };
    };

    elapsedTime = elapsedTime + (eighthsInMeasure * (beatDur / 2));
  };
};
