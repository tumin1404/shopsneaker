/// <reference path="../angular.js" />

// đây của admin

// khai báo module
const app = angular.module('AppModule', ['ui.bootstrap', 'ngFileUpload', 'angularModalService']);


const swAlert = {
    success: (message) => {
        Swal.fire({
            icon: 'success',
            title: 'Thành công',
            text: message
        });
    },
    error: (message) => {
        Swal.fire({
            icon: 'error',
            title: 'Lỗi',
            text: message
        });
    },
    delete: (message, callback) => {
        Swal.fire({
            title: message,
            text: "Hành động này không thể hoàn tác!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Đồng ý',
            cancelButtonText: 'Hủy',
        })
        .then((result) => {
            if (result.isConfirmed) {
                callback();
            }
        });
    }
}

