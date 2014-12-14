var baseDir = Document.current.dir ++ "/";
var serverOptions;

serverOptions = ServerOptions()
  .memSize_(2**18)
  .numOutputBusChannels_(2)
  .maxNodes_(2**12);

{|score, path|
  path = "../renders/" ++ path ++ ".aiff";

  if (path[0] != "/") {
    path = baseDir ++ path;
  };

  score.write(
    path: path,
    sampleRate: 44100,
    sampleFormat: \float,
    options: serverOptions
  );
};
