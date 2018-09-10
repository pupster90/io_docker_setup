
// Load in Cytcoscape: There should be a better way to do this!
requirejs.config({ paths: {
  cytoscape: 'cytoscape.min'
} });

// Change Text Editor View 
if( document.getElementById("texteditor-container") != null ){
    document.getElementById("texteditor-container").className = "container-fluid"
    document.getElementById("menubar-container").className = "container-fluid"
    document.getElementById("header-container").className = "container-fluid"
    document.getElementById("texteditor-backdrop").style.padding = "0px"
}

// Change Terminal View 
if( document.getElementById("terminado-container") != null ){
    document.getElementById("terminado-container").className = "container-fluid"
    document.getElementById("header-container").className = "container-fluid"
    document.getElementsByClassName("terminado-container-container")[0].style.padding = "0px"
}

// Make Scrolling Work on Ipad 
var style = document.createElement("style"); 
style.innerHTML = "body {-webkit-overflow-scrolling: touch;}"
document.getElementsByTagName("body")[0].appendChild(style)


