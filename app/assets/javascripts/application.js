//= require rails-ujs
//= require_tree .


// toggle for the tabs.
puppy_container = document.querySelector(".pup");
bookings_container = document.querySelector(".but");

function remove_style(ele) {
  ele.classList.remove("active");
}

function add_style(ele) {
  ele.classList.add("active");
}

puppy_container.addEventListener("click", (event) => {
// puppy_container.style.classList.remove =(".active");
  remove_style(bookings_container)
  add_style(puppy_container)
});

// removing and insterting the HTML.
puppy_listings = document.querySelector(".puppy_listings")
bookings_listings = document.querySelector(".bookings_listings")
// listings = document.querySelector(".listings")

function hide_html(ele) {
  ele.style.display = "none";
}

function show_html(ele) {
  ele.style.display
}

bookings_container.addEventListener("click", (event) => {
// puppy_container.style.classList.remove =(".active");
  remove_style(puppy_container)
  add_style(bookings_container)
  hide_html(puppy_listings)
  show_html(bookings_listings)
});
