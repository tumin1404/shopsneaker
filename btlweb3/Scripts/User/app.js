/// <reference path="../angular.js" />

var app = angular.module('AppModule', ['ui.bootstrap']);

app.controller("MenuController", ($scope, $rootScope, $http) => {
    if (!$rootScope.menus) {
        $http.get('/LoaiSanPham/GetAll').then(res => {
            $rootScope.menus = res.data;
        });
    }
});

// authcontroller để lấy thông tin ng đang đăng nhập bên angularjs
app.controller("AuthController", ($scope, $rootScope, $http) => {
    if (!$rootScope.authentication) {
        $http.get('/Home/GetUserLogin').then(res => {
            $rootScope.authentication = res.data;
        });
    }
});




const urlParams = new URLSearchParams(window.location.search);

const swAlert = {
    success: (message) => {
        Swal.fire({
            icon: 'success',
            title: 'Thành công',
            text: message
        });
    },
    error: (message) => {
        Swal.fire({
            icon: 'error',
            title: 'Lỗi',
            text: message
        });
    }
}