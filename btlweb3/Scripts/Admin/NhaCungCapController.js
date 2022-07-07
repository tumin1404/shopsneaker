/// <reference path="app.js" />


// khai báo controller
app.controller("NhaCungCapController", ($scope, $rootScope, $http) => {

    $scope.rowCount = 0; 
    $scope.currentPage = 1; 
    $scope.pageSize = 10; 
    $rootScope.isCreate = true;

    // hàm pageChanged gọi khi ng dùng chuyển trang
    $scope.pageChanged = () => {
        loadData();
    }

    loadData();
    // hàm load data để gọi sang controller của mvc lấy ds loại sp
    function loadData() {
        $http.get('/Admin/NhaCungCap/GetData', {
            params: { // gửi param bao gồm, trang hiện tại và số bản ghi trong 1 trang cho controller để biết mà chia
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
        swAlert.delete("Bạn có muốn xóa nhà cung cấp này?", () => {
            $http.post('/Admin/NhaCungCap/Xoa', { id: item.MaNCC })
                .then(res => {
                    swAlert.success("Xóa nhà cung cấp thành công.");
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
            $http.post('/Admin/NhaCungCap/Them', $rootScope.formModel)
                .then(res => {
                    swAlert.success("Thêm nhà cung cấp thành công.");
                    loadData();
                });
        } else {
            $http.post('/Admin/NhaCungCap/Sua', $rootScope.formModel)
                .then(res => {
                    swAlert.success("Sửa nhà cung cấp thành công.");
                    loadData();
                });
        }

        // thêm xong thì ẩn modal đi
        $('#myModal').modal('hide');
    }

});