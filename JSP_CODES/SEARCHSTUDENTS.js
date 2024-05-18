function f1()
{
    var searchall2=document.getElementById("SEARCHALL");
    var button=document.getElementById("BUTTON");
    
    var task1=document.getElementById("TASK1FORM");
    var task2=document.getElementById("TASK2FORM");
    task2.className="TASK2FORMVISIBLE";
    task1.className="TASK1FORMINVISIBLE";    
    button.className="BUTTONINVISIBLE";
}

function f2()
{
    var searchsingle2=document.getElementById("SEARCHSINGLE");
    var button=document.getElementById("BUTTON");
    
    var task1=document.getElementById("TASK1FORM");
    var task2=document.getElementById("TASK2FORM");
    task1.className="TASK1FORMVISIBLE";
    task2.className="TASK2FORMINVISIBLE";
     button.className="BUTTONINVISIBLE btn-outline-warning";
}
var searchall=document.getElementById("SEARCHALL");
var searchsingle=document.getElementById("SEARCHSINGLE");

searchall.onchange=f1;
searchsingle.onchange=f2;
