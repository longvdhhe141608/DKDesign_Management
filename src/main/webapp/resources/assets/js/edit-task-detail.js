function checkvalidate(id) {
    var form = document.querySelector(id);
    console.log(form);

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
    // let numberchecknumber = 0;
    // numberchecknumber = checkNumber(input);






    // function checkNumber(input) {
    //     let a = 0;
    //     if (input[3].value.length > 0 ) {
    //         for (var i = 0; i < input.length; i++) {
    //             if (isNaN(input[3].value.trim())) {
    //                 a++;
    //                 error[3].innerHTML = "Chỉ được nhập số";
    //
    //             } else if (input[3].value <= 0) {
    //                 a++;
    //                 error[3].innerHTML = "Cần nhập số lớn hơn 0";
    //
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
    function checkdate(today, startdate, enddate) {
        let b = 0;

        if (today.getDate() > enddate.getDate() && today.getMonth() + 1 >= enddate.getMonth() + 1 && today.getFullYear() >= enddate.getFullYear()) {
            b++;
            error[2].innerHTML = "nhập phải lớn hơn ngày hiện tại";

        }
        else if (startdate.getDate() > enddate.getDate() && startdate.getMonth() + 1 >= enddate.getMonth() + 1 && startdate.getFullYear() >= enddate.getFullYear()) {
            b++;
            error[2].innerHTML = "nhập phải lớn hơn ngày bắt đầu";
        }
        else {
            return b;
        }
        return b;
    }
    console.log(numberdate);
    numberprocess = numberEmpty  + numberdate;
    console.log(numberprocess);
    if (numberprocess > 0) {
        return false;
    } else {
        return true;
    }
}