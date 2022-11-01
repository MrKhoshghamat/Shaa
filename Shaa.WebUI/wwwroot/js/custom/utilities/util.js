var load_content = function (u,d,c) {
    // var xhttp = new XMLHttpRequest();
    // xhttp.onreadystatechange = function () {
    //     if (this.readyState == 4 && this.status == 200) {
    //         c(this.responseText);
    //     }
    // };
    // xhttp.open("GET", u, true);
    // xhttp.send();

    $.ajax({
        type: "GET",
        url: u,
        dataType: "html",
        data: d,
        success: function (response) {  c(response) },
        error: function (xhr, ajaxOptions, thrownError) {
            alert(xhr.status);
            alert(thrownError);
        }
    });
}
 