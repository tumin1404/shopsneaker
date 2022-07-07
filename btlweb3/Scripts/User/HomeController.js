/// <reference path="app.js" />

app.controller("HomeController", ($scope, $http, $window, $timeout) => {
    // dùng hàm http.get, gọi đến url /Home/GetJsonList bên phía controller
    $http.get('/SanPham/GetSanPham').then(res => {
        $scope.sanPham = res.data;
    });

    $http.get('/SanPham/GetSanPhamNoiBat').then(res => {
        $scope.sanPhamNoiBat = res.data;
    });

    $http.get('/SanPham/ProductAll').then(res => {
        $scope.sanPhamall = res.data;
    });
    $scope.LoadList = function () {
        $http({
            method: 'GET',
            url: 'http://localhost:64820/SanPham/ProductAll',
        }).then(function (response) {
            $scope.list = response.data;
            console.log(response)
        });
    };
});

