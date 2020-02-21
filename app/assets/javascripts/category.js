$(function(){
  function buildHTML(category){
    var html = `<option value="${category.id}">${category.name}</option>`
    return html;
  };
  $(".exhibition__detail__cat").on("change", ".aaaaa", function(){
    var category_id = $(this).val()
    $(this).nextAll().remove()
    // .nextAll()で次以降全てという意味
    $.ajax({
      url: "/api/categorys",
      type: 'GET',
      data: { keyword: category_id },
      dataType: 'json'
    })
    .done(function(data){
      if (data.length >= 1){
        insertHNTL = ""
        data.forEach(function(category){
          // forEachで繰り返しの処理
          var html = buildHTML(category);
          insertHNTL += html
        })
        $(".exhibition__detail__cat").append(`<select class="aaaaa">${insertHNTL}</select>`)
      }  
    })
  });
})

