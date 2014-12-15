var parseScore = "./instr/parse_score.scd".loadRelative[0];
var renderScore = "./render_score.scd".loadRelative[0];
var ctkScore = CtkScore.new;

{ |scoreFile, outputPath|

  parseScore.value(scoreFile, ctkScore);
  renderScore.value(ctkScore, outputPath);
};
