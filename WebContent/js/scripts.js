$(function(){

	$('#coolMenu').find('> li').hover(function(){
		$(this).find('ul')
		.removeClass('noJS')
		.stop(true, true).slideToggle('fast');
	});
	
});
function placeholderIsSupported() {
		test = document.createElement('input');
		return ('placeholder' in test);
	}

$(document).ready(function(){
  placeholderSupport = placeholderIsSupported() ? 'placeholder' : 'no-placeholder';
  $('html').addClass(placeholderSupport);  
});

function sessioneScadutta() {
    alert("SESSIONE SCADUTA");
    window.location = "main";
    
}
function ErrorePassword() {
    alert("USERNAME O PASSWORD ERRATI");
}

