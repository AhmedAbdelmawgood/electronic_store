// $(function(){alert("hello")})
$(document).on('turbolinks:load',function(){ 
var click = false;
var slider ={
  elements:$(".slide"),
  show:function(elem){
    elem.add( elem.children() ).show(0).animate({width:"100%"},700);
    elem.find(".box-opacity").add( elem.find("span") ).delay(200).animate({height:110},400);
  },
  hide:function(elem){
    elem.add( elem.children() ).show().animate({width:"0"},600);
    console.log(this.elements);
    elem.find(".box-opacity").add( elem.find("span") ).animate({height:0},{duration:700,queue:false})
    elem.hide(0)
  },
  forward:function(){
    if (this.notAnimating()){

      this.hide( this.elements.eq(this.current) );
      this.current += 1
      if (this.current > this.elements.length-1){
        this.current = 0
      }
      this.show(this.elements.eq(this.current));   
    }
  },
  notAnimating:function(){
    return (! this.elements.is(':animated'))  ;
  },
  backward:function(){
    if (this.notAnimating()){
      this.hide( this.elements.eq(this.current) );
      this.current -= 1
      if (this.current > 0){
        this.current = this.elements.length-1
      }
      this.show(this.elements.eq(this.current));
    }
  },
  current:0

}
var sliderAuto = function(){slider.forward()}
sliderAuto()
$(setInterval(sliderAuto,3000)
)
$(document).on( 'click',".forward",function(){slider.forward()} );
$(document).on('click',".backward",function(){slider.backward()} ) ;
})

