console.log("all loaded!!")

$(document).ready(function() {

  var sum = 0;
  $('.price').each(function()
  {
      sum += parseFloat($(this).text());
  });
  console.log(sum);



  // var sum = 0;
  // $('.price').each(function(){
  //     sum += parseFloat(this.value);
  //     console.log(sum);
  // });
  //




  // var sum = 0;
  //
  // $(".price").each(function() {
  //     var val = $.trim( $(this).text() );
  //
  //     if ( val ) {
  //         val = parseFloat( val.replace( /^\$/, "" ) );
  //
  //         sum += !isNaN( val ) ? val : 0;
  //     }
  // });
  //
  // console.log( sum );


var i = 250;

function  tableColorChange() {
    i -= 1;
    // console.log(i);
    var nextColor = "rgba(255, " + i + ", "+ i + ", 1)"
    $(".table").css("background-color", nextColor);
    if (i===0){
      alert("YOU'RE FIRED");
    }
  }

setInterval(tableColorChange, 2000)

});
