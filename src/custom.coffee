$(".menu-item").hover ( () ->
  id = this.id
  $(this).attr "src", "assets/#{id}-active.jpg"
), () ->
  id = this.id
  $(this).attr "src", "assets/#{id}.jpg"
