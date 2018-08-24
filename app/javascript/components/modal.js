
function showModal() {
  var modal = document.getElementById('puppModal');

  if (modal) {
    console.log("is here")
    // Get the button that opens the modal
    var btn = document.getElementById("btn_pupp");

    // Get the <span> element that closes the modal
    var span = document.getElementsByClassName("close")[0];

    // When the user clicks on the button, open the modal
    btn.onclick = function(e) {
        e.preventDefault()
        modal.style.display = "block";
    }

    // When the user clicks on <span> (x), close the modal
    span.onclick = function() {
        modal.style.display = "none";
        btn.submit();
    }

    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
            var form = document.querySelector(".simple_form.new_booking");
            form.submit();
        }
    }
  }
}
export { showModal };
