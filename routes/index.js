
/*
 * GET home page.
 */

exports.index = function(req, res){
  res.render('index');
};

exports.gif = function(req, res){
  res.render('gif');
};

exports.loop = function(req, res){
  res.render('loop');
};
