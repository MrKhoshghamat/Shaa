"use strict";
const KTSaveWard = function () {
    let t, save_btn, s, forms = [], validations = [];
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
                    console.log('result 66', result);
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

                const _form = form_steps[page_index];
                validations[page_index].validate().then((function (validation_result) {
                    console.log('validation_result', validation_result);
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
                            $(form).ajaxSubmit({
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
            const load_content = function () {
                const sel = '#stepper-content-' + stepper.getCurrentStepIndex();
                if (!($(sel).hasClass('init'))) {
                    const _form = form_steps[stepper.getCurrentStepIndex() - 1];
                    if (_form) {
                        $(sel).html(' <div class="sk-cube-grid"> <div class="sk-cube sk-cube1"></div> <div class="sk-cube sk-cube2"></div> <div class="sk-cube sk-cube3"></div> ' +
                            ' <div class="sk-cube sk-cube4"></div>  <div class="sk-cube sk-cube5"></div>  <div class="sk-cube sk-cube6"></div>  <div class="sk-cube sk-cube7"></div>' +
                            ' <div class="sk-cube sk-cube8"></div>  <div class="sk-cube sk-cube9"></div></div>');

                        console.log('_form.data', _form.data());
                        load_content(_form.load_url, _form.data(), function (data) {
                            $(sel).html(data);
                            form = document.querySelector(_form.form_id);
                            validations.push()); 
                            InitComponents();
                            //KTUtil.scrollTop();
                        });
                    }
                }
            };
 
        save_btn = t.querySelector('[data-kt-action="submit"]');

        FormValidation.formValidation(form, {
            fields: _form.fields,
            plugins: {
                trigger: new FormValidation.plugins.Trigger,
                bootstrap: new FormValidation.plugins.Bootstrap5({
                    rowSelector: ".fv-row",
                    eleInvalidClass: "",
                    eleValidClass: ""
                })
            }
        }

        }
    }
}();

KTUtil.onDOMContentLoaded((function () {
    KTSaveWard.init();
}));



var AddNewWard = function () {
    $.ajax({
        url: '/Laboratory/WardPartial',
        method: 'GET',
        data: {
            laboratoryId: $('#LaboratoryId').val(),
            wardTitle: $('#WardTitle').val()
        },
        success: function (res) {
            $('#stepper-content-2').html(res);
        },
        error: function (e) {
        }
    });
}
 