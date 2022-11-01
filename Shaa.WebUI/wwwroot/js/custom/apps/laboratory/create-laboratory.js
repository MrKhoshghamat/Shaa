"use strict";
var KTCreateLaboratory = function () {
    var e, t, i, o, s, r, a = [];

    var step1_validation, step1_form;

    return {
        init: function () {
            const pass_step = function (succ, fail) {
                switch (r.passedStepIndex) {
                    case 0: {
                        succ();
                        return true;
                    }
                    case 1: {
                        step1_validation.validate().then((function (validation_result) {
                            if (validation_result == "Valid") {
                                $.ajax({
                                    type: "POST",
                                    url: "/RegisterLaboratoryMainPartial",
                                    data: {
                                        LaboratoryTitle: $('#LaboratoryTitle').val(),
                                        PassiveDefenceId: $('#PassiveDefenceId').val(),
                                        ApprovalAuthorityId: $('#ApprovalAuthorityId').val(),
                                        ResearchCenterId: $('#ResearchCenterId').val(),
                                        LaboratoryTypeId: $('#LaboratoryTypeId').val(),
                                        StandardStatusId: $('#StandardStatusId').val(),
                                        PhoneNumber: $('#PhoneNumber').val(),
                                        Address: $('#Address').val(),
                                    },
                                    dataType: "json",
                                    encode: true,
                                    success: function (data) {
                                        succ();
                                    },
                                    error: function (data) {
                                        fail();
                                    }
                                });
                            } else {
                                Swal.fire({
                                    text: "Sorry, looks like there are some errors detected, please try again.",
                                    icon: "error",
                                    buttonsStyling: !1,
                                    confirmButtonText: "Ok, got it!",
                                    customClass: {confirmButton: "btn btn-light"}
                                }).then((function () {
                                    KTUtil.scrollTop()
                                }));
                                fail();
                            }
                        }));
                        return;
                    }
                    case 2: {
                        return;
                    }
                    case 3: {

                        return;
                    }
                    case 4: {

                        return;
                    }
                    default:
                }
            };
            const load_step_content = function () {
                const _currentStepIndex = r.getCurrentStepIndex() == 0 ? 1 : r.getCurrentStepIndex();
                const sel = '#stepper-content-' + _currentStepIndex;

                if (!($(sel).hasClass('init'))) {
                    switch (_currentStepIndex) {
                        case 1: {
                            load_content('/RegisterLaboratoryMainPartial', {}, function (data) {
                                $(sel).html(data);
                                $(sel).addClass('init');

                                step1_form = document.querySelector("#kt_create_account_main_form");
                                step1_validation = FormValidation.formValidation(i, {
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
                                });
                            });
                            return;
                        }
                        case 2: {
                            $(sel).html('step 2 load at ' + new Date().toString());
                            return;
                        }
                        case 3: {
                            $(sel).html('step 3 load at ' + new Date().toString());
                            return;
                        }
                        case 4: {
                            $(sel).html('step 4 load at ' + new Date().toString());
                            return;
                        }
                        default:
                    }
                }
            };

            /* ---------------------------------------------------- old -----------------------------------------*/
            const kt_stepper_changed = function (e) {
                4 === r.getCurrentStepIndex()
                    ? (o.classList.remove("d-none"), o.classList.add("d-inline-block"), s.classList.add("d-none"))
                    : 5 === r.getCurrentStepIndex() ? (o.classList.add("d-none"), s.classList.add("d-none")) :
                        (o.classList.remove("d-inline-block"), o.classList.remove("d-none"), s.classList.remove("d-none"));

                pass_step(function () {
                    load_step_content();
                }, function () {
                    r.goPrevious();
                });
            };

            (e = document.querySelector("#kt_modal_create_account")) && new bootstrap.Modal(e),
                t = document.querySelector("#kt_create_account_stepper"),
                i = t.querySelector("#kt_create_account_form"),
                o = t.querySelector('[data-kt-stepper-action="submit"]'),
                s = t.querySelector('[data-kt-stepper-action="next"]'),

                (r = new KTStepper(t)).on("kt.stepper.changed", kt_stepper_changed)
                //(
                //function (e) {
                //    4 === r.getCurrentStepIndex()
                //        ? (o.classList.remove("d-none"), o.classList.add("d-inline-block"), s.classList.add("d-none"))
                //        :  5 === r.getCurrentStepIndex() ? (o.classList.add("d-none"), s.classList.add("d-none")) : (o.classList.remove("d-inline-block"), o.classList.remove("d-none"), s.classList.remove("d-none"))
                //}

                //)
                //)
                , r.on("kt.stepper.next", (function (e) {
                console.log("stepper.next");
                // var t = a[e.getCurrentStepIndex() - 1];
                // t ? t.validate().then((function (t) {
                //     console.log("validated!"), "Valid" == t ? (e.goNext(), KTUtil.scrollTop()) : Swal.fire({
                //         text: "متاسفانه در روند عملیات مشکلی بوجود آمده است. مجددا تلاش کنید",
                //         icon: "error",
                //         buttonsStyling: !1,
                //         confirmButtonText: "باشه",
                //         customClass: {confirmButton: "btn btn-light"}
                //     }).then((function () {
                //         KTUtil.scrollTop()
                //     }))
                // })) :
                (e.goNext(), KTUtil.scrollTop())
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
                    WardTitle: {validators: false}
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
                    GeneralTechnicalSpecification: {validators: {notEmpty: {message: "لطفا مشخصات کلی را وارد کنید"}}},
                    PersianTitle: {validators: {notEmpty: {message: "لطفا عنوان فارسی را وارد کنید"}}},
                    EquipmentTitle: {validators: {notEmpty: {message: "لطفا عنوان تجهیز را وارد کنید"}}},
                    UsageTypeId: {validators: {notEmpty: {message: "لطفا نوع کاربری را وارد کنید"}}},
                    CountryId: {validators: {notEmpty: {message: "لطفا کشور سازنده را وارد کنید"}}},
                    CompanyName: {validators: {notEmpty: {message: "لطفا کمپانی سازنده را وارد کنید"}}},
                    EquipmentUsage: {validators: {notEmpty: {message: "لطفا کاربرد تجهیز را وارد کنید"}}},
                    RelatedSectionId: {validators: {notEmpty: {message: "لطفا بخش مرتبط را وارد کنید"}}},
                    Model: {validators: {notEmpty: {message: "لطفا مدل را وارد کنید"}}},
                    SerialNumber: {validators: {notEmpty: {message: "لطفا شماره سریال را وارد کنید"}}},
                    InstallationDate: {validators: {notEmpty: {message: "لطفا تاریخ نصب را وارد کنید"}}},
                    ExploitationDate: {validators: {notEmpty: {message: "لطفا تاریخ بهره برداری را وارد کنید"}}},
                    EmploymentStatusId: {validators: {notEmpty: {message: "لطفا وضعیت بکارگیری را وارد کنید"}}},
                    SupplyTypeId: {validators: {notEmpty: {message: "لطفا نوع تامین را وارد کنید"}}},
                    PurchasePriceConstruction: {validators: {notEmpty: {message: "لطفا قیمت خرید یا ساخت را وارد کنید"}}},
                    WarrantyExpirationDate: {validators: {notEmpty: {message: "لطفا تاریخ انقضا گارانتی را وارد کنید"}}},
                    InsuranceExpirationDate: {validators: {notEmpty: {message: "لطفا تاریخ انقضا بیمه را وارد کنید"}}},
                    SpecialCharacteristic: {validators: {notEmpty: {message: "لطفا ویژگی خاص را وارد کنید"}}},
                    BaitulMalNo: {validators: {notEmpty: {message: "لطفا شماره بیت المال را وارد کنید"}}}
                },
                plugins: {
                    trigger: new FormValidation.plugins.Trigger,
                    bootstrap: new FormValidation.plugins.Bootstrap5({
                        rowSelector: ".fv-row",
                        eleInvalidClass: "",
                        eleValidClass: ""
                    })
                }
            }));

            console.log('afasf', r);
            kt_stepper_changed(r);

            //, o.addEventListener("click", (function (e) {
            //    a[3].validate().then((function (t) {
            //        i.submit();
            //        console.log("validated!"), "Valid" == t ? (e.preventDefault(), o.disabled = !0, o.setAttribute("data-kt-indicator", "on"), setTimeout((function () {
            //            o.removeAttribute("data-kt-indicator"), o.disabled = !1, r.goNext()
            //        }), 2e3)) : Swal.fire({
            //            text: "Sorry, looks like there are some errors detected, please try again.",
            //            icon: "error",
            //            buttonsStyling: !1,
            //            confirmButtonText: "Ok, got it!",
            //            customClass: { confirmButton: "btn btn-light" }
            //        }).then((function () {
            //            KTUtil.scrollTop()
            //        }))
            //    }))
            //}))
        }
    }
}();

KTUtil.onDOMContentLoaded((function () {
    KTCreateLaboratory.init()
}));