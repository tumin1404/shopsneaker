/// <reference path="app.js" />

app.controller("HoaDonBanController", ($scope, $rootScope, $http) => {
    $scope.rowCount = 0;
    $scope.currentPage = 1;
    $scope.pageSize = 10;
    $rootScope.ChiTiets = [];

    // lấy tất cả sản phẩm
    $http.get('/Admin/HoaDonBan/GetAllTenSanPham').then(res => {
        $rootScope.SanPhams = res.data;
    });

    // hàm lấy ra tên sp, đưa vào mã sp sẽ trả về tên sp tương ứng
    $scope.getTenSP = (MaSP) => {
        return $rootScope.SanPhams.filter(m => m.MaSP == MaSP)[0].TenSP;
    };

    // hàm lấy ra khách hàng, đưa vào mã khách hàng sẽ trả về khách hàng tương ứng
    $scope.getKhachHang = (MaKH) => {
        return $rootScope.KhachHangs.filter(m => m.MaKH == MaKH)[0];
    };

    $scope.pageChanged = () => {
        loadData();
    };

    loadData();
    function loadData() {
        $http.get('/Admin/HoaDonBan/GetAllTenSanPham').then(res => {
            $rootScope.SanPhams = res.data;
        });

        $http.get('/Admin/HoaDonBan/GetAllKhachHang').then(res => {
            $rootScope.KhachHangs = res.data;
        });

        $http.get('/Admin/HoaDonBan/GetData', {
            params: {
                page: $scope.currentPage,
                pageSize: $scope.pageSize,
            }
        }).then(res => {
            // duyệt qua các kết quả trả về
            $scope.table = res.data.Results.map(hd => {
                // set khách hàng vào các kết quả
                hd.khachHang = $scope.getKhachHang(hd.MaKH);
                return hd;
            });
            $scope.rowCount = res.data.RowCount;
        });
    }

    // hàm chạy khi ng dùng ấn nút thêm sp ở trong hóa đơn mới
    $rootScope.onAdd = () => {
        $rootScope.ChiTiets.push({
            SoLuong: 1,
        });
    }

    $scope.onCreate = () => {
        $rootScope.isSubmited = false;
        $rootScope.formModel = undefined;
        $rootScope.ChiTiets = [];
        showModal();
    }

    $scope.onDelete = (item) => {
        swAlert.delete("Bạn có thật sự muốn xóa hóa đơn này?", () => {
            $http.post('/Admin/HoaDonBan/Xoa', { id: item.MaHDB }).then(res => {
                swAlert.success("Xóa hóa đơn thành công.");
                loadData();
            });
        });
    }

    // hàm chạy khi ng dùng ấn xem 1 hóa đơn
    $scope.onView = (item) => {
        // get hóa đơn bằng mã từ controller mvc
        $http.get('/Admin/HoaDonBan/ViewHoaDon', {
            params: {
                id: item.MaHDB,
            }
        }).then(res => {
            // duyệt qua các chi tiết trong hóa đơn đc trả về
            res.data.chiTiet = res.data.chiTiet.map(ct => {
                // set giá trị cho sản phẩm trong từng chi tiết
                ct.SanPham = $scope.getSanPham(ct.MaSP);
                return ct;
            });
            // gán toàn bộ dữ liệu hóa đơn cho biến viewModel để hiển thị lên modal
            $rootScope.viewModel = res.data;
            $rootScope.ChiTiet = [];
        });
        $("#viewModal").modal("show");
    }

    $rootScope.onSubmit = () => {
        $rootScope.isSubmited = true;

        if (!$rootScope.form.$valid) {
            return;
        }

        // gửi dữ liệu lên controller mvc bao gồm thông tin khách hàng và các chi tiết sản phẩm
        $http.post('/Admin/HoaDonBan/Them', {
            KhachHang: $rootScope.formModel,
            ChiTietHDBs: $rootScope.ChiTiets,
        })
            .then(res => {
                swAlert.success("Thêm hóa đơn thành công.");
                loadData();
            });

        hideModal();
    }

    function showModal() {
        $("#myModal").modal("show");
    }

    function hideModal() {
        $("#myModal").modal("hide");
    }    
});