var drumSampleDirs = "../frankendank/samples/drum/*".resolveRelative.pathMatch;
var ctkScore = CtkScore.new;
var samplesDictionary = IdentityDictionary[];
var scoreFile = "./score_file.scd".loadRelative[0];
var parseScore = "./parse_score.scd".loadRelative[0];
var loadSamples = "./load_samples.scd".loadRelative[0];

loadSamples.value(drumSampleDirs, samplesDictionary, ctkScore);
parseScore.value(scoreFile, samplesDictionary);

renderScore.value(score, "render");