$(document).on "turbolinks:load", ->
  $('#glowna-link').click ->
  	$('#GlownaSec').fadeToggle()
  	$('#PoczekalniaSec').hide()
  	$('#CommentSec').hide()

$(document).on "turbolinks:load", ->
  $('#poczekalnia-link').click ->
  	$('#PoczekalniaSec').fadeToggle()
  	$('#GlownaSec').hide()
  	$('#CommentSec').hide()


$(document).on "turbolinks:load", ->
  $('#comment-link').click ->
  	$('#CommentSec').fadeToggle()
  	$('#PoczekalniaSec').hide()
  	$('#GlownaSec').hide()



  