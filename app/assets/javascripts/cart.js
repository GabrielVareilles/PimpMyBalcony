$(".dynamic-clear-cart").on("ajax:success", function (e, data, status, xhr) {
  $(".off-canvas-cart-item").remove();
}).on("ajax:error", function (e, xhr, status, error) {
});

$(".dynamic-remove-item-cart").on("ajax:success", function (e, data, status, xhr) {
  $("div[data-id='" + data.id + "']").remove();
}).on("ajax:error", function (e, xhr, status, error) {
});
