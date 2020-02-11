$(function(){
  
  // $('.item-photo__bottom--size').hover(function(){
  // $('.item-photo__top--size').attr('src',$(this).attr('src'))
  
  // });
  // function buildHTML(item){
  //   var html = 
  // `<div class="exhibition__detail__20__1">
  //   <div class="exhibition__detail__20__1__1">
  //   価格
  //   </div>
  //   <div class="exhibition__detail__20__1__2">
  //     <div class="exhibition__detail__20__1__2__1">
  //     ¥
  //     </div>
  //     <div class="exhibition__detail__20__1__2__2">
  //       ${item.price}
  //     </div>
  //   </div>
  // </div>`
  // return html;
  // };
  // $(".new_item").keyup(function(e){
  //   e.preventDefault()
  //   console.log("ok1")
  //   var formData = new FormData(this);
  //   var url = $(this).attr('action')
  //   $.ajax({
  //     url: url,
  //     type: 'get',
  //     data: formData,
  //     dataType: 'json',
  //     processData: false,
  //     contentType: false
  //   })
  //   .done(function(formData){
  //     console.log("ok2")
  //     var html = buildHTML(formData);
  //     if (html >= 300){
  //       $(".exhibition__detail__20__2__1__1").append(html %10);
  //     } else {
  //       $(".exhibition__detail__20__2__1__1").none;
  //     }
  //   })
  //   })


  



  // $(document).on('turbolinks:load', ()=> {
  //   console.log("ok3")
  //   // 画像用のinputを生成する関数
  const buildFileField = (index)=> {
    const html = `<div class="exhibition__detail__3__2__1__1__1" data-index="${index}">
                    <input class="exhibition__detail__3__2__1__1__1__1" type="file" name="item[images_attributes][${index}][images]" id="item_images_attributes_${index}_images">
                    <div class="exhibition__detail__3__3__1">削除</div>
                  </div>`;
    return html;
  }

  const buildImg = (index, url)=> {
    const html = `<img data-index="${index}" src="${url}" width="100px" height="100px">`;
    return html;
  }

  // file_fieldのnameに動的なindexをつける為の配列
  let fileIndex = [1,2,3,4,5,6,7,8,9,10];

  lastIndex = $('.exhibition__detail__3__2__1__1__1:last').data('index');
  fileIndex.splice(0, lastIndex);

  $('.hidden-destroy').hide();

  $('.exhibition__detail__3__2__1').on('change', '.exhibition__detail__3__2__1__1__1__1', function(e) {
    // fileIndexの先頭の数字を使ってinputを作る
    const targetIndex = $(this).parent().data('index');
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);
    // $('#image-box').append(buildFileField(fileIndex[0]));
    // fileIndex.shift();
    // // 末尾の数に1足した数を追加する
    // fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      img.setAttribute('images', blobUrl);
    } else {  // 新規画像追加の処理
      $('.exhibition__detail__3__2__1__1').append(buildImg(targetIndex, blobUrl));
      // fileIndexの先頭の数字を使ってinputを作る
      $('.exhibition__detail__3__2__1').append(buildFileField(fileIndex[0]));
      fileIndex.shift();
      // 末尾の数に1足した数を追加する
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
    }
  });

  $('.exhibition__detail__3__2__1').on('click', '.exhibition__detail__3__3__1', function() {
    const targetIndex = $(this).parent().data('index');
    // 該当indexを振られているチェックボックスを取得する
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
    // もしチェックボックスが存在すればチェックを入れる
    if (hiddenCheck) hiddenCheck.prop('checked', true);

    $(this).parent().remove();
    $(`img[data-index="${targetIndex}"]`).remove();

    // 画像入力欄が0個にならないようにしておく
    if ($('.exhibition__detail__3__2__1__1__1__1').length == 0) $('.exhibition__detail__3__2__1').append(buildFileField(fileIndex[0]));
  });

// });
/* <input placeholder="例) 300" class="exhibition__detail__20__1__2__2__1" type="text" name="item[price]" id="item_price"></input> */


  const buildFolder = () => {
    const html = `<div class="exhibition__detail__8">
                    <select name="item[category_id]" id="item_category_id">
                    <option value="">------</option>
                      <option value="トップス">トップス</option>
                      <option value="ジャケット/アウター">ジャケット/アウター</option>
                      <option value="パンツ">パンツ</option>
                      <option value="スカート">スカート</option>
                      <option value="ワンピース">ワンピース</option>
                      <option value="靴">靴</option>
                      <option value="ルームウェア/パジャマ">ルームウェア/パジャマ</option>
                      <option value="帽子">帽子</option>
                      <option value="その他">その他</option>
                    </select>
                  </div>`;
    return html;
  }
  $("#item_category_id").on("change", function(e) {
    e.preventDefault();
      var html = buildFolder();
      $(".exhibition__detail__8__1").append(html)
      
  });


  $("#item_price").on("keyup", function(e) {
    e.preventDefault();
    // console.log(e)
      var price = $(".exhibition__detail__20__1__2__2__1").val()
      if( 300 <= price && price <= 9999999) {
        var num = Math.floor(price / 10);
        var num2 = (price - num);
        $(".exhibition__detail__20__2__1__1").text(num);
        $(".exhibition__detail__20__3__2").text(num2);
      }
  });
});


