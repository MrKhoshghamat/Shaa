const isNumericInput = (event) => {
    const key = event.keyCode;
    return ((key >= 48 && key <= 57) || // Allow number line
        (key >= 96 && key <= 105) // Allow number pad
    );
};

const isModifierKey = (event) => {
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

const enforceFormat = (event) => {
    // Input must be of a valid number format or a modifier key, and not longer than ten digits
    if (!isNumericInput(event) && !isModifierKey(event)) {
        event.preventDefault();
    }
};

const formatToPhone = (event) => {
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

const initPhoneNumbers = function () {
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

const initDatePickers = function () {
    const datepickers = document.querySelectorAll(".datepicker");
    if (datepickers.length) {
        for (const datepicker of datepickers) {
            const id = $(datepicker).attr("id");
            kamaDatepicker(id, {
                placeholder: 'مثال : 1400/01/01',
                twodigit: true,
                closeAfterSelect: true,
                forceFarsiDigits: true,
                markToday: true,
                markHolidays: true,
                highlightSelectedDay: true,
                sync: true,
                gotoToday: true
            });
        }
    }
}

const initSelect = function () {
    const selects = document.querySelectorAll('[data-control="select2"]');
    if (selects.length) {
        for (const select of selects) {
            const id = $(select).attr("id");
            $(select).select2({
                /*closeOnSelect: false*/
                language: {
                    // You can find all of the options in the language files provided in the
                    // build. They all must be functions that return the string that should be
                    // displayed.
                    errorLoading: function () {
                        return 'خطا در دریافت اطلاعات';
                    },
                    //inputTooLong: function (args) {
                    //    var overChars = args.input.length - args.maximum;
                    //    var message = 'Пожалуйста, удалите ' + overChars + ' символ';
                    //    if (overChars >= 2 && overChars <= 4) {
                    //        message += 'а';
                    //    } else if (overChars >= 5) {
                    //        message += 'ов';
                    //    }
                    //    return message;
                    //},
                    //inputTooShort: function (args) {
                    //    var remainingChars = args.minimum - args.input.length;

                    //    var message = 'Пожалуйста, введите ' + remainingChars + ' или более символов';

                    //    return message;
                    //},
                    loadingMore: function () {
                        return ' درحال دریافت موارد بیشتر ...';
                    },
                    //maximumSelected: function (args) {
                    //    var message = 'Вы можете выбрать ' + args.maximum + ' элемент';

                    //    if (args.maximum >= 2 && args.maximum <= 4) {
                    //        message += 'а';
                    //    } else if (args.maximum >= 5) {
                    //        message += 'ов';
                    //    }

                    //    return message;
                    //},
                    noResults: function () {
                        return 'موردی یافت نشد !';
                    },
                    searching: function () {
                        return 'در حال جستجو…';
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
                };
            });
        }
    }
}

initPhoneNumbers();
initDatePickers();

function InitComponents() {
    initPhoneNumbers();
    initDatePickers();
    initSelect();
}
