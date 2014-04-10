(function($){
  $.extend($.fn, {
    serializeJson: function(){
      var serializeObj={};  
            var array=this.serializeArray();  
            var str=this.serialize();  
            $(array).each(function(){  
                if(serializeObj[this.name.toLowerCase()]){  
                    if($.isArray(serializeObj[this.name.toLowerCase()])){  
                        serializeObj[this.name.toLowerCase()].push(this.value==""?null:this.value);  
                   }else{  
                        serializeObj[this.name.toLowerCase()]=[serializeObj[this.name.toLowerCase()],this.value==""?null:this.value];  
                    }  
                }else{  
                    serializeObj[this.name.toLowerCase()]=(this.value==""?null:this.value);   
                }  
            });  
            return serializeObj; 
    }
  })
})(Zepto)