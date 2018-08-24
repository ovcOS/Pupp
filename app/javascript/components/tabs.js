function tabsActivity() {

  const puppy_container = document.querySelector(".pup");
  const bookings_container = document.querySelector(".but");
  if(puppy_container) {
  // removing and insterting the HTML.
    const puppy_listings = document.querySelector(".puppy_listings")
    const bookings_listings = document.querySelector(".bookings_listings")

    function remove_style(ele) {
      ele.classList.remove("active");
    }

    function add_style(ele) {
      ele.classList.add("active");
    }

    function hide_html(ele) {
      ele.style.display = "none";
    }

    function show_html(ele) {
      ele.style.display = null;
    }

    puppy_container.addEventListener("click", (event) => {
      remove_style(bookings_container)
      add_style(puppy_container)
      hide_html(bookings_listings)
      show_html(puppy_listings)
    });

    bookings_container.addEventListener("click", (event) => {
      remove_style(puppy_container)
      add_style(bookings_container)
      hide_html(puppy_listings)
      show_html(bookings_listings)
    });
  }
}

export { tabsActivity };
