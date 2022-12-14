
var isModifierKey = (event) => {
    const key = event.keyCode;
    return (event.shiftKey === true || key === 35 || key === 36) || // Allow Shift, Home, End
        (key === 8 || key === 9 || key === 13 || key === 46) || // Allow Backspace, Tab, Enter, Delete
        (key > 36 && key < 41) || // Allow left, up, right, down
        (
            // Allow Ctrl/Command + A,C,V,X,Z
            (event.ctrlKey === true || event.metaKey === true) &&
            (key === 65 || key === 67 || key === 86 || key === 88 || key === 90)
        )
};

var enforceFormat = (event) => {
    // Input must be of a valid number format or a modifier key, and not longer than ten digits
    if (!isNumericInput(event) && !isModifierKey(event)) {
        event.preventDefault();
    }
};

var formatToPhone = (event) => {
    debugger;
    if (isModifierKey(event)) {
        return;
    }

    const input = event.target.value.replace(/\D/g, '').substring(0, 11); // First ten digits of input only
    const areaCode = input.substring(0, 3);
    const middle = input.substring(3, 5);
    const secondMiddle = input.substring(5, 7);
    const last = input.substring(7, 11);

    if (input.length > 6) {
        event.target.value = `(${areaCode}) ${middle} ${secondMiddle} ${last}`;
    } else if (input.length > 3) {
        event.target.value = `(${areaCode}) ${middle} ${secondMiddle}`;
    } else if (input.length > 0) {
        event.target.value = `(${areaCode}`;
    }
};

var initPhoneNumbers = function () {
    const phoneNumbers = document.querySelectorAll(".phoneNumber");
    if (phoneNumbers.length) {
        for (const phoneNumber of phoneNumbers) {
            const id = $(phoneNumber).attr("id");
            const inputElement = document.getElementById(id);
            inputElement.addEventListener('keydown', enforceFormat);
            inputElement.addEventListener('keyup', formatToPhone);
        }
    }
}

var initDatePickers = function () {
    const datepickers = document.querySelectorAll(".datepicker");
    if (datepickers.length) {
        for (const datepicker of datepickers) {
            if (!$(datepicker).hasClass("initDatepicker")) {
                const id = $(datepicker).attr("id");
                kamaDatepicker(id, {
                    placeholder: '???????? : 1400/01/01',
                    twodigit: true,
                    closeAfterSelect: true,
                    forceFarsiDigits: true,
                    markToday: true,
                    markHolidays: true,
                    highlightSelectedDay: true,
                    sync: true,
                    gotoToday: true
                });
                $(datepicker).addClass("initDatepicker");
            }
        }
    }
}

var initSelect = function () {
    const selects = document.querySelectorAll('[data-control="select2"]');
    if (selects.length) {
        for (const select of selects) {
            const id = $(select).attr("id");
            $(select).select2({
                dropdownParent: $(select).closest('form'),
                /*closeOnSelect: false*/
                language: {
                    // You can find all of the options in the language files provided in the
                    // build. They all must be functions that return the string that should be
                    // displayed.
                    errorLoading: function () {
                        return '?????? ???? ???????????? ??????????????';
                    },
                    //inputTooLong: function (args) {
                    //    var overChars = args.input.length - args.maximum;
                    //    var message = '????????????????????, ?????????????? ' + overChars + ' ????????????';
                    //    if (overChars >= 2 && overChars <= 4) {
                    //        message += '??';
                    //    } else if (overChars >= 5) {
                    //        message += '????';
                    //    }
                    //    return message;
                    //},
                    //inputTooShort: function (args) {
                    //    var remainingChars = args.minimum - args.input.length;

                    //    var message = '????????????????????, ?????????????? ' + remainingChars + ' ?????? ?????????? ????????????????';

                    //    return message;
                    //},
                    loadingMore: function () {
                        return ' ?????????? ???????????? ?????????? ?????????? ...';
                    },
                    //maximumSelected: function (args) {
                    //    var message = '???? ???????????? ?????????????? ' + args.maximum + ' ??????????????';

                    //    if (args.maximum >= 2 && args.maximum <= 4) {
                    //        message += '??';
                    //    } else if (args.maximum >= 5) {
                    //        message += '????';
                    //    }

                    //    return message;
                    //},
                    noResults: function () {
                        return '?????????? ???????? ?????? !';
                    },
                    searching: function () {
                        return '???? ?????? ?????????????';
                    }
                }
            });

            $(select).on("change", function (e) {
                var theSelection = $(select).val();

                if (theSelection) {
                    $(select).closest('.fv-plugins-bootstrap5-row-invalid')
                        .removeClass('fv-plugins-bootstrap5-row-invalid').addClass('r-vl-m')
                        .find('.invalid-feedback').hide();
                } else {
                    $(select).closest('.r-vl-m').find('.invalid-feedback').show();
                }
                ;
            });
        }
    }
}

var isNumericInput = (event) => {
    const key = event.keyCode;
    return ((key >= 48 && key <= 57) || // Allow number line
        (key >= 96 && key <= 105) // Allow number pad
    );
};



initPhoneNumbers();
initDatePickers();

function InitComponents() {
    initPhoneNumbers();
    initDatePickers();
    initSelect();
}

function ShowWarning(title) {
    toastr.warning('??????????', title, {
        positionClass: 'toast-bottom-right'
    });
}

function ShowSuccess(title) {
    toastr.success('????????', title, {
        positionClass: 'toast-bottom-right'
    });
}

function ShowInfo(title) {
    toastr.info('??????????', title, {
        positionClass: 'toast-bottom-right'
    });
}

function ShowError(title) {
    toastr.error('??????', title, {
        positionClass: 'toast-bottom-right'
    });
}

// toastr.error('Error', 'Error Title', {
//     // tap to dismiss
//     tapToDismiss: true,
//     // toast class
//     toastClass: 'toast',
//     // container ID
//     containerId: 'toast-container',
//     // debug mode
//     debug: false,
//     // fadeIn, slideDown, and show are built into jQuery
//     showMethod: 'fadeIn',
//     // duration of animation
//     showDuration: 300,
//     // easing function
//     showEasing: 'swing',
//     // callback function
//     onShown: undefined,
//     onHidden: undefined,
//     // hide animation
//     hideMethod: 'fadeOut',
//     // duration of animation
//     hideDuration: 1000,
//     // easing function
//     hideEasing: 'swing',
//     // close animation
//     closeMethod: false,
//     // duration of animation
//     closeDuration: false,
//     // easing function
//     closeEasing: false,
//     // timeout in ms
//     extendedTimeOut: 1000,
//     // you can customize icons here
//     iconClasses: {
//         error: 'toast-error',
//         info: 'toast-info',
//         success: 'toast-success',
//         warning: 'toast-warning'
//     },
//     iconClass: 'toast-info',
//     // toast-top-center, toast-bottom-center, toast-top-full-width
//     // toast-bottom-full-width, toast-top-left, toast-bottom-right
//     // toast-bottom-left, toast-top-right
//     positionClass: 'toast-top-right',
//     // set timeOut and extendedTimeOut to 0 to make it sticky
//     timeOut: 5000,
//     titleClass: 'toast-title',
//     messageClass: 'toast-message',
//     // allows HTML content in the toast?
//     escapeHtml: false,
//     // target container
//     target: 'body',
//     // close button
//     closeHtml: '<button type="button">&times;</button>',
//     // place the newest toast on the top
//     newestOnTop: true,
//     //revent duplicate toasts
//     preventDuplicates: false,
//     // shows progress bar
//     progressBar: false
// })

