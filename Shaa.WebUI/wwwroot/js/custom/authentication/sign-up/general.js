"use strict";
var KTSignupGeneral = function () {
    var e, t, a, s, r = function () {
        return 100 === s.getScore()
    };
    return {
        init: function () {
            e = document.querySelector("#kt_sign_up_form"), t = document.querySelector("#kt_sign_up_submit"), s = KTPasswordMeter.getInstance(e.querySelector('[data-kt-password-meter="true"]')), a = FormValidation.formValidation(e, {
                fields: {
                    "FirstName": {validators: {notEmpty: {message: "لطفا نام را وارد کنید"}}},
                    "LastName": {validators: {notEmpty: {message: "لطفا نام خانوادگی را وارد کنید"}}},
                    email: {
                        validators: {
                            notEmpty: {message: "لطفا آدرس ایمیل را وارد کنید"},
                            emailAddress: {message: "آدرس ایمیل نامعتبر است"}
                        }
                    },
                    password: {
                        validators: {
                            notEmpty: {message: "لطفا کلمه عبور را وارد کنید"},
                            callback: {
                                message: "لطفا کلمه عبور معتبر وارد کنید", callback: function (e) {
                                    if (e.value.length > 0) return r()
                                }
                            }
                        }
                    },
                    nationalNo: {
                        validators: {
                            notEmpty: {message: "لطفا شماره ملی را وارد کنید"},
                            nationalNo: {message: "شماره ملی معتبر نمیباشد"}
                        }
                    },
                    "confirm-password": {
                        validators: {
                            notEmpty: {message: "لطفا تایید کلمه عبور را وارد کنید"},
                            identical: {
                                compare: function () {
                                    return e.querySelector('[name="password"]').value
                                }, message: "کلمه های عبور با یکدیگر مغایرت دارند"
                            }
                        }
                    },
                    toc: {validators: {notEmpty: {message: "حتما باید شرایط و ضوابط را تایید کنید"}}}
                },
                plugins: {
                    trigger: new FormValidation.plugins.Trigger({event: {password: !1}}),
                    bootstrap: new FormValidation.plugins.Bootstrap5({
                        rowSelector: ".fv-row",
                        eleInvalidClass: "",
                        eleValidClass: ""
                    })
                }
            }), t.addEventListener("click", (function (r) {
                r.preventDefault(), a.revalidateField("password"), a.validate().then((function (a) {
                    "Valid" == a ? (t.setAttribute("data-kt-indicator", "on"), t.disabled = !0, setTimeout((function () {
                        e.submit();
                        // t.removeAttribute("data-kt-indicator"), t.disabled = !1, Swal.fire({
                        //     text: "عملیات با موفقیت انجام شد",
                        //     icon: "success",
                        //     buttonsStyling: !1,
                        //     confirmButtonText: "باشه",
                        //     customClass: {confirmButton: "btn btn-primary"}
                        // }).then((function (t) {
                        //     t.isConfirmed && (e.reset(), s.reset())
                        // }))
                    }), 1500)) : Swal.fire({
                        text: "متاسفانه در روند عملیات مشکلی بوجود آمده است. مجددا تلاش کنید",
                        icon: "error",
                        buttonsStyling: !1,
                        confirmButtonText: "باشه",
                        customClass: {confirmButton: "btn btn-primary"}
                    })
                }))
            })), e.querySelector('input[name="password"]').addEventListener("input", (function () {
                this.value.length > 0 && a.updateFieldStatus("password", "NotValidated")
            }))
        }
    }
}();
KTUtil.onDOMContentLoaded((function () {
    KTSignupGeneral.init()
}));