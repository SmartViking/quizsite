$(document).ready(function() {
    function get_question() {
	$.getJSON($SCRIPT_ROOT + '/fetch_question.json',
		  function(data) {
		      $("#question").text(data.question);
		      $("#alt_1_text").text(data.alt_1);
		      $("#alt_2_text").text(data.alt_2);
		      $("#alt_3_text").text(data.alt_3);
		      window.question_id = data.qid;
		  });
    }
    
    $('#submit_answer').bind('click', function() {
	guess = $("#alts input[id^=alt_]:checked").prop("value");
	if (!guess) {
	    $(this).effect("highlight",{ "color" : "red"});
	    return false;
	}
	$.get($SCRIPT_ROOT+'/check_answer/'+window.question_id+"/"+guess,
	      function(data) {
		  if (data === "true") {
		      $("#result").text("Correct!").css("color","green");
		      $("#result_img").attr("src",$CORRECT_IMG)
		  } else {
		      $("#result").text("Incorrect!").css("color","red");
		      $("#result_img").attr("src",$INCORRECT_IMG)
		  }
		  $("#alts").hide()
		  $("#result_img").show()
	      });
	$("#submit_answer").hide();
	$("#next_question").show();
	return false;
    });

    $('#next_question').bind('click', function() {
	get_question();
	$("#next_question").hide();
	$("#submit_answer").show();
	$("#result").text("");
	$("input[id^=alt_]").prop('checked', false).button("refresh");
	$("#alts").show();
	$("#result_img").hide()
    });

    /* INITIALIZATION */
    $("#result").css("color","red");
    $("#next_question").hide();
    $("#alts").buttonset();
    $(".bottom-button").button()
    get_question();
    $("#result_img").attr("src",$CORRECT_IMG)
    $("#result_img").hide()
});