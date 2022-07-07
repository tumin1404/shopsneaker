/// <reference path="app.js" />

app.controller("GioHangController", ($scope, $rootScope, $http) => {

    // get thông tin ng đang đăng nhập để fill vào form thanh toán
    $http.get('/Home/GetUserLogin').then(res => {
        // lấy đc thông tin thì gán vào biến authentication
        $rootScope.authentication = res.data;
        $scope.formModel = {
            HoTen: $rootScope.authentication.HoTen,
            Email: $rootScope.authentication.Email,
            SDT: $rootScope.authentication.SDT
        }
    });

    // tạo hàm ThemVaoGio nhận về mã của sp muốn thêm
    $rootScope.ThemVaoGio = (id) => {
        $http.post('/GioHang/ThemVaoGio', { MaSP: id }).then(res => {
            $rootScope.GioHang = res.data;
            toastr.success('Đã thêm sản phẩm vào giỏ hàng!', 'Thành công', { "closeButton": true });
        });
    }

    // gọi hàm GetGioHang bên controller, qua http.get
    $http.get('/GioHang/GetGioHang').then(res => {
        $rootScope.GioHang = res.data;
    });

    // tạo hàm XoaKhoiGio nhận vào 1 mã sp muốn xoá
    $rootScope.XoaKhoiGio = (id) => {
        $http.post('/GioHang/XoaKhoiGio', { MaSP: id }).then(res => {
            $rootScope.GioHang = res.data;
            toastr.warning('Đã xóa sản phẩm khỏi giỏ hàng!', 'Thành công', { "closeButton": true });
        });
    }

    // nhấn submit thanh toán
    $scope.onSubmit = () => {
        $http.post('/GioHang/ThanhToan', $scope.formModel).then(res => {
            Swal.fire({
                icon: 'success',
                title: 'Đặt hàng thành công. Cảm ơn bạn :3',
                showCancelButton: true,
                confirmButtonText: 'Về trang chủ',
                cancelButtonText: 'Quay lại',
            }).then((result) => {
                window.location.href = "/";
            });
        });
    }
});