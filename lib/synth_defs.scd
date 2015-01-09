CtkProtoNotes[
  SynthDef(\bass_s1, {
    arg outbus, freq, amp, cutOffFreq, duration, envCurve=3;
    var control, synth, out, env, cutOffEnv;

    synth = Pulse.ar(
      freq * [1, 1.0008564, 0.998432, 2] * 0.5,
        SinOsc.kr(0.1).range(0.3, 0.7),
        [1, 0.5, 0.5, 0.125]
    ).mean + SinOsc.ar(freq / 2, 0, 0.5);

    cutOffEnv = Env([cutOffFreq, 1000], [0.1, duration - 0.1]);
    synth = MoogFF.ar(synth, EnvGen.kr(cutOffEnv), 0.25);
    synth = LeakDC.ar(synth);

    out = Compander.ar(synth, synth, -42.dbamp, 1, 1/6, 0.002, 0.02);

    env = Env([0, 1, 0], [0.05, duration - 0.05], [\sin, envCurve]);
    out = out * EnvGen.kr(env);

    Out.ar(outbus, out * amp);
  })
];
