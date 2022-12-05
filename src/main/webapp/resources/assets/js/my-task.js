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
    let numberprocess = 0;

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
     console.log(today.getMonth()+1);
    console.log(startdate.getMonth()+1);
    console.log(enddate.getMonth()+1);
    function checkdate(today, startdate, enddate) {
        let b = 0;
        if (startdate.getDate() < today.getDate() || startdate.getMonth() + 1 <= today.getMonth() + 1 || startdate.getFullYear() <= today.getFullYear()) {
            b++;
            error[1].innerHTML = "nhập phải lớn hơn ngày hiện tại";

        }
        else if (startdate.getDate() > enddate.getDate() || startdate.getMonth() + 1 >= enddate.getMonth() + 1 || startdate.getFullYear() >= enddate.getFullYear()) {
            b++;
            error[2].innerHTML = "nhập phải lớn hơn ngày bắt đầu";

        }
        else {

            return b;
        }
        return b;
    }
    console.log(numberdate);

    numberprocess = numberEmpty + numberdate;
    if (numberprocess > 0) {
        return false;
    } else {
        return true;
    }

}