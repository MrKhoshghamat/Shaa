"use strict";
var KTCreateAccount = function () {
    var e, t, i, o, s, r, a = [];
    return {
        init: function () {
            (e = document.querySelector("#kt_modal_create_account")) && new bootstrap.Modal(e), t = document.querySelector("#kt_create_account_stepper"), i = t.querySelector("#kt_create_account_form"), o = t.querySelector('[data-kt-stepper-action="submit"]'), s = t.querySelector('[data-kt-stepper-action="next"]'), (r = new KTStepper(t)).on("kt.stepper.changed", (function (e) {
                4 === r.getCurrentStepIndex() ? (o.classList.remove("d-none"), o.classList.add("d-inline-block"), s.classList.add("d-none")) : 5 === r.getCurrentStepIndex() ? (o.classList.add("d-none"), s.classList.add("d-none")) : (o.classList.remove("d-inline-block"), o.classList.remove("d-none"), s.classList.remove("d-none"))
            })), r.on("kt.stepper.next", (function (e) {
                console.log("stepper.next");
                var t = a[e.getCurrentStepIndex() - 1];
                t ? t.validate().then((function (t) {
                    console.log("validated!"), "Valid" == t ? (e.goNext(), KTUtil.scrollTop()) : Swal.fire({
                        text: "متاسفانه در روند عملیات مشکلی بوجود آمده است. مجددا تلاش کنید",
                        icon: "error",
                        buttonsStyling: !1,
                        confirmButtonText: "باشه",
                        customClass: {confirmButton: "btn btn-light"}
                    }).then((function () {
                        KTUtil.scrollTop()
                    }))
                })) : (e.goNext(), KTUtil.scrollTop())
            })), r.on("kt.stepper.previous", (function (e) {
                console.log("stepper.previous"), e.goPrevious(), KTUtil.scrollTop()
            })), a.push(FormValidation.formValidation(i, {
                fields: {
                    LaboratoryTitle: {validators: {notEmpty: {message: "لطفا عنوان آزمایشگاه را وارد کنید"}}},
                    PassiveDefenceId: {validators: {notEmpty: {message: "لطفا پدافند غیر عامل را وارد کنید"}}},
                    ApprovalAuthorityId: {validators: {notEmpty: {message: "لطفا مرجع تصویب را وارد کنید"}}},
                    ResearchCenterId: {validators: {notEmpty: {message: "لطفا مرکز تحقیقاتی را وارد کنید"}}},
                    LaboratoryTypeId: {validators: {notEmpty: {message: "لطفا نوع آزمایشگاه را وارد کنید"}}},
                    StandardStatusId: {validators: {notEmpty: {message: "لطفا وضعیت استاندارد را وارد کنید"}}},
                    PhoneNumber: {validators: {notEmpty: {message: "لطفا شماره تماس را وارد کنید"}}},
                    Address: {validators: {notEmpty: {message: "لطفا آدرس را وارد کنید"}}}
                },
                plugins: {
                    trigger: new FormValidation.plugins.Trigger,
                    bootstrap: new FormValidation.plugins.Bootstrap5({
                        rowSelector: ".fv-row",
                        eleInvalidClass: "",
                        eleValidClass: ""
                    })
                }
            })), a.push(FormValidation.formValidation(i, {
                fields: {
                    EquipmentTypeId: {validators: {notEmpty: {message: "لطفا نوع تجهیز را وارد کنید"}}},
                    EquipmentTitle: {validators: {notEmpty: {message: "لطفا عنوان تجهیز را وارد کنید"}}},
                    UsageTypeId: {validators: {notEmpty: {message: "لطفا نوع کاربری را وارد کنید"}}},
                    CountryId: {validators: {notEmpty: {message: "لطفا کشور سازنده را وارد کنید"}}},
                    CompanyName: {validators: {notEmpty: {message: "لطفا کمپانی سازنده را وارد کنید"}}},
                    Model: {validators: {notEmpty: {message: "لطفا مدل را وارد کنید"}}},
                    SerialNumber: {validators: {notEmpty: {message: "لطفا شماره سریال را وارد کنید"}}},
                    InstallationDate: {validators: {notEmpty: {message: "لطفا تاریخ نصب را وارد کنید"}}},
                    ExploitationDate: {validators: {notEmpty: {message: "لطفا تاریخ بهره برداری را وارد کنید"}}}
                },
                plugins: {
                    trigger: new FormValidation.plugins.Trigger,
                    bootstrap: new FormValidation.plugins.Bootstrap5({
                        rowSelector: ".fv-row",
                        eleInvalidClass: "",
                        eleValidClass: ""
                    })
                }
            })), a.push(FormValidation.formValidation(i, {
                fields: {
                    AbilityTitle: {validators: {notEmpty: {message: "لطفا عنوان توانمندی را وارد کنید"}}},
                    ConsumableCost: {validators: {notEmpty: {message: "لطفا هزینه مواد مصرفی را وارد کنید"}}},
                    HumanResourceCost: {validators: {notEmpty: {message: "لطفا هزینه نیروی انسانی را وارد کنید"}}},
                    EquipmentCost: {validators: {notEmpty: {message: "لطفا هزینه تجهیزات را وارد کنید"}}},
                    ImplementationCost: {validators: {notEmpty: {message: "لطفا هزینه اجرا وپیاده سازی را وارد کنید"}}},
                    ImplementationTime: {validators: {notEmpty: {message: "لطفا تاریخ زمان اجرا را وارد کنید"}}}
                },
                plugins: {
                    trigger: new FormValidation.plugins.Trigger,
                    bootstrap: new FormValidation.plugins.Bootstrap5({
                        rowSelector: ".fv-row",
                        eleInvalidClass: "",
                        eleValidClass: ""
                    })
                }
            })), o.addEventListener("click", (function (e) {
                a[2].validate().then((function (t) {
                    i.submit();
                    console.log("validated!"), "Valid" == t ? (e.preventDefault(), o.disabled = !0, o.setAttribute("data-kt-indicator", "on"), setTimeout((function () {
                        o.removeAttribute("data-kt-indicator"), o.disabled = !1, r.goNext()
                    }), 2e3)) : Swal.fire({
                        text: "Sorry, looks like there are some errors detected, please try again.",
                        icon: "error",
                        buttonsStyling: !1,
                        confirmButtonText: "Ok, got it!",
                        customClass: {confirmButton: "btn btn-light"}
                    }).then((function () {
                        KTUtil.scrollTop()
                    }))
                }))
            })), $(i.querySelector('[name="card_expiry_month"]')).on("change", (function () {
                a[3].revalidateField("card_expiry_month")
            })), $(i.querySelector('[name="card_expiry_year"]')).on("change", (function () {
                a[3].revalidateField("card_expiry_year")
            })), $(i.querySelector('[name="business_type"]')).on("change", (function () {
                a[2].revalidateField("business_type")
            }))
        }
    }
}();
KTUtil.onDOMContentLoaded((function () {
    KTCreateAccount.init()
}));