/// <reference path="app.js" />

app.controller("DangNhapController", ($scope, $http) => {

    // ng dùng nhấn submit
    $scope.onSubmit = () => {
        // gửi email và mật khẩu đăng nhập sang bên controller kiểm tra
        $http.post('/Home/DangNhap', $scope.formModel).then(res => {
            if (res.data.message) {
                swAlert.error(res.data.message);
                return;
            }
            window.location.href = "/";
        });
    }

});