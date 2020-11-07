// $(function() {
//   // 子カテゴリーを追加するための処理です。
//     function buildChildHTML(child){
//       var html =`<a class="child_category" id="${child.id}" 
//                   href="/posts/${child.id}">${child.name}</a>`;
//       return html;
//     }
  
//     $(".parent_category").on("mouseover", function() {
//       var id = this.id//どのリンクにマウスが乗ってるのか取得します
//       $(".now-selected-red").removeClass("now-selected-red")//赤色のcssのためです
//       $('#' + id).addClass("now-selected-red");//赤色のcssのためです
//       $(".child_category").remove();//一旦出ている子カテゴリ消します！
//       $(".grand_child_category").remove();//孫、てめえもだ！
//       $.ajax({
//         type: 'GET',
//         url: '/posts/new',//とりあえずここでは、newアクションに飛ばしてます
//         data: {parent_id: id},//どの親の要素かを送ります　params[:parent_id]で送られる
//         dataType: 'json'
//       }).done(function(children) {
//         children.forEach(function (child) {//帰ってきた子カテゴリー（配列）
//           var html = buildChildHTML(child);//HTMLにして
//           $(".children_list").append(html);//リストに追加します
//         })
//       });
//     });
  
//     // 孫カテゴリを追加する処理です　基本的に子要素と同じです！
//     function buildGrandChildHTML(child){
//       var html =`<a class="grand_child_category" id="${child.id}"
//                  href="/posts/${child.id}">${child.name}</a>`;
//       return html;
//     }
  
//     $(document).on("mouseover", ".child_category", function () {//子カテゴリーのリストは動的に追加されたHTMLのため
//       var id = this.id
//       $(".now-selected-gray").removeClass("now-selected-gray");//灰色のcssのため
//       $('#' + id).addClass("now-selected-gray");//灰色のcssのため
//       $.ajax({
//         type: 'GET',
//         url: '/posts/new',
//         data: {parent_id: id},
//         dataType: 'json'
//       }).done(function(children) {
//         children.forEach(function (child) {
//           var html = buildGrandChildHTML(child);
//           $(".grand_children_list").append(html);
//         })
//         $(document).on("mouseover", ".child_category", function () {
//           $(".grand_child_category").remove();
//         });
//       });
//     });  
//   });

$(document).ready(function () {
  // 親カテゴリーを表示
  $('#categoBtn').hover(function (e) {
    e.preventDefault();
    e.stopPropagation();
    $('#tree_menu').show();
    $('.categoryTree').show();
  }, function () {
    // あえて何も記述しない
  });

  // 非同期にてヘッダーのカテゴリーを表示
  function childBuild(children) {
    let child_category = `
                        <li class="category_child">
                          <a href="/posts/${children.id}/search"><input class="child_btn" type="button" value="${children.name}" name= "${children.id}">
                          </a>
                        </li>
                        `
    return child_category;
  }

  function gcBuild(children) {
    let gc_category = `
                        <li class="category_grandchild">
                          <a href="/posts/${children.id}/search"><input class="gc_btn" type="button" value="${children.name}" name= "${children.id}">
                          </a>
                        </li>
                        `
    return gc_category;
  }

  // 親カテゴリーを表示
  $('#categoBtn').hover(function (e) {
    e.preventDefault();
    e.stopPropagation();
    timeOut = setTimeout(function () {
      $('#tree_menu').show();
      $('.categoryTree').show();
    }, 500)
  }, function () {
    clearTimeout(timeOut)
  });

  // 子カテゴリーを表示
  $('.parent_btn').hover(function () {
    $('.parent_btn').css('color', '');
    $('.parent_btn').css('background-color', '');
    let categoryParent = $(this).attr('name');
    timeParent = setTimeout(function () {
      $.ajax({
          url: '/posts/top',
          type: 'GET',
          data: {
            parent_id: categoryParent
          },
          dataType: 'json'
        })
        .done(function (data) {
          $(".categoryTree-grandchild").hide();
          $(".category_child").remove();
          $(".category_grandchild").remove();
          $('.categoryTree-child').show();
          data.forEach(function (child) {
            let child_html = childBuild(child)
            $(".categoryTree-child").append(child_html);
          });
          $('#tree_menu').css('max-height', '490px');
        })
        .fail(function () {
          alert("カテゴリーを選択してください");
        });
    }, 400)
  }, function () {
    clearTimeout(timeParent);
  });

  // 孫カテゴリーを表示
  $(document).on({
    mouseenter: function () {
      $('.child_btn').css('color', '');
      $('.child_btn').css('background-color', '');
      let categoryChild = $(this).attr('name');
      timeChild = setTimeout(function () {
        $.ajax({
            url: '/posts/top',
            type: 'GET',
            data: {
              children_id: categoryChild
            },
            dataType: 'json'
          })
          .done(function (gc_data) {
            $(".category_grandchild").remove();
            $('.categoryTree-grandchild').show();
            gc_data.forEach(function (gc) {
              let gc_html = gcBuild(gc)
              $(".categoryTree-grandchild").append(gc_html);
              let parcol = $('.categoryTree').find(`input[name="${gc.root}"]`);
              $(parcol).css('color', 'white');
              $(parcol).css('background-color', '#b1e9eb');
            });
            $('#tree_menu').css('max-height', '490px');
          })
          .fail(function () {
            alert("カテゴリーを選択してください");
          });
      }, 400)
    },
    mouseleave: function () {
      clearTimeout(timeChild);
    }
  }, '.child_btn');

  // 孫カテゴリーを選択時
  $(document).on({
    mouseenter: function () {
      let categoryGc = $(this).attr('name');
      timeGc = setTimeout(function () {
        $.ajax({
            url: '/posts/top',
            type: 'GET',
            data: {
              gcchildren_id: categoryGc
            },
            dataType: 'json'
          })
          .done(function (gc_result) {
            let childcol = $('.categoryTree-child').find(`input[name="${gc_result[0].parent}"]`);
            $(childcol).css('color', 'white');
            $(childcol).css('background-color', '#b1e9eb');
            $('#tree_menu').css('max-height', '490px');
          })
          .fail(function () {
            alert("カテゴリーを選択してください");
          });
      }, 400)
    },
    mouseleave: function () {
      clearTimeout(timeGc);
    }
  }, '.gc_btn');


  // カテゴリー一覧ページのボタン
  $('#all_btn').hover(function (e) {
    e.preventDefault();
    e.stopPropagation();
    $(".categoryTree-grandchild").hide();
    $(".categoryTree-child").hide();
    $(".category_grandchild").remove();
    $(".category_child").remove();
  }, function () {
    // あえて何も記述しないことで親要素に外れた際のアクションだけを伝搬する
  });

  // カテゴリーを非表示(カテゴリーメニュから0.8秒以上カーソルを外したら消える)
  $(document).on({
    mouseleave: function (e) {
      e.stopPropagation();
      e.preventDefault();
      timeChosed = setTimeout(function () {
        $(".categoryTree-grandchild").hide();
        $(".categoryTree-child").hide();
        $(".categoryTree").hide();
        $(this).hide();
        $('.parent_btn').css('color', '');
        $('.parent_btn').css('background-color', '');
        $(".category_child").remove();
        $(".category_grandchild").remove();
      }, 800);
    },
    mouseenter: function () {
      timeChosed = setTimeout(function () {
        $(".categoryTree-grandchild").hide();
        $(".categoryTree-child").hide();
        $(".categoryTree").hide();
        $(this).hide();
        $('.parent_btn').css('color', '');
        $('.parent_btn').css('background-color', '');
        $(".category_child").remove();
        $(".category_grandchild").remove();
      }, 800);
      clearTimeout(timeChosed);
    }
  }, '#tree_menu');

  // カテゴリーボタンの処理
  $(document).on({
    mouseenter: function (e) {
      e.stopPropagation();
      e.preventDefault();
      timeOpened = setTimeout(function () {
        $('#tree_menu').show();
        $('.categoryTree').show();
      }, 500);
    },
    mouseleave: function (e) {
      e.stopPropagation();
      e.preventDefault();
      clearTimeout(timeOpened);
      $(".categoryTree-grandchild").hide();
      $(".categoryTree-child").hide();
      $(".categoryTree").hide();
      $("#tree_menu").hide();
      $(".category_child").remove();
      $(".category_grandchild").remove();
    }
  }, '.header__headerInner__nav__listsLeft__item');
});