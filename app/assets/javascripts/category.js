$(document).ready( function() {
  var category = "";
  var categoryId = "";
  $("#category-button").on("click", function() {
    var trekId = document.getElementById("trek_id").innerHTML;
    $("#placeholder").hide();
    category = document.getElementById("key").value;
    document.getElementById("category-list").innerHTML += "<li>" + category + "</li>";
    document.getElementById("key").value = "";
    $.ajax({
      type: "POST",
      contentType: "application/json; charset=utf-8",
      url: "/categories",
      data: JSON.stringify({name: category}),
      dataType: "json",
      success: function (result) {
        categoryId = result["id"];
        $.ajax({
          type: "POST",
          contentType: "application/json; charset=utf-8",
          url: "/trek_categories",
          data: JSON.stringify({trek_id: trekId, category_id: categoryId}),
          dataType: "json",
          success: function (result) {
            console.log("success?");
          },
          error: function() {
            console.log("You fucked up");
          }
        });
      },
      error: function() {
        console.log("You fucked up");
      }
    });
  });

  $(".deleteCategory").on("click", function() {
    var selector = this.parentElement.id;
    var categoryId = document.getElementsByClassName("hidden_cat").innerHTML;
    console.log(categoryId);
    $("#" + selector).hide();
    $.ajax({
      type: "DELETE",
      contentType: "application/json; charset=utf-8",
      url: "/trek_categories/" + selector, 
      data: JSON.stringify({id: selector}),
      dataType: "json",
      success: function (result) {
        console.log("success?");
      },
      error: function() {
        console.log("You fucked up");
      }
    });
  });
});