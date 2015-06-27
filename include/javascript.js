/*
function checkLength(str)
{
	var len = str.length;
	if(len < 6)
	{
		return false;
	}
	else
	{
		return true;
	}
}
function IsBlank( str ) {
	var isValid = false;
 	if ( IsNull(str) || IsUndef(str) || (str+"" == "") )
 		isValid = true;
	return isValid;
}
function IsUndef( val ) {
	var isValid = false;
 	if (val+"" == "undefined")
 		isValid = true;
	return isValid;
}
function IsNull( val ) {
	var isValid = false;
 	if (val+"" == "null")
 		isValid = true;
	return isValid;
}
function IsAlpha( str ) {
	if (str+"" == "undefined" || str+"" == "null" || str+"" == "")
		return false;
	var isValid = true;
		str += "";
  	for (i = 0; i < str.length; i++) {
		if ( !( ((str.charAt(i) >= "a") && (str.charAt(i) <= "z")) ||
      			((str.charAt(i) >= "A") && (str.charAt(i) <= "Z")) ) ) {
         				isValid = false;
         				break;
      			}
   }
	return isValid;
}
function IsValidEmail( str ) {
	if (str+"" == "undefined" || str+"" == "null" || str+"" == "")
		return false;
	var isValid = true;	str += "";namestr = str.substring(0, str.indexOf("@"));
	domainstr = str.substring(str.indexOf("@")+1, str.length);
   	if (IsBlank(str) || (namestr.length == 0) ||(domainstr.indexOf(".") <= 0) ||(domainstr.indexOf("@") != -1) ||!IsAlpha(str.charAt(str.length-1)))
		{isValid = false;return isValid;}
}

function launchwin(URL, name, pram){
window.open(URL, name, pram)
}

function Process()
{
	document.all.loading.style.visibility = 'visible';
}

function isFloat(op)
{
	exp = new RegExp("^\\s*([-+]?)(\\d+)?(\\.\\d+)?\\s*$");
	m = op.match(exp);
      if (m == null)
      	return null;
      cleanInput = m[1] + (m[2].length > 0 ? m[2] : "0") + m[3];
      num = parseFloat(cleanInput);
      return (isNaN(num) ? null : num);            
}

function isInteger(op)
{
	if(op==0)
		return true;
	else
	{
	exp = /^\s*[-+]?\d+\s*$/;
      if (op.match(exp) == null) 
      	return null;
      num = parseInt(op, 10);
      return (isNaN(num) ? null : num);
	}
}
*/