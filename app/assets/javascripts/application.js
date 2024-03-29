$(function(){
  $fileField = $('#file')
 
  // 選択された画像を取得し表示
  $($fileField).on('change', $fileField, function(e) {
    var reader = new FileReader();
    $preview = $("#img_field");

    file = e.target.files[0] // 画像データ取得
    reader.onload = (function(file) {
      
      return function(e) {
        $preview.empty();
        $preview.append($('<img>').attr({
          src: e.target.result,
          width: "100%",
          height: "100%",
          class: "preview",
          title: file.name
        }));
      };
    })(file);
    reader.readAsDataURL(file);
  });


  //= require jquery
  //= require jquery_ujs
  //= require turbolinks
  //= require bootstrap
});