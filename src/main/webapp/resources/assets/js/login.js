function checkvalidate(id) {
    var form = document.querySelector(id);

    var input = form.querySelectorAll('.info-text');
    var error = form.querySelectorAll('.error');
    let numberprocess = 0;
    console.log(input);
    let numberEmpty = 0;
    numberEmpty = checkEmpty(input);



    function checkEmpty(input) {
        let a = 0;
        for (var i = 0; i < input.length; i++) {
            if (input[i].value.trim() === "") {
                a++;
                error[i].innerHTML = "Không được để trống";
            } else {
                error[i].innerHTML = "";
            }

        }

        return a;
    }


    numberprocess = numberEmpty;
    console.log(numberprocess);
    if (numberprocess > 0) {
        return false;
    } else {
        return true;
    }

}