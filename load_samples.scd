{ |drumBufferDirs, buffersDictionary, ctkScore|
  drumBufferDirs.do { |dir|
    var bufferPathsInDir = (dir ++ "*.aiff").pathMatch;

    bufferPathsInDir.do { |bufferPath|
      var name = bufferPath.basename.replace(".aiff", "").asSymbol;

      buffersDictionary.put(name, CtkBuffer(bufferPath).addTo(ctkScore));
    };
  };
};
