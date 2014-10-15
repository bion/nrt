{ |drumSampleDirs, samplesDictionary, ctkScore|
  drumSampleDirs.do { |dir|
    var samplePathsInDir = (dir ++ "*.aiff").pathMatch;

    samplePathsInDir.do { |samplePath|
      var name = samplePath.basename.replace(".aiff", "").asSymbol;

      samplesDictionary.put(name, Sample(samplePath, ctkScore));
    };
  };
};
