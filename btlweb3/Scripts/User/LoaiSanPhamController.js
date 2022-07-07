/// <reference path="app.js" />

app.controller("LoaiSanPhamController", ($scope, $http) => {
    let id = urlParams.get('id');
    $scope.rowCount = 0;
    $scope.currentPage = 1;
    $scope.pageSize = 6;

    // lấy thông tin của loại sản phẩm theo id
    $http.get('/LoaiSanPham/GetLoaiSanPham', {
        params: {
            id: id
        }
    }).then(res => {
        $scope.loaiSanPham = res.data;
    });

    $scope.pageChanged = () => {
        loadData();
    };

    loadData();
    function loadData() {
        // dùng hàm http.get, gọi đến url bên phía controller
        $http.get('/LoaiSanPham/GetSanPham', {
            params: {
                id: id,
                page: $scope.currentPage,
                pageSize: $scope.pageSize,
            }
        }).then(res => {
            $scope.sanPham = res.data.Results;
            $scope.rowCount = res.data.RowCount;
        });
    }
});