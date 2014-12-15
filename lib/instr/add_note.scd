var defs = "../synth_defs.scd".loadRelative[0];
var resolveDefFromGesture;
var createNote;

resolveDefFromGesture = { |gesture|
  var synth = gesture[\synth];

  if (defs.dict.keys.includes(synth).not) {
    "****************************************************************".postln;
    gesture.postln;
    Error.new("Synth '" ++ synth ++ "' not found in above gesture.").throw;
  };

  defs[synth];
};

createNote = { |gesture, def|
  var defArgs = def.args.keys;
  var note = def.note(gesture[\start], gesture[\duration]);
  var argsOnlyGesture = gesture.reject({|k,v| [\start, \synth].includes(v)});

  argsOnlyGesture.keysValuesDo { |key, value|
    var assignmentMethodName = (key ++ "_").asSymbol;

    if (defArgs.includes(key).not) {
      var message;
      "****************************************************************".postln;
      gesture.postln;
      message = "SynthDef " ++ def.synthdefname ++ " has no arg '" ++ key;
      message = message ++ "' see complete gesture above.";
      Error.new(message).throw;
    };

    note.perform(assignmentMethodName, value);
  };

  note;
};

{ |gesture, ctkScore|
  var def = resolveDefFromGesture.value(gesture);
  var note = createNote.value(gesture, def);

  ctkScore.add(note);
};
