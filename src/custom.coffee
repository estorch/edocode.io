# On mouse-over, change color of menu bars
$(".edo-navbar-item").hover ( () ->
  id = this.id + "-overbar"
  switch (id)
    when "about-overbar" then color = "#314953"
    when "web-services-overbar" then color = "#505131"
    when "resume-overbar" then color = "#822425"
    when "contact-overbar" then color = "#b8854e"
  element = document.getElementById(id)
  element.className = "edo-navbar-overbar-mouseover"
  element.setAttribute("style", "background-color: " + color)

  id = this.id + "-name"
  element = document.getElementById(id)
  element.setAttribute("style", "font-weight: bold")
), () ->
  id = this.id + "-overbar"
  element = document.getElementById(id)
  element.className = "edo-navbar-overbar"
  element.setAttribute("style", "background-color: #ffffff")

  id = this.id + "-name"
  element = document.getElementById(id)
  element.setAttribute("style", "font-weight: normal")

# On mouse-over, change LinkedIn and GitHub button images
$(".tail-img").hover ( () ->
  id = this.id
  $(this).attr "src", "assets/images/#{id}-active.jpg"
), () ->
  id = this.id
  $(this).attr "src", "assets/images/#{id}.jpg"
