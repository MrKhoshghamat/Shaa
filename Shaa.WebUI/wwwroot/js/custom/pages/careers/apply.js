"use strict";
var KTCareersApply = function () {
    var t, e, i;
    return {
        init: function () {
            i = document.querySelector("#kt_careers_form"), t = document.getElementById("kt_careers_submit_button"), $(i.querySelector('[name="position"]')).on("change", (function () {
                e.revalidateField("position")
            })), $(i.querySelector('[name="start_date"]')).flatpickr({
                enableTime: !1,
                dateFormat: "d, M Y"
            }), e = FormValidation.formValidation(i, {
                fields: {
                    first_name: {validators: {notEmpty: {message: "لطفا نام را وارد کنید"}}},
                    last_name: {validators: {notEmpty: {message: "لطفا نام خانوادگی را وارد کنید"}}},
                    age: {validators: {notEmpty: {message: "لطفا سن را وارد کنید"}}},
                    city: {validators: {notEmpty: {message: "لطفا شهر را وارد کنید"}}},
                    email: {
                        validators: {
                            notEmpty: {message: "آدرس ایمیل را وارد کنید"},
                            emailAddress: {message: "آدرس ایمیل نامعتبر است"}
                        }
                    },
                    salary: {validators: {notEmpty: {message: "Expected salary is required"}}},
                    position: {validators: {notEmpty: {message: "Position is required"}}},
                    start_date: {validators: {notEmpty: {message: "Start date is required"}}}
                },
                plugins: {
                    trigger: new FormValidation.plugins.Trigger,
                    bootstrap: new FormValidation.plugins.Bootstrap5({
                        rowSelector: ".fv-row",
                        eleInvalidClass: "",
                        eleValidClass: ""
                    })
                }
            }), t.addEventListener("click", (function (i) {
                i.preventDefault(), e && e.validate().then((function (e) {
                    console.log("validated!"), "Valid" == e ? (t.setAttribute("data-kt-indicator", "on"), t.disabled = !0, setTimeout((function () {
                        t.removeAttribute("data-kt-indicator"), t.disabled = !1, Swal.fire({
                            text: "Form has been successfully submitted!",
                            icon: "success",
                            buttonsStyling: !1,
                            confirmButtonText: "باشه",
                            customClass: {confirmButton: "btn btn-primary"}
                        }).then((function (t) {
                            t.isConfirmed
                        }))
                    }), 2e3)) : Swal.fire({
                        text: "متاسفانه در روند عملیات مشکلی بوجود آمده است. مجددا تلاش کنید",
                        icon: "error",
                        buttonsStyling: !1,
                        confirmButtonText: "باشه",
                        customClass: {confirmButton: "btn btn-primary"}
                    }).then((function (t) {
                        KTUtil.scrollTop()
                    }))
                }))
            }))
        }
    }
}();
KTUtil.onDOMContentLoaded((function () {
    KTCareersApply.init()
}));