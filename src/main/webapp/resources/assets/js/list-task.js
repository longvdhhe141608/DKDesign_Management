function checkvalidate(id) {
    var form = document.querySelector(id);
    console.log(form);
    var name = form.querySelector('#inputaddname');
    var start = form.querySelector('#inputstartdate');
    var end = form.querySelector('#inputenddate');
    var error = form.querySelectorAll('.error');
    var today = new Date();
    var startdate = new Date(start.value);
    var enddate = new Date(end.value);
    var input = form.querySelectorAll('.info-text');
    console.log(today);
    console.log(startdate);
    console.log(enddate);
    let numberEmpty = 0;
    numberEmpty = checkEmpty(input);
    let numberdate = 0;
    numberdate = checkdate(today, startdate, enddate);
    let numberdate1 = 0;
    numberdate1 = checkdate1(today, startdate, enddate);

    function checkEmpty(input) {
        let a = 0;
        for (var i = 0; i < input.length; i++) {
            if (input[i].value.trim() === "") {
                a++;
                error[i].innerHTML = "Vui lòng điền đầy đủ các trường";
            } else {
                error[i].innerHTML = "";
            }
            // input[i].addEventListener('click', function () {
            //     error[i].innerHTML = "";
            // })
        }
        // if (name.value.trim() == "") {
        //     a++;
        //     error[0].innerHTML = "Không được để trống";

        // } else if (startdate === "") {
        //     a++;
        //     error[1].innerHTML = "Không được để trống";
        // } else if (enddate === "") {
        //     a++;
        //     error[2].innerHTML = "Không được để trống";
        // } else {
        //     return a;
        // }
        return a;
    }

    console.log(numberEmpty);

    // console.log(startdate.getFullYear());
    // console.log(today.getFullYear());
    function checkdate(today, startdate, enddate) {
        let b = 0;
        if (startdate.getMonth() + 1 > today.getMonth() + 1 && startdate.getFullYear() >= today.getFullYear() || startdate.getDate() >= today.getDate() && startdate.getMonth() + 1 >= today.getMonth() + 1 && startdate.getFullYear() >= today.getFullYear() || startdate.getFullYear() > today.getFullYear()) {

            return b;

        }
        else {
            b++;
            error[1].innerHTML = "nhập phải lớn hơn ngày hiện tại";
        }
        return b;
    }
    function checkdate1(today, startdate, enddate) {
        let b = 0;
        if (enddate.getMonth() + 1 > startdate.getMonth() + 1 && enddate.getFullYear() >= startdate.getFullYear() || enddate.getDate() >= startdate.getDate() && enddate.getMonth() + 1 >= startdate.getMonth() + 1 && enddate.getFullYear() >= startdate.getFullYear() || enddate.getFullYear() > startdate.getFullYear()) {

            return b;

        }
        else {
            b++;
            error[2].innerHTML = "nhập phải lớn hơn ngày bắt đầu";
        }
        // else if (startdate.getDate() >= enddate.getDate() && startdate.getMonth() + 1 >= enddate.getMonth() + 1 && startdate.getFullYear() >= enddate.getFullYear()) {
        //     b++;
        //     error[7].innerHTML = "nhập phải lớn hơn ngày bắt đầu";

        // }
        // else {

        //     return b;
        // }
        return b;
    }
    numberprocess = numberEmpty + numberdate + numberdate1;
    if (numberprocess > 0) {
        return false;
    } else {
        return true;
    }
}

function checkvalidatenumber(id) {
    var form = document.querySelector(id);
    console.log(form);


    var error = form.querySelectorAll('.error');

    var input = form.querySelectorAll('.info-text');
    let numberprocess = 0;
    let numberEmpty = 0;
    numberEmpty = checkEmpty(input);


    function checkEmpty(input) {
        let a = 0;
        for (var i = 0; i < input.length; i++) {
            if (input[i].value.trim() === "") {
                a++;
                error[i].innerHTML = "Vui lòng điền đầy đủ các trường";
            } else {
                error[i].innerHTML = "";
            }

        }

        return a;
    }

    console.log(numberEmpty);

    numberprocess = numberEmpty;
    if (numberprocess > 0) {
        return false;
    } else {
        return true;
    }
}

function onUnavailable() {
    Swal.fire({
        icon: 'error',
        title: 'Không thể chỉnh sửa!',
        text: 'Công việc này đã có công việc phụ...',
    })
}

function showPopUpSection(id, pid, name) {
    let html = "<form id=\"add-project1\" action=\"edit_section\" method=\"post\">\n" +
        "                                            <input type=\"text\" name=\"sectionId\" value=\"" + id + "\" hidden>\n" +
        "                                            <input type=\"text\" name=\"projectId\" value=\"" + pid + "\" hidden>\n" +
        "                                            <h4 style=\"text-align: center;\"> Chỉnh sửa đầu mục công việc\n" +
        "                                            </h4>\n" +
        "                                            <table class=\"table table-borderless\">\n" +
        "                                                <tr>\n" +
        "                                                    <td>Tên đầu mục công việc:</td>\n" +
        "                                                    <td><input class=\"info-text\" type=\"text\" value=\"" + name + "\" name=\"sectionName\">\n" +
        "                                                        <div class=\"text-danger error\"></div>\n" +
        "                                                </tr>\n" +
        "                                            </table>\n" +
        "                                            <div class=\"add-btn-work\" style=\"display: flex ; justify-content: end\">\n" +
        "                                                <button style=\"margin-right: 10px\" type=\"button\"\n" +
        "                                                        class=\"btn btn-secondary \" onclick=\"onCancelEdit()\">Hủy bỏ\n" +
        "                                                </button>\n" +
        "                                                <button onclick=\"return checkvalidatenumber('#add-project1')\"\n" +
        "                                                        type=\"submit\"\n" +
        "                                                        class=\"btn btn-primary\">Lưu\n" +
        "                                                </button>\n" +
        "                                            </div>\n" +
        "                                        </form>"
    let showEditHtml = document.querySelector("#showEditHtml");
    let btnEditSection = document.getElementById("myBtn-section");
    let modalEditSection = document.querySelector("#myModal-editSection");
    console.log(modalEditSection)
    modalEditSection.style.display = "block";
    console.log(html);
    showEditHtml.innerHTML = html;
}
function onCancelEdit() {
    let modalB = document.querySelector("#myModal-editSection");
    modalB.style.display = "none";
}