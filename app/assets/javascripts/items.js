$(function(){
  const buildFileField = (index)=> {
    const html = `<div class="exhibition__detail__image__in__fis__out__ind" data-index="${index}">
                    <input class="exhibition__detail__image__in__fis__out__ind__fil" type="file" name="item[images_attributes][${index}][images]" id="item_images_attributes_${index}_images">
                    <div class="exhibition__detail__des__cou__tag">削除</div>
                  </div>`;
    return html;
  }

  const buildImg = (index, url)=> {
    const html = `<img data-index="${index}" src="${url}" width="100px" height="100px">`;
    return html;
  }

  // file_fieldのnameに動的なindexをつける為の配列
  let fileIndex = [1,2,3,4,5,6,7,8,9,10];

  lastIndex = $('.exhibition__detail__image__in__fis__out__ind:last').data('index');
  // .data(index)について.data()はdata属性(今回はカスタムデータ)のindexを取得している
  // 画像挿入するための「ファイルを選択する」の最後のindex番号を取得
  fileIndex.splice(0, lastIndex);
  // splice()メソッドは古い要素の削除しながら、新しい要素を追加することで、配列の内容を変更します。
  // この場合fileIndexのindex番号0番目からスタートしlastIndexの数削除している

  $('.hidden-destroy').hide();
  // .hide()はレシーバーのHTML要素を非表示にする
  // なので今回は消すというより要素ごと消しているという方が正しい
  // 余談、、、レシーバーは今回は$('.hidden-destroy')
  // rubyでは影響を受ける元のことを言うがjsでもそういうかは不明
  $('.exhibition__detail__image__in__fis').on('change', '.exhibition__detail__image__in__fis__out__ind__fil', function(e) {
    // fileIndexの先頭の数字を使ってinputを作る
    const targetIndex = $(this).parent().data('index');
    // .parent()はレシーバーの親要素を取得する
    // 今回コードを日本語に訳すと、イベント発生源の親要素のindex番号を代入している
    const file = e.target.files[0];
    // eについても一応、イベントの発生元の要素や押されたキーの情報などが入っています、、、気になったここの下で" console.log(e) "してください
    // .tergetはイベントが発生したDOM要素を取得
    // .files[0]について簡単に言うとfileオブジェクト(htmlのi<input type="file">)のindex番号0番目を取得している
    // ここの和訳は何気短く簡単に説明するのが難しい、なので簡単な説明は書き、詳しい説明は" http://www.jquerystudy.info/reference/events/target.html "このURLへ
    // 和訳(簡単に説明)は'.exhibition__detail__image__in__fis__out__ind__fil'のDOM要素である<input type="file">の0番目を代入している
    // ここは読まなくてもいい --------
    // .files[0]はjQueryやJavaScriptでHTMLのinputタグのファイルタイプで指定されたファイルをFileAPIで読み込むためのファイルオブジェクトの取得していると思われるが難しく考えすぎかも
    // ここまで -------
    const blobUrl = window.URL.createObjectURL(file);
    // .URL.createObjectURL(file)は引数で指定されたオブジェクトを表す URL を含むDOMString(DOMStringとはURLオブジェクト(urlを文字列にしたもの)のことです)を生成します。
    // windowとはJavaScriptにあらかじめ用意されてるオブジェクト
    // 例えばwindow.documentみたいな感じでについているが省略可能のため書くことは少ないが今回は書いてある "https://tektektech.com/what-is-window-object/109/"これがわかりやすい
    // ここで書くならwindowとはピラミットの一番上でその下にdocumentなどがありそれをwindowを省いて書くことができると言うもの
    // 和訳、、選ばれた画像のurlを文字列として代入している
    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      // 和訳、、imgのカスタム属性indexのイベント発生源の親要素のindex番号が0番の時
      img.setAttribute('images', blobUrl);
      // setAttributeは、指定した要素に属性の設定や属性値の変更をすることができる構文になります。要素が指定した属性を持っていない場合は追加、持っている場合は値を変更する処理をします。
      // 和訳、、、imgにimagesという名前で画像のurlを文字列として代入している
    } else {  
      $('.exhibition__detail__image__in__fis__out').append(buildImg(targetIndex, blobUrl));
      // 新規画像追加の処理
      $('.exhibition__detail__image__in__fis').append(buildFileField(fileIndex[0]));
      // fileIndexの先頭の数字を使ってinputを作る
      fileIndex.shift();
      // shift()メソッドは配列から最初の要素を削除して、その要素を返します。
      // 和訳、、、fileIndexの番号を最初なら0番目を2回目なら1番目を削除している
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
      // 和訳、、、末尾の数に1足した数を追加する
      // .pushは主に配列データの末尾に任意の要素を追加するために利用されます。
    }
  });

  $('.exhibition__detail__image__in__fis').on('click', '.exhibition__detail__des__cou__tag', function() {
    const targetIndex = $(this).parent().data('index');
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
    // 和訳、、、該当indexを振られているチェックボックスを取得する
    if (hiddenCheck) hiddenCheck.prop('checked', true);
    // 和訳、、、もしチェックボックスが存在すればチェックを入れる
    // prop()とattr()の違いについて -----
    // そもそも論attrとはHTML要素の属性を取得したり、設定することができるメソッド、、propは属性プロパティに値を設定する、または設定されている値を取得する
    // ほとんど変わらないが、同じ属性値を取得した時に返ってくる値が異なるという点では、attr()はHTML的な値で、prop()はJavaScript的な値となっているらしい。
    // 具体的に言うと、attr()の場合はchekedが付いていなければundefined（未定義）が返され、チェックが外れているだけなのか、それともチェックボックスがそもそもないのかを区別できません。
    // それに対してprop()はそこの区別がつきます、、ちゃんとfalseと帰ってくるという意味
    // ここまで ------

    $(this).parent().remove();
    // 和訳、、、イベント発生源の親要素を削除する
    $(`img[data-index="${targetIndex}"]`).remove();
    // 和訳、、、imgのカスタム属性indexのイベント発生源の親要素のindex番号を削除する
    if ($('.exhibition__detail__image__in__fis__out__ind__fil').length == 0) $('.exhibition__detail__image__in__fis').append(buildFileField(fileIndex[0]));
    // 和訳、、、画像入力欄が0個にならないようにしておく
  });



  $("#item_price").on("keyup", function(e) {
    e.preventDefault();
    // console.log(e)
      var price = $(".exhibition__detail__pri__chi__cnames__pridet__1").val()
      if( 300 <= price && price <= 9999999) {
        var num = Math.floor(price / 10);
        // Mathはオブジェクトとして数学に関することができるもの
        // Math.floorとは、引数として与えた数以下の最大の整数を返します。
        // 要は、小数点切り捨ての数字にするということ
        var num2 = (price - num);
        $(".exhibition__detail__pri__comm__2").text(num);
        $(".exhibition__detail__pri__pro__2").text(num2);
      }
  });
});







