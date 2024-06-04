/**
 * 
 */
  window.onload = function() {
    var urlParams = new URLSearchParams(window.location.search);
    var autoClick = urlParams.get('autoClick');

    if (autoClick === 'true') {
      var p_login_header = document.querySelector("#p_login_header");
      if (p_login_header) {
        p_login_header.click();
      }
    }
  };