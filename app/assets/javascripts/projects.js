// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

function GetCurrency()
{
    var xmlHttp = new XMLHttpRequest();
    xmlHttp.open( "GET", 'http://apilayer.net/api/live?access_key=6bf5a672c5e0d6a3c28465bb5220d35f&currencies='+document.getElementById("currency").value+'&format=1', false );
    xmlHttp.send( null );
    obj = JSON.parse(xmlHttp.responseText);
    quotes = obj.quotes;
    value = quotes[Object.keys(quotes)[0]];
    var current = +($('#current-usd').text());
    var goal = +($('#goal-usd').text());
    // $('#current').text('$'+Math.round(value*current));
    // $('#goal').text('$'+Math.round(value*goal));

    return xmlHttp.responseText;
}
