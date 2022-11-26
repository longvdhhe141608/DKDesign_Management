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


    function checkEmpty(input) {
        let a = 0;
        for (var i = 0; i < input.length; i++) {
            if (input[i].value.trim() === "") {
                a++;
                error[i].innerHTML = "Không được để trống";
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
        if (startdate.getDate() < today.getDate() && startdate.getMonth() + 1 <= today.getMonth() + 1 && startdate.getFullYear() <= today.getFullYear()) {
            b++;
            error[1].innerHTML = "nhập phải lớn hơn ngày hiện tại";

        } else if (startdate.getDate() >= enddate.getDate() && startdate.getMonth() + 1 >= enddate.getMonth() + 1 && startdate.getFullYear() >= enddate.getFullYear()) {
            b++;
            error[2].innerHTML = "nhập phải lớn hơn ngày bắt đầu";

        } else {

            return b;
        }
        return b;
    }

    console.log(numberdate);
    return false;

}

function onClickDelete(id) {
    Swal.fire({
        title: 'Bạn có chắc chắn muốn xóa yêu cầu này?',
        showDenyButton: true,
        showCancelButton: false,
        confirmButtonText: 'Xóa',
        denyButtonText: `Hủy`,
    }).then((result) => {
        /* Read more about isConfirmed, isDenied below */
        if (result.isConfirmed) {
            $.ajax({
                type: "post",
                url: "delete-requirement-by-leader",
                data: {
                    requirementId: id,
                },
                success: function () {
                    location.reload();
                },
                error: function (jqXHR, exception) {
                    console.log(jqXHR)
                    console.log(exception)
                }
            });
        } else if (result.isDenied) {
            Swal.fire('Yêu cầu đã được giữ lại', '', 'info')
        }
    })
}

function showPopUp(id, name, detail) {

    let html = "<form action=\"update-requirement\" method=\"post\" id=\"add-project1\"\n" +
        "                  class=\"\">\n" +
        "                <input type=\"text\" name=\"requirementId\" hidden\n" +
        "                       value=\"" + id + "\">\n" +
        "                <table class=\"table table-borderless\">\n" +
        "                    <tr>\n" +
        "                        <td>Vị trí<label class=\"text-danger\">*</label>:</td>\n" +
        "                        <td>\n" +
        "                            <input style=\"width: 500px;\" class=\"info-text\"\n" +
        "                                   name=\"name\" type=\"text\"\n" +
        "                                   value=\"" + name + "\">\n" +
        "                            <div class=\"text-danger error\"></div>\n" +
        "                        </td>\n" +
        "                    </tr>\n" +
        "                    <tr>\n" +
        "                        <td>Yêu cầu<label class=\"text-danger\">*</label>:</td>\n" +
        "                        <td>\n" +
        "                                                                    <textarea class=\"info-text\" name=\"detail\" id=\"\"\n" +
        "                                                                              cols=\"60\"\n" +
        "                                                                              rows=\"3\">" + detail + "</textarea>\n" +
        "                            <div class=\"text-danger error\"></div>\n" +
        "                        </td>\n" +
        "                    </tr>\n" +
        "\n" +
        "                </table>\n" +
        "                <div class=\"add-btn-work\">\n" +
        "                    <button type=\"button\" class=\"btn btn-secondary \">Hủy bỏ\n" +
        "                    </button>\n" +
        "                    <button onclick=\"return checkvalidate('#add-project1')\"\n" +
        "                            type=\"submit\" class=\"btn btn-primary\">\n" +
        "                        Lưu\n" +
        "                    </button>\n" +
        "                </div>\n" +
        "            </form>";

    let showHtml = document.querySelector("#showHtml");

    let btnClick = document.getElementById("myBtn-project");
    let modalFooter = document.querySelector("#myModal-footer");
    console.log(modalFooter)
    modalFooter.style.display = "block";
    console.log(html);
    showHtml.innerHTML = html;
}