$(".menu-item").hover ( () ->
  id = this.id
  $(this).attr "src", "images/#{id}-active.jpg"
), () ->
  id = this.id
  $(this).attr "src", "images/#{id}.jpg"
