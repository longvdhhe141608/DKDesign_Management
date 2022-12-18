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
function checkvalidate(id) {
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
                type: "get",
                url: "delete-requirement-by-leader",
                data: {
                    requirementId: id,
                },
                success: function (a) {
                    // console.log(a)
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
        "                    <button onclick='closePopUp()' style='margin-right:5px ' type=\"button\" class=\"btn btn-secondary \">Hủy bỏ\n" +
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

function closePopUp(){
    let modalFooter = document.querySelector("#myModal-footer");
    modalFooter.style.display = "none";
}