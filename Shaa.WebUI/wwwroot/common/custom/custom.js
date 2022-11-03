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

const inputElement = document.getElementById('phoneNumber');
inputElement.addEventListener('keydown', enforceFormat);
inputElement.addEventListener('keyup', formatToPhone);

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
