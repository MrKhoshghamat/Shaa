"use strict";
const KTCreateLaboratory = function () {
    let t, o, s, stepper = [], forms = [], validations = [];
    return {
        init: function () {

            const form_steps = [{
                form_id: '#kt_create_laboratory_main_form',
                load_url: '/Laboratory/MainPartial',
                data: function (e) {
                    return {
                        id: $('#LaboratoryId').val()
                    };
                },
                fields: {
                    LaboratoryTitle: { validators: { notEmpty: { message: "لطفا عنوان آزمایشگاه را وارد کنید" } } },
                    PassiveDefenceId: { validators: { notEmpty: { message: "لطفا پدافند غیر عامل را وارد کنید" } } },
                    ApprovalAuthorityId: { validators: { notEmpty: { message: "لطفا مرجع تصویب را وارد کنید" } } },
                    ResearchCenterId: { validators: { notEmpty: { message: "لطفا مرکز تحقیقاتی را وارد کنید" } } },
                    LaboratoryTypeId: { validators: { notEmpty: { message: "لطفا نوع آزمایشگاه را وارد کنید" } } },
                    StandardStatusId: { validators: { notEmpty: { message: "لطفا وضعیت استاندارد را وارد کنید" } } },
                    PhoneNumber: { validators: { notEmpty: { message: "لطفا شماره تماس را وارد کنید" } } },
                    Address: { validators: { notEmpty: { message: "لطفا آدرس را وارد کنید" } } }
                },
                onSuccess: function (result) {
                    $('#kt_create_laboratory_main_form #id').val(result.data.id);
                    $('#LaboratoryId').val(result.data.id);
                    form_steps[0].id = result.data.id
                },
                id: null,
            }, {
                form_id: '#kt_create_laboratory_ward_partial_form',
                load_url: '/Laboratory/WardPartial',
                data: function () {
                    return { laboratoryId: form_steps[0].id };
                },
                fields: {},
                ajaxSubmit: function (succ, err) {
                    $.ajax({
                        url: '/Laboratory/WardPartial',
                        method: 'POST',
                        data: {
                            laboratoryId: $('#LaboratoryId').val(),
                            // wardTitle: $('#WardTitle').val()
                        },
                        success: function (res) {
                            succ(res)
                        },
                        error: function (e) {
                            err(e);
                        }
                    });
                },
                onSuccess: function (result) {
                    $('#kt_create_laboratory_ward_form #id').val(result.data.id);
                    form_steps[1].id = result.data.id;
                },
                id: null,
            }, {
                form_id: '#kt_create_laboratory_equipment_partial_form',
                load_url: '/Laboratory/EquipmentPartial',
                data: function () {
                    return { laboratoryId: form_steps[0].id };
                },
                fields: {
                    //EquipmentTypeId: { validators: { notEmpty: { message: "لطفا نوع تجهیز را وارد کنید" } } },
                    //GeneralTechnicalSpecification: { validators: { notEmpty: { message: "لطفا مشخصات فنی را وارد کنید" } } },
                    //PersianTitle: { validators: { notEmpty: { message: "لطفا عنوان فارسی را وارد کنید" } } },
                    //EquipmentTitle: { validators: { notEmpty: { message: "لطفا عنوان انگلیسی را وارد کنید" } } },
                    //Model: { validators: { notEmpty: { message: "لطفا مدل را وارد کنید" } } },
                    //EquipmentUsage: { validators: { notEmpty: { message: "لطفا کاربرد تجهیز را وارد کنید" } } },
                    //CountryId: { validators: { notEmpty: { message: "لطفا کشور را وارد کنید" } } },
                    //CompanyName: { validators: { notEmpty: { message: "لطفا نام کشور سازتده را وارد کنید" } } },
                    //RelatedSectionId: { validators: { notEmpty: { message: "لطفا بخش مرتبط را وارد کنید" } } },
                    //BaitulMalNo: { validators: { notEmpty: { message: "لطفا شماره بیت المال را وارد کنید" } } },
                    //SerialNumber: { validators: { notEmpty: { message: "لطفا شماره سریال را وارد کنید" } } },
                    //InstallationDate: { validators: { notEmpty: { message: "لطفا تاریخ نصب را وارد کنید" } } },
                    //ExploitationDate: { validators: { notEmpty: { message: "لطفا تاریخ بهره برداری را وارد کنید" } } },
                    //EquipmentStatusId: { validators: { notEmpty: { message: "لطفا وضعیت تجهیز را وارد کنید" } } },
                    //EmploymentStatusId: { validators: { notEmpty: { message: "لطفا وضعیت بکارگیری را وارد کنید" } } },
                    //SupplyTypeId: { validators: { notEmpty: { message: "لطفا نوع تامین دستگاه را وارد کنید" } } },
                    //PurchasePriceConstruction: { validators: { notEmpty: { message: "لطفا قیمت ساخت / خرید را وارد کنید" } } },
                    //SpecialCharacteristic: { validators: { notEmpty: { message: "لطفا ویژگی های خاص را وارد کنید" } } }
                },
                ajaxSubmit: function (succ, err) {
                    $.ajax({
                        url: '/Laboratory/EquipmentPartial',
                        method: 'POST',
                        data: {
                            laboratoryId: $('#LaboratoryId').val(),
                            // wardTitle: $('#WardTitle').val()
                        },
                        success: function (res) {
                            succ(res)
                        },
                        error: function (e) {
                            err(e);
                        }
                    });
                },
                onSuccess: function (result) {
                    console.log('result 86', result);
                    $('#kt_create_laboratory_equipment_form #id').val(result.data.id);
                    form_steps[2].id = result.data.id;
                },
                id: null,
            }, {
                form_id: '#kt_create_laboratory_ability_partial_form',
                load_url: '/Laboratory/AbilityPartial',
                data: function () {
                    return { laboratoryId: $('#LaboratoryId').val(), };
                },
                ajaxSubmit: function (succ, err) {
                    $.ajax({
                        url: '/Laboratory/AbilityPartial',
                        method: 'POST',
                        data: {
                            laboratoryId: $('#LaboratoryId').val(),
                            // wardTitle: $('#WardTitle').val()
                        },
                        success: function (res) {
                            succ(res)
                        },
                        error: function (e) {
                            err(e);
                        }
                    });
                },
                fields: {
                    AbilityTitle: { validators: { notEmpty: { message: "لطفا عنوان توانمندی را وارد کنید" } } }
                }
            }, {
                form_id: '#kt_create_laboratory_confirm_partial_form',
                load_url: '/Laboratory/ConfirmPartial',
                data: function () {
                    return { laboratoryId: $('#LaboratoryId').val(), };
                },
                //ajaxSubmit: function (succ, err) {
                //    $.ajax({
                //        url: '/Laboratory/AbilityPartial',
                //        method: 'POST',
                //        data: {
                //            laboratoryId: $('#LaboratoryId').val(),
                //            // wardTitle: $('#WardTitle').val()
                //        },
                //        success: function (res) {
                //            succ(res)
                //        },
                //        error: function (e) {
                //            err(e);
                //        }
                //    });
                //},
                fields: {
                    // AbilityTitle: { validators: { notEmpty: { message: "لطفا عنوان توانمندی را وارد کنید" } } }
                }
            }
            ];

            const submit_step = function (page_index, succeed, failed) {

                if (!forms[page_index]) {
                    succeed();
                    return;
                }

                const _form = form_steps[page_index];
                validations[page_index].validate().then((function (validation_result) {
                    if (validation_result === "Valid") {
                        if (typeof _form.ajaxSubmit === "function") {
                            _form.ajaxSubmit(function (res) {
                                if (res.success == false) {
                                    failed();

                                    if (res.errors)
                                        ShowError(res.errors[0].message);
                                    else
                                        ShowSuccess('عملیات موفقیت آمیز نبود');

                                } else {
                                    if (typeof _form.onSuccess === "function") {
                                        _form.onSuccess(res);
                                    }
                                    succeed();

                                    if (res.success == true)
                                        ShowSuccess('اطلاعات با موفقیت ذخیره شد');
                                }
                            }, function (e) {
                                failed();
                            });
                        } else {
                            $(forms[page_index]).ajaxSubmit({
                                success: function (res) {
                                    if (res.success == false) {
                                        failed();

                                        if (res.errors)
                                            ShowError(res.errors[0].message);
                                        else
                                            ShowSuccess('عملیات موفقیت آمیز نبود');

                                    } else {
                                        if (typeof _form.onSuccess === "function") {
                                            _form.onSuccess(res);
                                        }
                                        succeed();

                                        if (res.success == true)
                                            ShowSuccess('اطلاعات با موفقیت ذخیره شد');
                                    }
                                },
                                error: function (e) {
                                    failed();
                                }
                            });
                        }
                    } else {
                        Swal.fire({
                            text: "در روند عملیات خطا رخ داده است ، لطفا پس از بررسی دوباره اقدام نمایید.",
                            icon: "error",
                            buttonsStyling: !1,
                            confirmButtonText: "می پذیرم!",
                            customClass: { confirmButton: "btn btn-light" }
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
                        $(sel).html(' <div class="sk-cube-grid"> <div class="sk-cube sk-cube1"></div> <div class="sk-cube sk-cube2"></div> <div class="sk-cube sk-cube3"></div> ' +
                            ' <div class="sk-cube sk-cube4"></div>  <div class="sk-cube sk-cube5"></div>  <div class="sk-cube sk-cube6"></div>  <div class="sk-cube sk-cube7"></div>' +
                            ' <div class="sk-cube sk-cube8"></div>  <div class="sk-cube sk-cube9"></div></div>');

                        load_content(_form.load_url, _form.data(), function (data) {
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
                            InitComponents();
                            KTUtil.scrollTop();
                        });
                    }
                }
            };
            const kt_stepper_changed = function (e) {
                5 === stepper.getCurrentStepIndex()
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
    KTCreateLaboratory.init();
}));

function OpenWardWindow(modelId, laboratoryId, ) {
    openDialog("Ward-dialog", 'بخش', '/Laboratory/WardWindow', {
        Id: modelId,
        LaboratoryId: laboratoryId
    }, function (res) {
        InitComponents();
    }, "modal-xl")
}

function OpenEquipmentWindow(modelId, laboratoryId) {
    openDialog("Equipment-dialog", 'تجهیز', '/Laboratory/EquipmentWindow', {
        Id: modelId,
        LaboratoryId: laboratoryId
    }, function (res) {
        InitComponents();
    }, "modal-xl")
}

function OpenAbilityWindow(modelId, laboratoryId) {
    openDialog("Ability-dialog", 'توانمندی', '/Laboratory/AbilityWindow', {
        Id: modelId,
        LaboratoryId: laboratoryId
    }, function (res) {
        InitComponents();
    }, "modal-xl")
}

