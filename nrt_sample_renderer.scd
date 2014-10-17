var loadSamples = "./load_samples.scd".loadRelative[0];
var parseScore = "./parse_score.scd".loadRelative[0];
var renderScore = "./render_score.scd".loadRelative[0];

var ctkScore = CtkScore.new;
var samplesDictionary = IdentityDictionary[];
var drumSampleDirs = "../frankendank/samples/drum/*".resolveRelative.pathMatch;

{ |scoreFile, outputPath|

  loadSamples.value(drumSampleDirs, samplesDictionary, ctkScore);
  parseScore.value(scoreFile, samplesDictionary, ctkScore);

  renderScore.value(ctkScore, outputPath);
};
