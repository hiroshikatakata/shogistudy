window.addEventListener('DOMContentLoaded', function() {
  const createImageHTML = (blob) => {
    var html= `<div class="preview_inner_box">
                 <img src=${blob} id="new_image" width="114" height="80" >
                 <div class="preview_image_number">[図]${setnum}</div>
               </div>`
    const imageElement = document.getElementById('preview_box');
    imageElement.innerHTML += html
    var img = document.getElementById('new_image');
    new_image.setAttribute('src', blob);
    new_image.setAttribute('id', 'new_preview');
    setnum++;
  };
  var setnum = 1;
  document.getElementById('board_image_name').addEventListener('change', (e) =>{
    for (let i = 0; i < e.target.files.length; i++) {
      console.log(e.target.files[i]);
      const file = e.target.files[i];
      const blob = window.URL.createObjectURL(file);
      createImageHTML(blob);
    }
  });
});
