$(".dynamic-clear-cart").on("ajax:success", function (e, data, status, xhr) {
  $(".off-canvas-cart-item").remove();
}).on("ajax:error", function (e, xhr, status, error) {
  $("#new_article").append("<p>ERROR</p>");
});
