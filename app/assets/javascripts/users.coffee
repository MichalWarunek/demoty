$(document).on "turbolinks:load", ->
  $('#glowna-link').click ->
    $('#GlownaSec').fadeToggle()
    $('#PoczekalniaSec').hide()
    $('#CommentSec').hide()
    $('#UlubioneSec').hide()
    $('#FollowersSec').hide()
    $('#FollowSec').hide()

$(document).on "turbolinks:load", ->
  $('#poczekalnia-link').click ->
    $('#PoczekalniaSec').fadeToggle()
    $('#GlownaSec').hide()
    $('#CommentSec').hide()
    $('#UlubioneSec').hide()
    $('#FollowersSec').hide()
    $('#FollowSec').hide()

$(document).on "turbolinks:load", ->
  $('#comment-link').click ->
    $('#CommentSec').fadeToggle()
    $('#PoczekalniaSec').hide()
    $('#GlownaSec').hide()
    $('#UlubioneSec').hide()
    $('#FollowersSec').hide()
    $('#FollowSec').hide()

$(document).on "turbolinks:load", ->
  $('#ulubione-link').click ->
    $('#UlubioneSec').fadeToggle()
    $('#PoczekalniaSec').hide()
    $('#GlownaSec').hide()
    $('#CommentSec').hide()
    $('#FollowersSec').hide()
    $('#FollowSec').hide()

$(document).on "turbolinks:load", ->
  $('#followers-link').click ->
    $('#FollowersSec').fadeToggle()
    $('#PoczekalniaSec').hide()
    $('#GlownaSec').hide()
    $('#CommentSec').hide()
    $('#UlubioneSec').hide()
    $('#FollowSec').hide()

$(document).on "turbolinks:load", ->
  $('#follow-link').click ->
    $('#FollowSec').fadeToggle()
    $('#PoczekalniaSec').hide()
    $('#GlownaSec').hide()
    $('#CommentSec').hide()
    $('#UlubioneSec').hide()
    $('#FollowersSec').hide()




  