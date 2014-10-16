var def, checkSpec, applySpec;

def = CtkNoteObject(
  SynthDef(\playBuffer, {
    |amp, rate, buf, outbus|
    var sig;
    sig = PlayBuf.ar(1, buf, BufRateScale.ir(buf) * rate);
    Out.ar(outbus, sig * amp);
  })
);

checkSpec = { |arguments|
  arguments.do { |anArgument|
    if (anArgument.isNil) {
      var message = "Nil arg passed to addNote: " ++ arguments;
      Error(message).throw;
    }
  };
};

applySpec = { |note, args|
  args
    .reject({ |val, key| key == \start })
    .keysValuesDo({ |key, val|
      var method = asSymbol(key ++ "_");
      note.perform(method, val);
    })
};

{ |noteSpec, buffer, score|
  var start, note, rate, outbus;
  start = noteSpec[\start];
  rate = noteSpec[\rate] ? 1;
  outbus = noteSpec[\outbus] ? 0;

  checkSpec.value([start, def, outbus, buffer.duration, rate, score]);

  note = def.note(start, buffer.duration * rate)
    .rate_(rate)
    .buf_(buffer)
    .outbus_(outbus)
    .amp_(1);

  note.addTo(score);
};
