// Update image onto the screen
function update_image() {
    var img = document.querySelector('img'); // Returns the first img element
    var file = document.querySelector('input[type=file]').files[0]; // Returns the first file element found
    img.src = window.URL.createObjectURL(file);

}

function showImage(url) {
    Swal.fire({
        imageUrl: url,
        customClass:{
            image: 'custom_image',
            popup: 'pop_up_custom'
        },
        width: '850px'
    })
}
