NrtSample {
  classvar <def;
  var <path, score, <buffer, def;

  *initClass {
    def = CtkNoteObject(
      SynthDef(\playSample, {
        |amp, rate, buf, outbus|
        var sig;
        sig = PlayBuf.ar(1, buf, BufRateScale.ir(buf) * rate);
        Out.ar(outbus, sig * amp);
      })
    );
  }

  *new { |path, score|
    ^super.newCopyArgs(path, score).init;
  }

  init {
    buffer = CtkBuffer(path, score);
    buffer.addTo(score);
    ^this;
  }

  play { |args|
    var note = this.class.def.note(args.start, buffer.duration * args.rate);
    this.applyArgs(note, args);
    note.addTo(score);
    ^this;
  }

  applyArgs { |note, args|
    args
      .reject({ |val, key| key == \start })
      .keysValuesDo({ |key, val|
        var method = asSymbol(key ++ "_");
        note.perform(method, val);
      })
  }
}
