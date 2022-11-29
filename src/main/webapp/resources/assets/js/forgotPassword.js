function checkvalidate(id) {
    var form = document.querySelector(id);
    var regex = /^[a-zA-Z0-9]{5,50}@gmail\.com$/;
    var input = form.querySelectorAll('.info-text');
    var error = form.querySelectorAll('.error');
    let numberprocess = 0;
    console.log(input);
    let numberEmpty = 0;
    numberEmpty = checkEmpty(input);
    let numbercheckemail = 0;
    numbercheckemail = checkEmail(input, regex);

    function checkEmail(input, regex) {
        let a = 0;
        if (input[0].value.length > 0) {

            if (input[0].value.match(regex)) {

                console.log(input[0].value);
                return a;
            } else {
                a++;
                error[0].innerHTML = "Nhập đúng dạng email(5-50 ký tự và đuôi là @ gmail.com)";

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

        }

        return a;
    }


    numberprocess = numberEmpty + numbercheckemail;
    console.log(numberprocess);
    if (numberprocess > 0) {
        return false;
    } else {
        return true;
    }

}