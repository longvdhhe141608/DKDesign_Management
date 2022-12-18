function checkvalidate(id) {
    var form = document.querySelector(id);
    console.log(form);
    var regex = /^(0?)(3[2-9]|5[6|8|9]|7[0|6-9]|8[0-6|8|9]|9[0-4|6-9])[0-9]{7}$/;
    var name = form.querySelector('#inputaddname');
    var start = form.querySelector('#inputstartdate');
    var end = form.querySelector('#inputenddate');
    var error = form.querySelectorAll('.error');
    var today = new Date();
    var startdate = new Date(start.value);
    var enddate = new Date(end.value);
    var input = form.querySelectorAll('.info-text');
    let numberprocess = 0;
    console.log(today);
    console.log(startdate);
    console.log(enddate);

    let numberEmpty = 0;
    numberEmpty = checkEmpty(input);
    let numberdate = 0;
    numberdate = checkdate(today, startdate, enddate);
    let numberdate1 = 0;
    numberdate1 = checkdate1(today, startdate, enddate);
    let numberchecknumber = 0;
    numberchecknumber = checkNumber(input);
    let numbercheckphone = 0;
    numbercheckphone = checkNumberPhone(input, regex);



    function checkNumberPhone(input, regex) {
        let a = 0;
        if (input[2].value.length > 0) {

            if (input[2].value.match(regex)) {

                console.log(input[2].value);
                return a;
            } else {
                a++;
                error[2].innerHTML = "Nhập đúng dạng số điện thoại";
                // console.log(input[2].value);
            }

        }

        return a;
    }

    function checkNumber(input) {
        let a = 0;
        if (input[4].value.length > 0 || input[5].value.length > 0) {
            for (var i = 0; i < input.length; i++) {
                if (isNaN(input[4].value.trim())) {
                    a++;
                    error[4].innerHTML = "Chỉ được nhập số";
                } else if (isNaN(input[5].value.trim())) {
                    a++;
                    error[5].innerHTML = "Chỉ được nhập số";
                } else if (input[4].value <= 0) {
                    a++;
                    error[4].innerHTML = "Cần nhập số lớn hơn 0";
                } else if (input[5].value <= 0) {
                    error[5].innerHTML = "Cần nhập số lớn hơn 0";
                }

            }
        }
        return a;
    }

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
        if (startdate.getMonth() + 1 > today.getMonth() + 1 && startdate.getFullYear() == today.getFullYear() ||
            startdate.getDate() >= today.getDate() && startdate.getMonth() + 1 == today.getMonth() + 1 && startdate.getFullYear() == today.getFullYear() ||
            startdate.getFullYear() > today.getFullYear()) {

            return b;

        }
        else {
            b++;
            error[6].innerHTML = "nhập phải lớn hơn ngày hiện tại";
        }
        return b;
    }
    function checkdate1(today, startdate, enddate) {
        let b = 0;
        if (enddate.getMonth() + 1 > startdate.getMonth() + 1 && enddate.getFullYear() == startdate.getFullYear() ||
            enddate.getDate() >= startdate.getDate() && enddate.getMonth() + 1 == startdate.getMonth() + 1 && enddate.getFullYear() == startdate.getFullYear() ||
            enddate.getFullYear() > startdate.getFullYear()) {

            return b;

        }
        else {
            b++;
            error[7].innerHTML = "nhập phải lớn hơn ngày bắt đầu";
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
    console.log(numberdate);
    numberprocess = numberEmpty + numberchecknumber + numbercheckphone + numberdate + numberdate1;
    console.log(numberprocess);
    if (numberprocess > 0) {
        return false;
    } else {
        return true;
    }
}
function onClickDelete(id){
    Swal.fire({
        title: 'Bạn có chắc chắn muốn xóa dự án này không?',
        showDenyButton: true,
        showCancelButton: false,
        confirmButtonText: 'Xóa',
        denyButtonText: `Hủy`,
    }).then((result) => {
        /* Read more about isConfirmed, isDenied below */
        if (result.isConfirmed) {
            $.ajax({
                type: "get",
                url: "allProject/delete_project",
                data: {
                    projectId: id,
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
            Swal.fire('Dự án đã được giữ lại.', '', 'info')
        }
    })
}