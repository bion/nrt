CtkProtoNotes[
  SynthDef(\bass_s1, {
    arg bus, pitch, amp, cutOffFreq, duration;
    var control, synth, out;
    // this needs sorted out
    // one strategy may be to read from buffers at a rate
    // that will always read the entire buffer by the end of
    // the duration. this would allow infinite break points

    synth = Pulse.ar(
        pitch * [1, 1.0008564, 0.998432, 2] * 0.5,
        SinOsc.kr(0.1).range(0.3, 0.7),
        [1, 0.5, 0.5, 0.125]
      ).mean;

    synth = MoogFF.ar(synth, cutOffFreq, 0.25);
    synth = LeakDC.ar(synth);

    out = Compander.ar(synth, synth, -42.dbamp, 1, 1/6, 0.002, 0.02);

    out = out * env;

    Out.ar(bus, out * amp);
  })
];
