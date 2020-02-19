$(function(){
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


  // function buildLike(hoge){
  //   var html = `<div class="vertical_like">
  //                   <i class="material-icons grey-text text-darken-2">お気に入り　❤️</i>
  //                   <span class="grey-text text-darken-2"></span>
  //                   ${hoge.like_count}
  //               </div>`;
  //   return html;
  // }
  // $(".item-button__left").on("click", function(e){
  //   e.preventDefault();
  //   // var kazu = $(".grey-text text-darken-2").length;
  //   console.log(this)
  //   if (html == 0){
  //     var html = buildLike(hoge)
  //     $(".grey-text text-darken-2").append(html)
      
  //     }else{
  //         // kazu
  //       }
        
  //       })
});
// document.getElementsByClassName(".item-button__left").onclick = function() {
//   document.getElementsByClassName(".grey-text text-darken-2").innerHTML += 1
// }






{/* <div class="item-button__left">
<div id="item-button__left__like_#<Item:0x00007fa107039710>"></div>
<a data-remote="true" rel="nofollow" data-method="post" href="/items/1/likes">

</a>
</div> */}
