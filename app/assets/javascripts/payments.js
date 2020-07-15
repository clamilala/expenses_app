
document.addEventListener('turbolinks:load', function(){

    /* 金額テキストボックスに onchange イベントを追加 */
    document.getElementById("pay_amount").onchange = function() {
      document.getElementById('pay_amount_message').innerHTML = ''
    };
    /* 金額テキストボックスに onblur イベントを追加 */
    document.getElementById("pay_amount").onblur = function() {
    
      let message = '';
      if (document.getElementById('pay_amount').value === "") {
        message = '数字を入力して下さい';
      };
  
      document.getElementById('pay_amount_message').innerHTML = message
    };
    
  });