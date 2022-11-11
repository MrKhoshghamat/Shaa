var HandelLoading = true;
const loadingHtmlString = '<div class="row text-center">' +
    '<h3>در حال دریافت اطلاعات ...</h3>' +
    '<div class="progress progress-striped active page-progress-bar">' +
    '<div class="progress-bar" style="width: 100%;"></div>' +
    '</div>' +
    '</div>';

if (!String.prototype.startsWith) {
    String.prototype.startsWith = function (searchString, position) {
        position = position || 0;
        return this.indexOf(searchString, position) === position;
    };
}

var TrueStr = "<div style='text-align:center'>" + "<img src='/Content/Images/Icons/Check.png' width='30' height='30'/>" + "</div>";
var FalseStr = "<div style='text-align:center'>" + "<img src='/Content/Images/Icons/Close.png' width='30' height='30' />" + "</div>";

function getBooleanStr(prop) {
    var checkProp = false;
    checkProp = prop;
    if (checkProp == true) {
        return TrueStr;
    }
    else {
        return FalseStr;
    }
}
function IsJson(str) {

    try {
        JSON.parse(str);
    } catch (e) {
        return false;
    }

    return true;
}

function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

function LoadingSubmitBtn(dialog) {
    $(dialog).find('.btnSubmit').attr('disabled', 'disabled');
    $(dialog).find('.btnSubmit').html('<i class="fa fa-fw fa-spinner fa-spin"></i> در حال ارسال اطلاعات ... ');
}

function ResetSubmitBtn(dialog) {
    $(dialog).find('.btnSubmit').html('<i class="fa fa-save fa-fw"></i> ثبت ');
    $(dialog).find('.btnSubmit').removeAttr('disabled');
}

function closeOpenDialogContent(element) {
    $(element).closest('.modal').modal('hide');
} 

function dialogSubmit(btn) {
    $(btn).closest('.modal-content').find('form').submit();
} 

function makeDialogStructure(id, title, classStr) {
    classStr = (classStr) ? classStr : "modal-lg";
    return `<div class="modal fade" id="${id}" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog ${classStr}" >
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">${title}</h5>
                        <button type="button" class="btn-close" onclick="removeOpenDialogContent(this)" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body"  id="content-${id}">  
                    </div>

                </div>
            </div>
        </div> `; 
}

function openDialog(dialogId, title, url, param,succ, classStr) { 
    var dialogStructureHtml = makeDialogStructure2(dialogId, title, classStr);

    $('#dialog-contents #' + dialogId).remove();
    $('#dialog-contents').append(dialogStructureHtml);

    $('#dialog-contents #' + dialogId).modal('show');
 
    $('#dialog-contents #' + dialogId).find('.modal-body')
        .html('<p class="text-center"><i class="fa fa-2x fa-spin fa-spinner"></i> درحال دریافت اطلاعات...</p>')
        .load(url, param, function (response, status, xhr) {
            if (status == 'error') {
                swal('خطا در دریافت اطلاعات');
            } else
                if (IsJson(response)) {
                    var jsondata = JSON.parse(response);
                    if (jsondata.hasOwnProperty('errorCode')) {
                        if (jsondata['errorCode'] == 'UnAuthorize') {
                            $('#' + dialogId).modal('hide');
                            $('#dialog-contents #' + dialogId).find('.modal-body').html(jsondata['errorMessage']);
                            swal(jsondata['errorMessage']);
                        }
                    }
                };

            succ(response);
        });
}
 
function makeDialogStructure2(id, title, classStr) {
    classStr = (classStr) ? classStr : "modal-lg";

    return `<div class="modal fade" id="${id}" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" role="dialog">
                <div class="modal-dialog ${classStr}">
                    <div class="modal-content">
                        <div class="modal-header" style="direction: ltr;">
                          <button type="button" class="close btn-close" data-bs-dismiss="modal" aria-label="Close"  onclick="closeOpenDialogContent(this)"></button>
                          <h4 class="modal-title">${title}</h4>
                        </div>
                        <div class="modal-body" id="content-${id}">
                        </div>
                    </div>
                </div>
            </div>`;  
}
  
function ValidNationalNo(e) {
    if (e == "0000000000" || e == "1111111111" || e == "2222222222" || e == "3333333333" || e == "4444444444" || e == "5555555555" || e == "6666666666" || e == "7777777777" || e == "8888888888" || e == "9999999999") {
        return false;
    }
    var g = parseInt(e.charAt(9)); var f = parseInt(e.charAt(0)) * 10 + parseInt(e.charAt(1)) * 9 + parseInt(e.charAt(2)) * 8 + parseInt(e.charAt(3)) * 7 + parseInt(e.charAt(4)) * 6 + parseInt(e.charAt(5)) * 5 + parseInt(e.charAt(6)) * 4 + parseInt(e.charAt(7)) * 3 + parseInt(e.charAt(8)) * 2; var b = f - parseInt(f / 11) * 11; if ((b == 0 && b == g) || (b == 1 && g == 1) || (b > 1 && g == 11 - b)) {
        return true;
    } else {
        return false;
    }
}
function AddScript(src, selectorbox) {
    if (selectorbox == undefined) selectorbox = 'head';
    if ($('script[src="' + src + '"]').length == 0)
        $(selectorbox).append('<script src="' + src + '"> </script>');
}


function GritterSuccess(title, text, time) {
    $.gritter.add({
        title: title,
        text: text,
        time: time,
        class_name: 'gritter-success gritter-light',
    });
}

function GritterError(title, text, time) {
    $.gritter.add({
        title: title,
        text: text,
        time: time,
        class_name: 'gritter-error gritter-light',
    });
}

function Showgritter(title, text, time) {
    GritterSuccess(title, text, time);
}
function initScroll(ElementId) {
    var hT = $('#' + ElementId).offset().top,
        hH = $('#' + ElementId).outerHeight(),
        wH = $(window).height(),
        wS = $(this).scrollTop();
    if ($('#' + ElementId).attr("ScrollUpdate") == 0 || $('#' + ElementId).attr("ScrollUpdate") == undefined) {
        if (wS > (hT + hH - wH)) {
            $('#' + ElementId).attr("ScrollUpdate", 1);
            return true;
        }
    }
}
function HideModal(selector) {
    //$('.modal-backdrop').hide();
    //$('body').removeClass('modal-open');
    //$(selector).modal('hide');
    $(selector).find(' .modal-header button[data-dismiss=modal]').click()
}

function updateForm(responseText, statusText) {
    var err = true;
    $(".field-validation-valid").text('');
    $("*").removeClass("input-validation-error");
    $("* .validationInfo").hide();

    if (responseText.Errors && responseText.Errors.length) {
        for (var i in responseText.Errors) {
            $('#' + responseText.Errors[i].PropertyName).addClass("input-validation-error");
            if (responseText.Errors[i].Message != '*') {
                $('#' + responseText.Errors[i].PropertyName).html(responseText.Errors[i].Message).show();
            }
            err = false;
        }
    }

    return err;
}

function updateForm_b5(responseText, statusText) {
    var err = true;
    $(".field-validation-valid").text('');
    $("*").removeClass("input-validation-error");
    $("* .validationInfo").hide();
    $("* .b5-validationInfo").hide();

    if (responseText.Errors && responseText.Errors.length) {
        for (var i in responseText.Errors) {
            $('#' + responseText.Errors[i].PropertyName).addClass("input-validation-error");
            $('.' + responseText.Errors[i].PropertyName + '_ContainerBox').addClass("input-validation-error");

            if (responseText.Errors[i].Message != '*') {
                $('span[data-valmsg-for="' + responseText.Errors[i].PropertyName + '"]')
                    .html('<span id="Title-error" class="">' + responseText.Errors[i].Message + '</span>').show();

                $('#' + responseText.Errors[i].PropertyName + ' .messageInfo').html(responseText.Errors[i].Message);
                $('#' + responseText.Errors[i].PropertyName).removeClass('d-none');
            }

            err = false;
        }
    }

    return err;
}

function headingtoggle(obj) {
    $(obj).next().toggle();
    if ($(obj).find('a').hasClass('Arrow-Down')) {
        $(obj).find('a').removeClass('Arrow-Down');
        $(obj).find('a').addClass('Arrow-Up');
    }
    else {
        $(obj).find('a').addClass('Arrow-Down');
        $(obj).find('a').removeClass('Arrow-Up');
    }

}
jQuery.fn.extend({
    insertAtCaret: function (myValue) {
        return this.each(function (i) {
            if (document.selection) {
                this.focus();
                sel = document.selection.createRange();
                sel.text = myValue;
                this.focus();
            }
            else if (this.selectionStart || this.selectionStart == '0') {
                var startPos = this.selectionStart;
                var endPos = this.selectionEnd;
                var scrollTop = this.scrollTop;
                this.value = this.value.substring(0, startPos) + myValue + this.value.substring(endPos, this.value.length);
                this.focus();
                this.selectionStart = startPos + myValue.length;
                this.selectionEnd = startPos + myValue.length;
                this.scrollTop = scrollTop;
            } else {
                this.value += myValue;
                this.focus();
            }
        })
    }
});
function CorrectEspecialPersianChars() {
    $("textarea, input:text").unbind('keypress.setpersianchar').on('keypress.setpersianchar', function (e) {
        var _which = e.which;
        switch (e.which) {
            case 1610: _which = 1740; break;
            case 1603: _which = 1705; break;
            case 1776: _which = 48; break;
            case 1777: _which = 49; break;
            case 1778: _which = 50; break;
            case 1779: _which = 51; break;
            case 1780: _which = 52; break;
            case 1781: _which = 53; break;
            case 1782: _which = 54; break;
            case 1783: _which = 55; break;
            case 1784: _which = 56; break;
            case 1785: _which = 57; break;
            default:
        }
        if (_which != e.which) {
            $(this).insertAtCaret(String.fromCharCode(_which));
            e.which = 0;
            return false;
        }
    }).unbind('paste.setpersianchar').on('paste.setpersianchar', function () {
        var element = this;
        setTimeout(function () {
            $(element).val(ReplacePersianChar($(element).val()))
        }, 5);
    });
};
function ReplacePersianChar(str) {
    if (!str)
        return '';
    return str.replace(/ي/g, "ی").replace(/ك/g, "ک")
        .replace(/۱/g, "1").replace(/۲/g, "2").replace(/۳/g, "3").replace(/۴/g, "4").replace(/۵/g, "5")
        .replace(/۶/g, "6").replace(/۷/g, "7").replace(/۸/g, "8").replace(/۹/g, "9").replace(/۰/g, "0");
}
var EmplementSearchClick = function (e) {
    var keyCode = e.keyCode || e.which;
    if (keyCode === 13) {
        return false;
    }
}


// let's add our method on String prototype.
String.prototype.contains = contains;
function contains(str) {
    return this.indexOf(str) > -1;
}

var document_ajaxSend = function (event, jqxhr, settings) {
    var isAwesome = settings && settings.data && typeof settings.data == "string" && settings.data.startsWith("__aweconid");
    var hideloding = settings && settings.url && settings.url.contains("hideloading");

    if (isAwesome || hideloding) {
        // do somthing ...
    } else {
        document.body.style.cursor = 'progress';
        //if (HandelLoading == true) {
        //    HandelLoading == false;
        $('#DivLoading').css("display", "block");
    }
}

//var document_ajaxStart = function (e) {
//    console.log('e', e);

//    document.body.style.cursor = 'progress';
//    //if (HandelLoading == true) {
//    //    HandelLoading == false;
//    $('#DivLoading').css("display", "block");
//    //}
//}

var document_ajaxComplete = function (event, xhr, options) {
    document.body.style.cursor = 'default';
    $('#DivLoading').css("display", "none");
    CorrectEspecialPersianChars();
}

var document_ajaxError = function (event, xhr, options) {
    document.body.style.cursor = 'default';
    $('#DivLoading').css("display", "none");
    CorrectEspecialPersianChars();
}

function bindAjaxLoading(load) {
    if (load) {
        $(document).bind("ajaxSend", document_ajaxSend);
        $(document).bind("ajaxComplete", document_ajaxComplete);
        $(document).bind("ajaxError", document_ajaxError);
    } else {
        $(document).unbind("ajaxSend");
        $(document).unbind("ajaxComplete");
        $(document).unbind("ajaxError");
    }
}

$(document).ready(function () {
    //$('.searchtxt').keyup(function (e) {
    //    if (e.keyCode == 13) {
    //        $(".searchtxt").change();
    //    }
    //});

    $('input').unbind('keypress', EmplementSearchClick)
        .on('keypress', EmplementSearchClick);

    $.ajaxSetup({
        dataType: "json",
        dataFilter: function (data, type) {
            if (typeof data === "string" && data.substring(0, 1) == '{') {
                try {
                    var msg = $.parseJSON(data);
                    if (msg.errorMessage != 'undefined')
                        switch (msg.errorMessage) {
                            case 'UnAuthenticated': {
                                return;
                            }
                            default:
                        }
                }
                catch (e) {

                }
            }
            return data;
        }
        ,
        error: function (jqXHR, textStatus, errorThrown) {
        },
        statusCode: {
            403: function () {
                alert("Page not found.");
            },
            404: function () {
                alert("Page not found.");
            }
        },
    });

    CorrectEspecialPersianChars();

    bindAjaxLoading(true);


    //$(document).bind("ajaxStart", document_ajaxStart);
    //$(document).bind("ajaxComplete", document_ajaxStart);

    //$(document).bind("ajaxComplete.mine", function () {
    //    $('#DivLoading').css("display", "none");
    //});

    //$(document).ajaxStart(function (e) {


    //    if (HandelLoading == true) {
    //        $('#DivLoading').css("display", "block");
    //    }

    //    setTimeout(function () { HandelLoading = true; }, 10);
    //});

    //$(document).ajaxComplete(function (e) {


    //    $('#DivLoading').css("display", "none");
    //    HandelLoading = true;
    //    CorrectEspecialPersianChars();
    //});
});


SessionUpdater = (function () {
    var clientMovedSinceLastTimeout = false;
    var keepSessionAliveUrl = null;
    var timeout = 5 * 1000 * 60; // 5 minutes

    function setupSessionUpdater(actionUrl) {
        keepSessionAliveUrl = actionUrl;
        listenForChanges();
        checkToKeepSessionAlive();
    }

    function listenForChanges() {
        //$("body").one("mousemove keydown", function () {

        //});
        clientMovedSinceLastTimeout = true;
    }
    function checkToKeepSessionAlive() {
        setTimeout(function () { keepSessionAlive(); }, timeout);
    }

    function keepSessionAlive() {
        HandelLoading = false;
        if (clientMovedSinceLastTimeout && keepSessionAliveUrl != null) {
            $.ajax({
                type: "POST",
                url: keepSessionAliveUrl,
                success: function (data) {
                    clientMovedSinceLastTimeout = false;
                    listenForChanges();
                    checkToKeepSessionAlive();
                },
                error: function (data) {
                    console.log("Error posting to " & keepSessionAliveUrl);
                }
            });
        }
    }
    return {
        Setup: setupSessionUpdater
    };
})();

function ShowReport(selectedKey, UnSelectedMessage, QueryString) {
    if (selectedKey != null) {
        var url = "/Reporting/ShowReport?" + QueryString;
        url = encodeURI(url);
        window.open(url, '_blank'
            // 'status=1,toolbar=1,menubar=0,scrollbars=1,resizable=1,location=1,width=700,height=500'
        );
    }
    else
        alert(UnSelectedMessage);
}
function PrintReportWithOutPreview(selectedKey, UnSelectedMessage, QueryString) {
    if (selectedKey != null) {
        var url = "/Reporting/PrintReportWithOutPreview?" + QueryString;
        url = encodeURI(url);
        $.getJSON(url, {}, function (data) {
            if (data == "Ok") {
                GritterSuccess('موفق', 'پرینت با موفقیت ارسال شد');
            }
            else {
                GritterError('توجه !', 'خطا در پرینت');
            }
        });
        //window.open(url, '_blank');
    }
    else
        alert(UnSelectedMessage);
}
function ShowDesigner(selectedKey, UnSelectedMessage, QueryString) {
    if (selectedKey != null) {
        var url = "/Reporting/ShowDesigner?" + QueryString + "&reload=true";
        url = encodeURI(url);
        window.open(url, '_blank'
            // 'status=1,toolbar=1,menubar=0,scrollbars=1,resizable=1,location=1,width=700,height=500'
        );
    }
    else
        alert(UnSelectedMessage);
}

function PrintPdfReport(selectedKey, UnSelectedMessage, QueryString) {
    if (selectedKey != null) {
        var url = "/Reporting/ReportAsPdf?" + QueryString;
        url = encodeURI(url);
        window.open(url, '_blank'
            // 'status=1,toolbar=1,menubar=0,scrollbars=1,resizable=1,location=1,width=700,height=500'
        );
    }
    else
        alert(UnSelectedMessage);
}
!function (e) { "use strict"; function t(t) { var n = e(""); try { n = e(t).clone() } catch (r) { n = e("<span />").html(t) } return n } function n(t, n, r) { var o = e.Deferred(); try { t = t.contentWindow || t.contentDocument || t; var a = t.document || t.contentDocument || t; r.doctype && a.write(r.doctype), a.write(n), a.close(); var i = !1, c = function () { if (!i) { t.focus(); try { t.document.execCommand("print", !1, null) || t.print(), e("body").focus() } catch (n) { t.print() } t.close(), i = !0, o.resolve() } }; e(t).on("load", c), setTimeout(c, r.timeout) } catch (l) { o.reject(l) } return o } function r(t, r) { var a = e(r.iframe + ""), i = a.length; 0 === i && (a = e('<iframe height="0" width="0" border="0" wmode="Opaque"/>').prependTo("body").css({ position: "absolute", top: -999, left: -999 })); var c = a.get(0); return n(c, t, r).done(function () { setTimeout(function () { 0 === i && a.remove() }, 1e3) }).fail(function (e) { console.error("Failed to print from iframe", e), o(t, r) }).always(function () { try { r.deferred.resolve() } catch (e) { console.warn("Error notifying deferred", e) } }) } function o(e, t) { var r = window.open(); return n(r, e, t).always(function () { try { t.deferred.resolve() } catch (e) { console.warn("Error notifying deferred", e) } }) } function a(e) { return !!("object" == typeof Node ? e instanceof Node : e && "object" == typeof e && "number" == typeof e.nodeType && "string" == typeof e.nodeName) } e.print = e.fn.print = function () { var n, i, c = this; c instanceof e && (c = c.get(0)), a(c) ? (i = e(c), arguments.length > 0 && (n = arguments[0])) : arguments.length > 0 ? (i = e(arguments[0]), a(i[0]) ? arguments.length > 1 && (n = arguments[1]) : (n = arguments[0], i = e("html"))) : i = e("html"); var l = { globalStyles: !0, mediaPrint: !1, stylesheet: null, noPrintSelector: ".no-print", iframe: !0, append: null, prepend: null, manuallyCopyFormValues: !0, deferred: e.Deferred(), timeout: 750, title: null, doctype: "<!doctype html>" }; n = e.extend({}, l, n || {}); var d = e(""); n.globalStyles ? d = e("style, link, meta, base, title") : n.mediaPrint && (d = e("link[media=print]")), n.stylesheet && (d = e.merge(d, e('<link rel="stylesheet" href="' + n.stylesheet + '">'))); var s = i.clone(); if (s = e("<span/>").append(s), s.find(n.noPrintSelector).remove(), s.append(d.clone()), n.title) { var f = e("title", s); 0 === f.length && (f = e("<title />"), s.append(f)), f.text(n.title) } s.append(t(n.append)), s.prepend(t(n.prepend)), n.manuallyCopyFormValues && (s.find("input").each(function () { var t = e(this); t.is("[type='radio']") || t.is("[type='checkbox']") ? t.prop("checked") && t.attr("checked", "checked") : t.attr("value", t.val()) }), s.find("select").each(function () { var t = e(this); t.find(":selected").attr("selected", "selected") }), s.find("textarea").each(function () { var t = e(this); t.text(t.val()) })); var u = s.html(); try { n.deferred.notify("generated_markup", u, s) } catch (p) { console.warn("Error notifying deferred", p) } if (s.remove(), n.iframe) try { r(u, n) } catch (m) { console.error("Failed to print from iframe", m.stack, m.message), o(u, n) } else o(u, n); return this } }(jQuery);

function AddEntityToBlackList(entityid, recordid, callback, WindowStateId) {
    openDialog("blacklist-dialog", '<i class="fa fa-fw fa-lock"></i>افزودن / <i class="fa fa-fw fa-unlock"></i> خارج کردن <span>(لیست سیاه)</span>',
        '/Admin/BlackList/BlackListWindow',
        {
            EntityId: entityid,
            EntityRecordId: recordid,
            CallbackFunction: callback,
            WindowStateId: WindowStateId
        });
}

function openEntityArchive(grid, entityid) {
    var selectedItems = $('#' + grid).data('api').getSelection();
    if (selectedItems == '')
        swal("اطلاع", "لطفا ابتدا یک رکورد را انتخاب نمایید !", "error");
    else {
        EntityArchive(entityid, selectedItems[0].PersonId);
    }
}

function EntityArchive(entityid, recordid) {
    openDialog("entityarchive-dialog", '<i class="fa fa-fw fa-folder"></i> آرشیو الکترونیکی ', '/Admin/Archive/Index', { EntityId: entityid, EntityRecordId: recordid }, "fullscreen");
}


function InitToggleDropdown() {
    $('input.with_handler').each(function () {
        var id = $(this).attr('id');

        var SpSortDescleft = '19px';

        if ($(this).hasClass('advanced_serach')) {
            SpSortDescleft = '47px';

            $(this).parent().append('<span onclick="showAdvanceSearchDropdown(&quot;' + id + '&quot;)" style="padding:5px;cursor:pointer;left:19px;" class="btn1 input-group-addon1 closed SpFilter" id="btnSpFilter">' +
                '<img src="/Content/Icons/btnSearch.png"></span>');
        }


        $(this).parent().append('<span onclick="toggleDropdown(this)" style="padding:5px;cursor:pointer;left:' + SpSortDescleft + '" class="btn1 input-group-addon1 closed SpSortDesc" id="btnSpSortDesc">' +
            //'<img src="/Content/Icons/SortDesc10x5.png"></span>'
            '<i class="fa fa-angle-down"></i>'
        );


        $(this).removeClass('with_handler');
    })
}

function toggleDropdown(btn) {
    if ($(btn).hasClass('closed')) {
        $(btn).parent().find('.ui-autocomplete-input').autocomplete("search", " ");
        $(btn).removeClass('closed');
        //$(btn).html('<img src="/Content/Icons/SortAsc10x5.png">');
    } else {
        $(btn).addClass('closed');
        $(btn).parent().find('.ui-autocomplete-input').autocomplete("close");
    }
}

function showAdvanceSearchDropdown(id) {
    var auto = $('#' + id);
    openDialog($(auto).attr("popupformpnl"), $(auto).attr("popupformtitle"), $(auto).attr("popupformurl"), {})
}

document.onkeydown = function (e) {
    e = e || window.event;
    var key = e.which || e.keyCode;
    if ((key === 114 || (e.ctrlKey && e.keyCode === 13)) && e.target.classList[0] == "advanced_serach") {
        e.preventDefault();
        openDialog($(e.target).attr("popupformpnl"), $(e.target).attr("popupformtitle"), $(e.target).attr("popupformurl"), {})
    }
}


function aweselectId(gridid) {
    var GridSelected = $('#' + gridid).data('api').getSelection();
    var selectedId;

    if (typeof GridSelected != 'undefined' && GridSelected[0] != null) {
        $('#' + gridid).data("selectedId", GridSelected[0].Id);
        return GridSelected[0].Id;
    }
    else {
        var selectedId = $('#' + gridid).data("selectedId");

        $('#' + gridid + ' .awe-row').removeClass('awe-selected');
        $('#' + gridid + ' .awe-row').each(function () {
            if ($(this).data() && $(this).data().model && $(this).data().model.Id)
                if ($(this).data().model.Id == selectedId) {
                    $(this).addClass('awe-selected'); return false;
                }
        });

        $('#' + gridid).trigger('aweselect');

        return selectedId;
    }
}


function SetRecordNotFound(gridid) {
    if (!$('#' + gridid + ' .awe-content .awe-tbody tr').length) {
        var colSpanCount = $('#' + gridid + ' .awe-header .awe-col').length;
        $('#' + gridid + ' .awe-content .awe-tbody').append('<tr><td colspan="' + colSpanCount +
            '"><center><h4 class= "alert alert-warning"  style="margin: 0!important;"> رکوردی برای نمایش یافت نشد </h4></center></td></tr>');
    }
}


function setColumnSize(gridName) {
    var obj = $('#' + gridName + ' .awe-content .awe-tbody tr');
    obj.css({ "width": "100px", "overflow": "hidden", "white-space": "nowrap", "text-overflow": "ellipsis" });
}


var IsActiveFuncTemplate = function (model) {
    if (model.IsActive == true) {
        return '<div style="text-align:center">' + '<span class="label label-success">فعال</span>' + '</div>';
    }
    else {
        return '<div style="text-align:center">' + '<span class="label label-danger">غیر فعال</span>' + '</div>';
    }
};

function gridLoading1(o) {
    return awem.gridLoading(o, { lhtm: '<div class="sk-chase"><div class="sk-chase-dot"></div><div class="sk-chase-dot"></div><div class="sk-chase-dot"></div><div class="sk-chase-dot"></div><div class="sk-chase-dot"></div><div class="sk-chase-dot"></div></div>', ctm: 0 });
}

function LoadHtmlPartial(panelId, url, data) {
    $(panelId).html('<div class="row text-center"><h3>  <i class="fa fa-spinner fa-spin fa-2x"></i> در حال دریافت اطلاعات ...</h3></div>');
    $.ajax({
        type: "POST",
        url: url,
        data: data,
        dataType: 'html',
        global: false,
        success: function (data) {
            $(panelId).html(data);
        },
        error: function (data) {
        }
    });
}
function GetOnlinePayment(RelatedEntityId, RelatedEntityRecordId, SecondRelatedEntityId,
    SecondRelatedEntityRecordId, ExpenseIncomeId, Amount, Token, RoleType, MetaData, PayInAran) {
    $.post("/Admin/OnlinePayment/GetAuthority", {
        Amount: Amount,
        RelatedEntityId: RelatedEntityId,
        RelatedEntityRecordId: RelatedEntityRecordId,
        SecondRelatedEntityId: SecondRelatedEntityId,
        SecondRelatedEntityRecordId: SecondRelatedEntityRecordId,
        ExpenseIncomeId: ExpenseIncomeId,
        PayInAran: PayInAran,
        MetaData: MetaData,
        JsonCallBack: true,
        //Token: Token,
        //RoleType: RoleType
    }, function (data) {
        console.log(data);
        if (data.PropertyName == "SUCCESS")
            document.location.href = 'https://www.zarinpal.com/pg/StartPay/' + data.Message + '/Sep';
        else
            swal({
                title: "اطلاع",
                text: data.Message,
                icon: "info",
            });
    });
}
function CheckMobileNumberVerification() {
    $.getJSON('/Admin/MobileNumberVerification/CheckMobileNumberVerification', {}, function (data) {
        if (data == false) {
            openDialog("verification-dialog", 'تایید شماره همراه', '/Admin/MobileNumberVerification/VerificationWindow', {});
        }
    });
}

function SelectAddressOnTheMap() {
    $.getJSON('/Admin/Admin/CheckMapAddress', {}, function (data) {
        if (data == false) {
            openDialog("MapAddress-dialog", 'انتخاب محل موسسه / آموزشگاه برروی نقشه', '/Admin/Admin/SelectAddressOnTheMap', {});
        }
    });
}

function openDialogWithIframe(url, title, classStr) {
    $('#entity-print-content-iframe').remove();
    var obj = $(`<div></div>`);
    $(obj).html(`<div id="entity-printDivLoading" class="text-center" style="">
                    <div id="lstLoading">
                        <img style="margin-top: 5px;width:90px;" src="/Content/Images/logo.png" class="tl">
                        <img src="/Content/Images/overlayloading.gif">
                    </div>
                </div>
                    <iframe id="entity-print-content-iframe" src="${url}"
                    onload="$('#entity-printDivLoading').hide();" style="width:100%;height:580px;border:0px;background-color:white" title="فایل ها "></iframe>
                <hr>
                <div class="row">
                    <div class="col-md-12">
                        <div style="float:left">
                            <button type="button" class="btn btn-danger" onclick="closeOpenDialogContent(this)">
                                انصراف
                            </button>
                        </div>
                    </div>
                </div>
            </div>`)
    openDialogHtmlContent("entity-print-dialog-iframe-content", title || "چاپ", $(obj), classStr)
}
function openDialogHtmlContent(dialogId, title, elementselector, classStr) {
    var dialogStructureHtml = makeDialogStructure(dialogId, title, classStr);
    $('#dialog-contents #' + dialogId).remove();
    $('#dialog-contents').append(dialogStructureHtml);
    $('#' + dialogId).modal({
        backdrop: 'static',
        keyboard: true
    });
    $('#' + dialogId).on('hidden.bs.modal', function (event) {
        if ($('.modal:visible').length) {
            $('body').addClass('modal-open');
        }
    });
    $('#dialog-contents #' + dialogId).find('.modal-body')
        .html($(elementselector).html());
}
