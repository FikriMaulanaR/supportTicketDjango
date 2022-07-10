    function change() {
  
        var spans = document.getElementsByTagName('span');
        
        console.log(spans.length);
        for (var i=1;i<spans.length; i++) {
            console.log(spans);
            if (spans[i].innerText === "Open") {
                spans[i].className = "label label-success";
            } else if (spans[i].innerText === "Close") {
                spans[i].className = "label label-danger";
            } else if (spans[i].innerText === "Low") {
                spans[i].className = "label label-success";
            } else if (spans[i].innerText === "Moderate") {
                spans[i].className = "label label-warning";
            } else if (spans[i].innerText === "High") {
                spans[i].className = "label label-danger";
            }
          
        }
    }
    window.onload = change(); 
