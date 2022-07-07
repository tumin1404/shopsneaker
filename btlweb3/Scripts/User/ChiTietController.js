/// <reference path="app.js" />

app.controller("ChiTietController", ($scope, $http) => {
    let id = urlParams.get('id');

    $http.get('/SanPham/GetSpById', {
        params: {
            id: id
        }
    }).then(res => {
        $scope.sanPhamView = res.data;

        // get sản phẩm liên quan
        $http.get('/SanPham/GetSpLienQuan', {
            params: {
                id: $scope.sanPhamView.MaLoai
            }
        }).then(res => {
            $scope.sanPhamLienQuan = res.data;
        });
    });
});