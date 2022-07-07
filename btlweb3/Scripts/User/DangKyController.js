/// <reference path="app.js" />

app.controller("DangKyController", ($scope, $http) => {

    $scope.onSubmit = () => {
        // kiểm tra 2 mk ng dùng nhập có khớp nhau k
        if ($scope.formModel.MatKhau != $scope.formModel.reMatKhau) {
            swAlert.error("Mật khẩu bạn nhập không khớp nhau.");
            return;
        }

        // gửi thông tin ng dùng đăng kí cho controller bên mvc
        $http.post('/Home/DangKy', $scope.formModel).then(res => {
            if (res.data.message) {
                swAlert.error(res.data.message);
                return;
            }
            Swal.fire({
                    icon: 'success',
                    title: 'Đăng ký tài khoản thành công. Bạn có muốn đăng nhập?',
                    showCancelButton: true,
                    confirmButtonText: 'Đăng nhập',
                    cancelButtonText: 'Quay lại',
                })
                .then((result) => {
                    if (result.isConfirmed) {
                        window.location.href = "/Home/DangNhap";
                    }
                });
        });
    }

});