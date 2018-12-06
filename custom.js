
// Make Scrolling Work on Ipad 
var style = document.createElement("style"); 
style.innerHTML = "body {-webkit-overflow-scrolling: touch;}"
document.getElementsByTagName("body")[0].appendChild(style)


// Change Main Page View
if( document.getElementById("tab_content") != null ){
    var logo = document.getElementById("ipython_notebook");
    logo.innerHTML += '<font size="5" face="Georgia" color="magenta">&nbsp; &nbsp; io</font>';
    logo.innerHTML += '<font size="3" color="gray"><sub>v3.0.0</sub></font>';
}

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
    document.getElementById("header").style.display = "none"
}

// Change Notebook View
if( document.getElementById("notebook-container") != null ){
    // *** Add Keyboard Commands for iPad ***
    // Movement between Cells
    Jupyter.keyboard_manager.command_shortcuts.add_shortcut('-', 'jupyter-notebook:select-previous-cell');
    Jupyter.keyboard_manager.command_shortcuts.add_shortcut('=', 'jupyter-notebook:select-next-cell');
    Jupyter.keyboard_manager.command_shortcuts.add_shortcut('shift--', 'jupyter-notebook:extend-selection-above');
    Jupyter.keyboard_manager.command_shortcuts.add_shortcut('shift-=', 'jupyter-notebook:extend-selection-below');
    Jupyter.keyboard_manager.command_shortcuts.add_shortcut('Ctrl-Shift--', 'jupyter-notebook:move-cell-up');
    Jupyter.keyboard_manager.command_shortcuts.add_shortcut('Ctrl-Shift-=', 'jupyter-notebook:move-cell-down');
    // Controls Collapssing
    Jupyter.keyboard_manager.command_shortcuts.add_shortcut(']', 'collapsible_headings:uncollapse_heading');
    Jupyter.keyboard_manager.command_shortcuts.add_shortcut('[', 'collapsible_headings:collapse_heading');
    Jupyter.keyboard_manager.command_shortcuts.add_shortcut('shift-]', 'collapsible_headings:uncollapse_all_headings');
    Jupyter.keyboard_manager.command_shortcuts.add_shortcut('shift-[', 'collapsible_headings:collapse_all_headings');
    // SKETCHY ONE // Entre command mode
    Jupyter.keyboard_manager.edit_shortcuts.add_shortcut('shift-backspace', 'jupyter-notebook:enter-command-mode');
    
    
    // *** Change the Style of the notebook ***
    // Code is copied from here: https://stackoverflow.com/questions/524696/how-to-create-a-style-tag-with-javascript
    var head = document.head || document.getElementsByTagName('head')[0]
    var style_notebook = document.createElement('style'); //<-- Where we write all of hte <style> changes
    var css = "\
            /* Remove Enormous Margins */ \
            *{margin:0; padding:0;} html, body, \
                 .container{margin:0;!important padding:0;!important} \
                 .container { width:100% !important;}  \
            \
            /* Make Container Background white */ \
            #notebook-container { box-shadow: 0px 0px 0px 0px rgba(87, 87, 87, 0.2); } \
            div#notebook { background-color: White; } \
            .end_space { background-color: White; } \
            \
            /* Customize text cells */ \
            div.text_cell.rendered { font-size:1.1em; line-height:1.4em; } \
            \
            /* We make the little box to the left of the cell as small as possible */ \
	    .prompt { max-width: 10ex; } \
	    .prompt_container { max-width: 10ex } \
            .input_prompt { margin:0; padding:0; font-size:.7em; max-width: 4ch; text-align: left; } \
            .input_prompt bdi { display: none; padding: 0; } \
            .input_prompt i { font-size: 2em; opacity: 0.7; } \
            .run_this_cell{ padding: 0; display: visible; max-width: 3ch;  text-algin: left; } \
	    \
            /* make run icons bigger */ \
            .run_this_cell i { display: visible; font-size: 2em; opacity: 0.7; } \
	    \
            /* Makes html output width larger and remove padding */ \
            div.output_subarea { max-width: 100%; padding: 0; } \
        "
    style_notebook.type = 'text/css';
    if (style_notebook.styleSheet){
      
      style_notebook.styleSheet.cssText = css; //<-- This is required for IE8 and below.
    } else {
      style_notebook.appendChild(document.createTextNode(css));
    }
    head.appendChild(style_notebook);
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


// Load in Cytcoscape: There should be a better way to do this!
requirejs.config({ paths: {
  cytoscape: 'cytoscape.min'
} });


