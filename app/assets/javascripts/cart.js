$(".dynamic-clear-cart").on("ajax:success", function (e, data, status, xhr) {
  $(".off-canvas-cart-item").remove();
}).on("ajax:error", function (e, xhr, status, error) {
});

$(".dynamic-remove-item-cart").on("ajax:success", function (e, data, status, xhr) {
  $("div[data-id='" + data.id + "']").remove();
}).on("ajax:error", function (e, xhr, status, error) {
});

$(".dynamic-add-to-cart-item").on("ajax:success", function (e, data, status, xhr) {
  $("div[data-id='additem" + data.id + "']").append("<i class="fa fa-check-circle" aria-hidden="true"></i><h5> added to your cart</h5>"
);
}).on("ajax:error", function (e, xhr, status, error) {
});
