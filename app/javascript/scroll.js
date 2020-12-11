function scroll() {
  let target = document.getElementById('scroll-inner');
  target.scrollIntoView(false);
  console.log(target)
}
window.addEventListener('load', scroll)
