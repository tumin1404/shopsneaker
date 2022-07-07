/// <reference path="app.js" />

// khai báo controller
app.controller("LoaiSanPhamController", ($scope, $rootScope, $http) => {

    $scope.rowCount = 0; // tổng số bản ghi của ds
    $scope.currentPage = 1; // trang hiện tại
    $scope.pageSize = 10; // số bản ghi trên 1 trang
    $rootScope.isCreate = true; // ng dùng có ấn tạo hay ấn sửa, true là ấn tạo, false là ấn sửa

    // hàm pageChanged gọi khi ng dùng chuyển trang
    $scope.pageChanged = () => {
        loadData();
    }

    loadData();
    // hàm load data để gọi sang controller của mvc lấy ds loại sp
    function loadData() {
        $http.get('/Admin/LoaiSanPham/GetData', {
            params: {

                page: $scope.currentPage,
                pageSize: $scope.pageSize,
            }
        }).then(res => {
            $scope.table = res.data.Results; 
            $scope.rowCount = res.data.RowCount; 
        });
    }

    // hàm onCreate gọi khi ng dùng ấn nút thêm
    $scope.onCreate = () => {
        $rootScope.isCreate = true;
        $rootScope.isSubmited = false; 

        $rootScope.formModel = undefined; 
        $('#myModal').modal('show'); 
    }


    // hàm onEdit gọi khi ng dùng ấn vào edit 1 bản ghi
    $scope.onEdit = (item) => {
        $rootScope.isCreate = false;
        $rootScope.isSubmited = false;

        $rootScope.formModel = item; 
        $('#myModal').modal('show'); 
    }

    // hàm onDelete gọi khi ng dùng ấn xóa 1 bản ghi
    $scope.onDelete = (item) => {
        swAlert.delete("Bạn có muốn xóa loại sản phẩm này?", () => {
            $http.post('/Admin/LoaiSanPham/Xoa', { id: item.MaLoai })
                .then(res => {
                    swAlert.success("Xóa loại sản phẩm thành công.");
                    loadData();
                });
        });
    }

    // hàm onSubmit gọi ng dùng ấn submit trên modal
    $rootScope.onSubmit = () => {
        $rootScope.isSubmited = true; 
        if (!$rootScope.form.$valid) {
            return;
        }

        if ($rootScope.isCreate) {
            $http.post('/Admin/LoaiSanPham/Them', $rootScope.formModel)
                .then(res => {
                    swAlert.success("Thêm loại sản phẩm thành công.");
                    loadData();
                });
        } else {
            $http.post('/Admin/LoaiSanPham/Sua', $rootScope.formModel)
                .then(res => {
                    swAlert.success("Sửa loại sản phẩm thành công.");
                    loadData();
                });
        }
        $('#myModal').modal('hide');
    }

});