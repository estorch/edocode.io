$(".edo-navbar-item").hover ( () ->
  id = this.id + "-bar"
  switch (id)
    when "about-bar" then color = "#314953"
    when "web-services-bar" then color = "#505131"
    when "resume-bar" then color = "#822425"
    when "contact-bar" then color = "#b8854e"
  element = document.getElementById(id);
  element.setAttribute("style", "height: 4px; margin-bottom: 0px; background-color: " + color + ";");
), () ->
  id = this.id + "-bar"
  element = document.getElementById(id);
  element.setAttribute("style", "height: 1px; margin-bottom: 3px; background-color: #ffffff;");

$(".tail-img").hover ( () ->
  id = this.id
  $(this).attr "src", "assets/#{id}-active.jpg"
), () ->
  id = this.id
  $(this).attr "src", "assets/#{id}.jpg"