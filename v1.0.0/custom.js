
// Load in Cytcoscape: There should be a better way to do this!
requirejs.config({ paths: {
  cytoscape: 'cytoscape.min'
} });

// Make Scrolling Work on Ipad 
var style = document.createElement("style"); 
style.innerHTML = "body {-webkit-overflow-scrolling: touch;}"
document.getElementsByTagName("body")[0].appendChild(style)

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
    //document.getElementsByClassName("terminado-container-container")[0].style.padding = "0px"
}

// create "web view" button for notebooks
if( $(IPython.toolbar.selector.concat(' > #web-view')).length == 0 ){
  IPython.toolbar.add_buttons_group([
        {    'label'   : ' Web',
             'icon'    : 'fa fa-lg fa-id-card-o',
             'callback': function(){
                 IPython.notebook.execute_all_cells();
                 Jupyter.actions.call("collapsible_headings:collapse_all_headings")
                 Jupyter.actions.call("hide_header:toggle")
                 // hide code cells, if they are there
                 if( document.getElementById("toggle_codecells").getElementsByClassName("fa fa-eye").length == 1 ){
                     document.getElementById("toggle_codecells").click();
                     }
             }
        }
    ], 'web-view');
    // makes it look pretty
    document.getElementById("web-view").getElementsByClassName("btn btn-default")[0].className="btn btn-lg btn-success"
} 

// Create "Clean Up" Button for notebooks
if($(IPython.toolbar.selector.concat(' > #clean-view')).length == 0){
  IPython.toolbar.add_buttons_group([
        {    'label'   : ' ',
             'icon'    : 'fa fa-lg fa-bolt',
             'callback': function(){
                 Jupyter.notebook.clear_all_output()
                 Jupyter.actions.call("collapsible_headings:uncollapse_all_headings")
                 //document.getElementById("header").style.display = "block"; //NO NEEDED, if they see the header
                 // show code cells, if they are hidden
                 if( document.getElementById("toggle_codecells").getElementsByClassName("fa fa-eye-slash").length == 1 ){
                     document.getElementById("toggle_codecells").click();
                     }
                 Jupyter.actions.call("widgets:save-clear-widgets");
                 Jupyter.notebook.save_checkpoint();
                 }
        }
    ], 'clean-view');
    // makes it look pretty
    document.getElementById("clean-view").getElementsByClassName("btn btn-default")[0].className="btn btn-danger"
} 




