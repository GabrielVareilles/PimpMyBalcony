$(".dynamic-clear-cart").on("ajax:success", function (e, data, status, xhr) {
  $(".off-canvas-cart-item").remove();
    setTimeout(function() {
        location.reload();
      }, 600);
}).on("ajax:error", function (e, xhr, status, error) {
});

$(".dynamic-remove-item-cart").on("ajax:success", function (e, data, status, xhr) {
  $("div[data-id='" + data.id + "']").remove();
    setTimeout(function() {
        location.reload();
      }, 600);
}).on("ajax:error", function (e, xhr, status, error) {
});
// ADDTOCART
$(".dynamic-add-to-cart-item").on("ajax:success", function (e, data, status, xhr) {
  $("div[data-id='additem" + data.id + "']").append('<h2> <i class="fa fa-cart-arrow-down fa-lg" style="color:green"></i></h2>'
);
  setTimeout(function() {
        location.reload();
      }, 600);
}).on("ajax:error", function (e, xhr, status, error) {
});

$(document).ready(function() {
  $('.refresh').click(function() {
      setTimeout(function() {
        location.reload();
      }, 100);
  });
});

