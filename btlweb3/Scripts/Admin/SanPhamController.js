/// <reference path="../ng-file-upload.js" />
/// <reference path="app.js" />

app.controller("SanPhamController", ($scope, $rootScope, $http, Upload) => {
    $scope.rowCount = 0;
    $scope.currentPage = 1;
    $scope.pageSize = 10;
    $rootScope.isCreate = true;

    // lấy tất cả loại sản phẩm
    $http.get('/Admin/LoaiSanPham/GetAll').then(res => {
        $rootScope.LoaiSanPhams = res.data;
    });

    // hàm lấy ra tên loại, đưa vào mã loại sẽ trả về tên loại tương ứng
    $scope.getTenLoai = (MaLoai) => {
        return $rootScope.LoaiSanPhams.filter(m => m.MaLoai == MaLoai)[0].TenLoai;
    };

    $scope.pageChanged = () => {
        loadData();
    };

    loadData();
    function loadData() {
        $http.get('/Admin/SanPham/GetData', {
            params: {
                page: $scope.currentPage,
                pageSize: $scope.pageSize,
            }
        }).then(res => {
            $scope.table = res.data.Results;
            $scope.rowCount = res.data.RowCount;
        });
    }

    $scope.onCreate = () => {
        $rootScope.isCreate = true;
        $rootScope.isSubmited = false;

        $rootScope.formModel = undefined;
        $rootScope.formImage = undefined; // xóa file trong chỗ upload
        showModal();
    }

    $scope.onEdit = (item) => {
        $rootScope.isCreate = false;
        $rootScope.isSubmited = false;

        $rootScope.formModel = item;
        $rootScope.formImage = undefined; // xóa file trong chỗ upload
        showModal();
    }

    $scope.onDelete = (item) => {
        swAlert.delete("Bạn có thật sự muốn xóa sản phẩm này?", () => {
            $http.post('/Admin/SanPham/Xoa', { id: item.MaSP }).then(res => {
                swAlert.success("Xóa sản phẩm thành công.");
                loadData();
            });
        });
    }

    $rootScope.onSubmit = () => {
        $rootScope.isSubmited = true;

        if (!$rootScope.form.$valid) {
            return;
        }

        $rootScope.formModel.file = $rootScope.formImage;

        if ($rootScope.isCreate) {
            // dùng hàm Upload để gửi form ng dùng nhập và file ảnh
            Upload.upload({
                url: '/Admin/SanPham/Them',
                data: $rootScope.formModel
            }).then(res => {
                swAlert.success("Thêm sản phẩm thành công.");
                loadData();
            });
        } else {
            Upload.upload({
                url: '/Admin/SanPham/Sua',
                data: $rootScope.formModel
            }).then(res => {
                swAlert.success("Sửa sản phẩm thành công.");
                loadData();
            });
        }

        hideModal();
    }

    function showModal() {
        $("#myModal").modal("show");
    }

    function hideModal() {
        $("#myModal").modal("hide");
    }
});