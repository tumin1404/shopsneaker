// slide sử dụng thư viện olw carousel

$('#slideshow').owlCarousel({
    loop: true, // vòng lặp
    animateOut: 'slideOutDown', // hiệu trượt xuống
    animateIn: 'flipInX', // hiệu ứng lật
    margin: 20,
    items: 1, // số lượng item trên màn hình
    smartSpeed: 450, // tốc độ chuyển
    autoplay: true, // tự động chuyển
    autoplayTimeout: 3000 // thời gian chuyển
});