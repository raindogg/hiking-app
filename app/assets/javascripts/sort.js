$(document).ready( function() {
  $("#search-area").hide();
  $(function () {
    $('[data-toggle="popover"]').popover();
  });

  $("#reveal-search").on("click", function () {
    $("#reveal-search").hide();
    $("#search-area").show();
  });
});