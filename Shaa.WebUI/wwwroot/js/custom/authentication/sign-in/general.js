"use strict";
var KTSigninGeneral = function () {
    var t, e, i;
    return {
        init: function () {
            t = document.querySelector("#kt_sign_in_form"), e = document.querySelector("#kt_sign_in_submit"), i = FormValidation.formValidation(t, {
                fields: {
                    email: {
                        validators: {
                            notEmpty: {message: "Email address is required"},
                            emailAddress: {message: "آدرس ایمیل نامعتبر است"}
                        }
                    }, password: {validators: {notEmpty: {message: "The password is required"}}},
                    nationalNo: {
                        validators: {
                            notEmpty: {message: "لطفا شماره ملی را وارد کنید"},
                            nationalNo: {message: "شماره ملی معتبر نمیباشد"}
                        }
                    },
                },
                plugins: {
                    trigger: new FormValidation.plugins.Trigger,
                    bootstrap: new FormValidation.plugins.Bootstrap5({rowSelector: ".fv-row"})
                }
            }), e.addEventListener("click", (function (n) {
                n.preventDefault(), i.validate().then((function (i) {
                    "Valid" == i ? (e.setAttribute("data-kt-indicator", "on"), e.disabled = !0, setTimeout((function () {
                        t.submit();
                        // e.removeAttribute("data-kt-indicator"), e.disabled = !1, Swal.fire({
                        //     text: "You have successfully logged in!",
                        //     icon: "success",
                        //     buttonsStyling: !1,
                        //     confirmButtonText: "باشه",
                        //     customClass: {confirmButton: "btn btn-primary"}
                        // }).then((function (e) {
                        //     if (e.isConfirmed) {
                        //         t.querySelector('[name="email"]').value = "", t.querySelector('[name="password"]').value = "";
                        //         var i = t.getAttribute("data-kt-redirect-url");
                        //         i && (location.href = i)
                        //     }
                        // }))
                    }), 2e3)) : Swal.fire({
                        text: "متاسفانه در روند عملیات مشکلی بوجود آمده است. مجددا تلاش کنید",
                        icon: "error",
                        buttonsStyling: !1,
                        confirmButtonText: "باشه",
                        customClass: {confirmButton: "btn btn-primary"}
                    })
                }))
            }))
        }
    }
}();
KTUtil.onDOMContentLoaded((function () {
    KTSigninGeneral.init()
}));