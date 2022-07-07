/// <reference path="app.js" />


// khai báo controller
app.controller("TaiKhoanController", ($scope, $rootScope, $http) => {

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
        $http.get('/Admin/TaiKhoan/GetData', {
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

    // hàm onSubmit gọi ng dùng ấn submit trên modal
    $rootScope.onSubmit = () => {
        $rootScope.isSubmited = true;
        if (!$rootScope.form.$valid) {
            return;
        }

        if ($rootScope.isCreate) {
            $http.post('/Admin/TaiKhoan/Them', $rootScope.formModel)
                .then(res => {
                    if (res.data.message) {
                        // nếu có thông báo gửi lại thì hiện nó ra
                        swAlert.error(res.data.message);
                        return;
                    }
                    swAlert.success("Thêm tài khoản thành công.");
                    loadData();
                });
        } else {
            $http.post('/Admin/TaiKhoan/Sua', $rootScope.formModel)
                .then(res => {
                    if (res.data.message) {
                        // nếu có thông báo gửi lại thì hiện nó ra
                        swAlert.error(res.data.message);
                        return;
                    }
                    swAlert.success("Sửa tài khoản thành công.");
                    loadData();
                });
        }

        // thêm xong thì ẩn modal đi
        $('#myModal').modal('hide');
    }

});