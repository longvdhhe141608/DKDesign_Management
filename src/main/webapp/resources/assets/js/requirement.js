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
                error[i].innerHTML = "Không được để trống";
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
                error[i].innerHTML = "Không được để trống";
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