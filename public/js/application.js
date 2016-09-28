function buildPostForm(response){
  return"<div class='create-post'>"+response+'</div>'
}

$(document).ready(function() {
  $('.all-posts-list').on('submit', '.post-form', function(event){
    event.preventDefault();
    var $form = $(this)

    $.ajax({
      url: $form.attr('action'),
      method: $form.attr('method'),
      data: $form.serialize()
    })
    .done(function(response){
      $form.find('button').text(response)
    });
  });

  $(".create").on('click', 'a', function(event){
    event.preventDefault();
    var $link = $(this)
    if($('.create-post').length === 0){
      $.ajax({
        url: $link.attr('href')
        // method: 'GET'
      }).done(function(response){
        $link.after(buildPostForm(response))
      })
    }else{
      $('.create-post').toggle();
    };
  })

});
