<?php

/**
 *
 * Name: Help Pages
 * Description: Documentation to supplant the Help pages
 * Version: 0.1
 * Author: Andrew Manning <andrew@reticu.li>
 * MinVersion: 1.1.2
 *
 */

function help_load() {
    register_hook('load_pdl', 'addon/help/help.php', 'help_load_pdl');
}

function help_unload() {
    unregister_hook('load_pdl', 'addon/help/help.php', 'help_load_pdl');    
}

function help_install() {}
function help_uninstall() {}
function help_module() {}


function help_load_pdl($a, &$b) {
    if ($b['module'] === 'help') {
        $b['layout'] = '
            [template]none[/template]
        ';
    }
}

function help_init($a) {}

function help_content (&$a) {
//    head_add_css('/addon/help/view/css/bootswatch/Cosmo/bootstrap.min.css');
//    head_add_css('/addon/help/view/css/jquery.tocify.css');
//    head_add_css('/addon/help/view/css/jquery-ui.css');
//    head_add_css('/addon/help/view/css/prettify.css');
//    head_add_css('/addon/help/view/css/styles.css');
//    head_add_css('/addon/help/view/css/rainbow/themes/tomorrow-night.css');
//    head_add_css('/addon/help/view/css/rainbowlines/theme.css');
    
    $css_files = array('/addon/help/view/css/bootswatch/Cosmo/bootstrap.min.css', 
        '/addon/help/view/css/jquery.tocify.css',
        '/addon/help/view/css/jquery-ui.css',
        '/addon/help/view/css/prettify.css',
        '/addon/help/view/css/styles.css',
        '/addon/help/view/css/rainbow/themes/tomorrow-night.css',
        '/addon/help/view/css/rainbowlines/theme.css');
    $css_html = '';
    foreach ($css_files as $file) {
        $css_html .= '<link href="' . $file . '" rel="stylesheet" type="text/css" media="screen">\r\n';
    }
    $a->page['htmlhead'] .= $css_html;
//    head_add_js('/addon/help/view/js/rainbow/rainbow.min.js');
//    head_add_js('/addon/help/view/js/rainbow/language/generic.js');
//    head_add_js('/addon/help/view/js/rainbow/language/html.js');
//    head_add_js('/addon/help/view/js/rainbow/language/css.js');
//    head_add_js('/addon/help/view/js/rainbow/language/javascript.js');
//    head_add_js('/addon/help/view/js/rainbowlines/rainbow.linenumbers.js');
//    head_add_js('/addon/help/view/js/jquery.min.js');
//    head_add_js('/addon/help/view/js/jquery-ui.min.js');
//    head_add_js('/addon/help/view/js/bootstrap.min.js');
//    head_add_js('/addon/help/view/js/jquery.tocify.min.js');
//    head_add_js('/addon/help/view/js/prettify.js');
    
    $js_files = array('/addon/help/view/js/rainbow/rainbow.min.js',
    '/addon/help/view/js/rainbow/language/generic.js',
    '/addon/help/view/js/rainbow/language/html.js',
    '/addon/help/view/js/rainbow/language/css.js',
    '/addon/help/view/js/rainbow/language/javascript.js',
    '/addon/help/view/js/rainbowlines/rainbow.linenumbers.js',
    '/addon/help/view/js/jquery.min.js',
    '/addon/help/view/js/jquery-ui.min.js',
    '/addon/help/view/js/bootstrap.min.js',
    '/addon/help/view/js/jquery.tocify.min.js',
    '/addon/help/view/js/prettify.js');
    
    $js_html = '';
    foreach ($js_files as $file) {
        $js_html .= '<script src="' . $file . '"></script>';
    }
    $a->page['htmlhead'] .= $js_html;
    $o .= replace_macros(get_markup_template('help_full.tpl', 'addon/help'), array());
    
    return $o;
}