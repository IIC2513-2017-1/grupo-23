// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).on('turbolinks:load', function() {
    $('.new-btn-publication').on('click', function() {
        var link = $(document).find(".new");
        if (link.hasClass("hidden")) {
            link.removeClass("hidden")
        } else {
            link.addClass("hidden")
        }
    });
    $('.defaultOpen').click();
});