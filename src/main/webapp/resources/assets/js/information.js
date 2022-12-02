function checkvalidate(id) {
    var form = document.querySelector(id);
    console.log(form);
    var regex = /^(0?)(3[2-9]|5[6|8|9]|7[0|6-9]|8[0-6|8|9]|9[0-4|6-9])[0-9]{7}$/;
    var regexemail = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
    var regexCCCD = /[0-9]{10,12}$/;
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
    numberdate = checkdate(today, startdate);
    let numberchecknumber = 0;
    numberchecknumber = checkNumber(input);
    let numbercheckphone = 0;
    numbercheckphone = checkNumberPhone(input, regex);
    let numbercheckemail = 0;
    numbercheckemail = checkEmail(input, regexemail);
    let numbercheckcccd = 0;
    numbercheckcccd = checkCCCD(input, regexCCCD);

    function checkCCCD(input, regexCCCD) {
        let a = 0;
        if (input[1].value.length > 0) {

            if (input[1].value.match(regexCCCD)) {

                console.log(input[1].value);
                return a;
            } else {
                a++;
                error[1].innerHTML = "Nhập đúng dạng số CCCD/CMND";
                // console.log(input[2].value);
            }

        }

        return a;
    }

    function checkNumberPhone(input, regex) {
        let a = 0;
        if (input[3].value.length > 0) {

            if (input[3].value.match(regex)) {

                console.log(input[3].value);
                return a;
            } else {
                a++;
                error[3].innerHTML = "Nhập đúng dạng số điện thoại";
                // console.log(input[2].value);
            }

        }

        return a;
    }


    function checkEmail(input, regexemail) {
        let a = 0;
        if (input[4].value.length > 0) {

            if (input[4].value.match(regexemail)) {

                console.log(input[4].value);
                return a;
            } else {
                a++;
                error[4].innerHTML = "Nhập đúng dạng email";

            }

        }

        return a;

    }

    // function checkNumber(input) {
    //     let a = 0;
    //     if (input[4].value.length > 0 || input[5].value.length > 0) {
    //         for (var i = 0; i < input.length; i++) {
    //             if (isNaN(input[4].value.trim())) {
    //                 a++;
    //                 error[4].innerHTML = "Chỉ được nhập số";
    //             } else if (isNaN(input[5].value.trim())) {
    //                 a++;
    //                 error[5].innerHTML = "Chỉ được nhập số";
    //             } else if (input[4].value <= 0) {
    //                 a++;
    //                 error[4].innerHTML = "Cần nhập số lớn hơn 0";
    //             } else if (input[5].value <= 0) {
    //                 error[5].innerHTML = "Cần nhập số lớn hơn 0";
    //             }
    //
    //         }
    //     }
    //     return a;
    // }

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
    function checkdate(today, startdate) {
        let b = 0;
        if (startdate.getDate() >= today.getDate() && startdate.getMonth() + 1 >= today.getMonth() + 1 && startdate.getFullYear() >= today.getFullYear()) {
            b++;
            error[2].innerHTML = "nhập phải nhỏ hơn ngày hiện tại";

        }

        else {

            return b;
        }
        return b;
    }
    console.log(numberdate);
    numberprocess = numberEmpty + numberchecknumber + numbercheckphone + numberdate + numbercheckemail+numbercheckcccd;
    console.log(numberprocess);
    if (numberprocess > 0) {
        return false;
    } else {
        return true;
    }
}