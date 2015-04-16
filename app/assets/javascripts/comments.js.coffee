# comments.js.coffee
jQuery ->
  # Create a comment
  $("#project-comment-form")
  .on "ajax:beforeSend", (evt, xhr, settings) ->
    $(this).find('textarea')
    .addClass('uneditable-input')
    .attr('disabled', 'disabled');
  .on "ajax:success", (evt, data, status, xhr) ->
    $(this).find('textarea')
    .removeClass('uneditable-input')
    .removeAttr('disabled', 'disabled')
    .val('');
    $(xhr.responseText).hide().insertAfter($(this)).show('slow')

  $(document)
  .on "ajax:beforeSend", ".comment-item", ->
    $(this).fadeTo('fast', 0.5)
  .on "ajax:success", ".comment-item", ->
    $(this).hide('fast')
  .on "ajax:error", ".comment-item", ->
    $(this).fadeTo('fast', 1)
