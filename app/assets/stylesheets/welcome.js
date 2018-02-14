let sliderImages = document.querySelectorAll('.slide');
let	arrowR = document.querySelectorAll('#arrowR');
let arrowL = document.querySelectorAll('#arrowL');
let current = 0;

function reset(){
	let i;
	for(i=0,i<sliderImages.length; i++)
	{
		sliderImages[i].style.display = 'none';
	}
startSlide();