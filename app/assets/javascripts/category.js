// $(function(){
//   // カテゴリーセレクトボックスのオプションを作成
//   function appendOption(category){
//     var html = `<option value="${category.name}" data-category="${category.id}">${category.name}</option>`;
//     return html;
//   }
//   // 子カテゴリーの表示作成
//   function appendChidrenBox(insertHTML){
//     var childSelectHtml = '';
//     childSelectHtml = `<div class='listing-select-wrapper__added' id= 'children_wrapper'>
//                         <div class='listing-select-wrapper__box'>
//                           <select class="listing-select-wrapper__box--select" id="child_category" name="category_id">
//                             <option value="---" data-category="---">---</option>
//                             ${insertHTML}
//                           <select>
//                           <i class='fas fa-chevron-down listing-select-wrapper__box--arrow-down'></i>
//                         </div>
//                       </div>`;
//     $('.listing-product-detail__category').append(childSelectHtml);
//   }
//   // 孫カテゴリーの表示作成
//   function appendGrandchidrenBox(insertHTML){
//     var grandchildSelectHtml = '';
//     grandchildSelectHtml = `<div class='listing-select-wrapper__added' id= 'grandchildren_wrapper'>
//                               <div class='listing-select-wrapper__box'>
//                                 <select class="listing-select-wrapper__box--select" id="grandchild_category" name="category_id">
//                                   <option value="---" data-category="---">---</option>
//                                   ${insertHTML}
//                                 </select>
//                                 <i class='fas fa-chevron-down listing-select-wrapper__box--arrow-down'></i>
//                               </div>
//                             </div>`;
//     $('.listing-product-detail__category').append(grandchildSelectHtml);
//   }
//   // 親カテゴリー選択後のイベント
//   $('#parent_category').on('change', function(){
//     // .valueプロパティはval()と同じ？
    // getElementByIdは、任意のHTMLタグで指定したIDにマッチするドキュメント要素を取得するメソッド
//     // document.getElementById('parent_category').valueは#parent_categoryのHTML要素を取得している
//      // ↓ productcategoryに選択した親のvalueを代入
    // var parentCategory = document.getElementById('parent_category').value; //選択された親カテゴリーの名前を取得
//     if (parentCategory != "---"){ //親カテゴリーが初期値でないことを確認
//       // console.log("ok4")
//       $.ajax({
//         url: "get_category_children",
//         type: 'GET',
//         data: { parent_name: parentCategory },
//         dataType: 'json'
//       })
//       // console.log("ok6")
//       .done(function(children){
//         // console.log(children)
//         // childrenは親要素が入っている
//         $('#children_wrapper').remove(); //親が変更された時、子以下を削除するする
//         $('#grandchildren_wrapper').remove();
//         // $('#size_wrapper').remove();
//         // $('#brand_wrapper').remove();
        // var insertHTML = '';
        // children.forEach(function(child){
        //   // forEachでchildに一つずつデータを代入｡子のoptionが一つずつ作成される｡
        //   // childは親要素の子要素たちが入っている
        //   insertHTML += appendOption(child);
//         });
//         appendChidrenBox(insertHTML);
//       })
//       .fail(function(){
//         // console.log("ok8")
//         alert('カテゴリー取得に失敗しました');
//       })
//     }else{
//       $('#children_wrapper').remove(); //親カテゴリーが初期値になった時、子以下を削除するする
//       $('#grandchildren_wrapper').remove();
//       $('#size_wrapper').remove();
//       $('#brand_wrapper').remove();
//     }
//   });
//   // 子カテゴリー選択後のイベント
//   $('.listing-product-detail__category').on('change', '#child_category', function(){
//     var childId = $('#child_category option:selected').data('category'); //選択された子カテゴリーのidを取得
//     console.log(child_category)
//     if (childId != "---"){ //子カテゴリーが初期値でないことを確認
//       $.ajax({
//         url: 'get_category_grandchildren',
//         type: 'GET',
//         data: { child_id: childId },
//         dataType: 'json'
//       })
//       .done(function(grandchildren){
//         console.log(grandchildren)
//         if (grandchildren.length != 0) {
//           $('#grandchildren_wrapper').remove(); //子が変更された時、孫以下を削除するする
//           // $('#size_wrapper').remove();
//           // $('#brand_wrapper').remove();
//           var insertHTML = '';
//           grandchildren.forEach(function(grandchild){
//             insertHTML += appendOption(grandchild);
//             console.log(grandchild)
//           });
//           appendGrandchidrenBox(insertHTML);
//           console.log(insertHTML)
//         }
//       })
//       .fail(function(){
//         console.log("ok12")
//         alert('カテゴリー取得に失敗しました');
//       })
//     }else{
//       $('#grandchildren_wrapper').remove(); //子カテゴリーが初期値になった時、孫以下を削除する
//       $('#size_wrapper').remove();
//       $('#brand_wrapper').remove();
//     }
//   });
// });






$(function(){
  function buildHTML(category){
    var html = `<option value="${category.id}">${category.name}</option>`
    return html;
  };
  $(".exhibition__detail__8").on("change", ".aaaaa", function(){
    var category_id = $(this).val()
    $(this).nextAll().remove()
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
          var html = buildHTML(category);
          insertHNTL += html
        })
        $(".exhibition__detail__8").append(`<select class="aaaaa">${insertHNTL}</select>`)
      }  
    })
  });
})

