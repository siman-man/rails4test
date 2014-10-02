var TvScreen = {
  text_object: {},

  init: function(){
    canvas = document.getElementById('tvscreen');
    TvScreen.stage = new createjs.Stage(canvas);
    createjs.Ticker.setFPS(60);
    createjs.Ticker.addEventListener("tick", this.update);
  },

  add_text_object: function(obj){
    var text = new createjs.Text(obj.text, "24px Arial", "#FFF");
    text.x = 810;
    text.y = Math.random() * 150 | 0 + 30;
    text.textBaseline = "alphabetic";
    TvScreen.text_object[obj.id] = text;
    TvScreen.stage.addChild(text);
  },

  update: function(){
    $.each(TvScreen.text_object, function(key, elem){
      elem.x -= 3;

      if( elem.x < -2000 ){
        TvScreen.stage.removeChild(elem); 
        delete TvScreen.text_object[key];
      }
    });

    TvScreen.stage.update(); 
  }
}