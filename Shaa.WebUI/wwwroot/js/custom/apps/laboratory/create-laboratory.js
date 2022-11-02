"use strict";
var KTCreateLaboratory = function () {
    let t, o, s, stepper = [], forms = [], validations = [];
    return {
        init: function () {
            const form_steps = [{
                form_id: '#kt_create_laboratory_main_form',
                load_url: '/Laboratory/MainPartial',
                data: {},
                fields: {
                    LaboratoryTitle: {validators: {notEmpty: {message: "لطفا عنوان آزمایشگاه را وارد کنید"}}},
                    PassiveDefenceId: {validators: {notEmpty: {message: "لطفا پدافند غیر عامل را وارد کنید"}}},
                    ApprovalAuthorityId: {validators: {notEmpty: {message: "لطفا مرجع تصویب را وارد کنید"}}},
                    ResearchCenterId: {validators: {notEmpty: {message: "لطفا مرکز تحقیقاتی را وارد کنید"}}},
                    LaboratoryTypeId: {validators: {notEmpty: {message: "لطفا نوع آزمایشگاه را وارد کنید"}}},
                    StandardStatusId: {validators: {notEmpty: {message: "لطفا وضعیت استاندارد را وارد کنید"}}},
                    PhoneNumber: {validators: {notEmpty: {message: "لطفا شماره تماس را وارد کنید"}}},
                    Address: {validators: {notEmpty: {message: "لطفا آدرس را وارد کنید"}}}
                }
            }];

            const submit_step = function (page_index, succeed, failed) {
                if (!forms[page_index]) {
                    succeed();
                    return;
                }

                validations[page_index].validate().then((function (validation_result) {
                    if (validation_result === "Valid") {
                        $(forms[page_index]).ajaxSubmit({
                            success: function (res) {
                                succeed();
                            },
                            error: function (e) {
                                failed();
                            }
                        });
                    } else {
                        Swal.fire({
                            text: "در روند عملیات خطا رخ داده است ، لطفا پس از بررسی دوباره اقدام نمایید.",
                            icon: "error",
                            buttonsStyling: !1,
                            confirmButtonText: "می پذیرم!",
                            customClass: {confirmButton: "btn btn-light"}
                        }).then((function () {
                            KTUtil.scrollTop()
                        }));
                        failed();
                    }
                }));
            };
            const load_step_content = function () {
                const sel = '#stepper-content-' + stepper.getCurrentStepIndex();
                if (!($(sel).hasClass('init'))) {
                    const _form = form_steps[stepper.getCurrentStepIndex() - 1];
                    if (_form) {
                        load_content(_form.load_url, _form.data, function (data) {
                            $(sel).html(data);
                            $(sel).addClass('init');

                            let form = document.querySelector(_form.form_id);
                            validations.push(FormValidation.formValidation(form, {
                                fields: _form.fields,
                                plugins: {
                                    trigger: new FormValidation.plugins.Trigger,
                                    bootstrap: new FormValidation.plugins.Bootstrap5({
                                        rowSelector: ".fv-row",
                                        eleInvalidClass: "",
                                        eleValidClass: ""
                                    })
                                }
                            }));
                            forms.push(form);
                        });
                    }
                }
            };
            const kt_stepper_changed = function (e) {
                4 === stepper.getCurrentStepIndex()
                    ? (o.classList.remove("d-none"), o.classList.add("d-inline-block"), s.classList.add("d-none"))
                    : 5 === stepper.getCurrentStepIndex() ? (o.classList.add("d-none"), s.classList.add("d-none")) :
                        (o.classList.remove("d-inline-block"), o.classList.remove("d-none"), s.classList.remove("d-none"));
                load_step_content();
            };

            // (e = document.querySelector("#kt_modal_create_account")) && new bootstrap.Modal(e),
            //     t = document.querySelector("#kt_create_account_stepper"),
            //     i = t.querySelector("#kt_create_account_form"),
            //     o = t.querySelector('[data-kt-stepper-action="submit"]'),
            //     s = t.querySelector('[data-kt-stepper-action="next"]');

            t = document.querySelector("#kt_create_account_stepper");
            o = t.querySelector('[data-kt-stepper-action="submit"]');
            s = t.querySelector('[data-kt-stepper-action="next"]');
            stepper = new KTStepper(t);
            stepper.on("kt.stepper.changed", kt_stepper_changed);
            stepper.on("kt.stepper.next", (function (e) {
                submit_step(stepper.getCurrentStepIndex() - 1, function () {
                    load_step_content();
                    e.goNext();
                }, function () {
                    //  stepper.goPrevious();
                });
                KTUtil.scrollTop();
            }));
            stepper.on("kt.stepper.previous", (function (e) {
                e.goPrevious();
                KTUtil.scrollTop();
            }))

            kt_stepper_changed(stepper);
        }
    }
}();

KTUtil.onDOMContentLoaded((function () {
    KTCreateLaboratory.init()
}));