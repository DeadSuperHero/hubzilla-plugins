<?php

/**
 *
 * Name: Documentation
 * Description: Hubzilla Documentation
 * Version: 0.1
 * Author: Andrew Manning <andrew@reticu.li>
 * MinVersion: 1.1.2
 *
 */

function docs_load() {
    register_hook('load_pdl', 'addon/docs/docs.php', 'docs_load_pdl');
}

function docs_unload() {
    unregister_hook('load_pdl', 'addon/docs/docs.php', 'docs_load_pdl');    
}

function docs_install() {}
function docs_uninstall() {}
function docs_module() {}


function docs_load_pdl($a, &$b) {
    if ($b['module'] === 'docs') {
        $b['layout'] = '
            [template]none[/template]
        ';
    }
}

function docs_init($a) {}

function docs_content (&$a) {
    
    $css_files = array('/addon/docs/view/css/bootswatch/Cosmo/bootstrap.min.css', 
        '/addon/docs/view/css/jquery.tocify.css',
        '/addon/docs/view/css/jquery-ui.css',
        '/addon/docs/view/css/prettify.css',
        '/addon/docs/view/css/styles.css',
        '/addon/docs/view/css/rainbow/themes/tomorrow-night.css',
        '/addon/docs/view/css/rainbowlines/theme.css');
    $css_html = '';
    foreach ($css_files as $file) {
        $css_html .= '<link href="' . $file . '" rel="stylesheet" type="text/css" media="screen">\r\n';
    }
    $a->page['htmlhead'] .= $css_html;
    
    $js_files = array('/addon/docs/view/js/rainbow/rainbow.min.js',
    '/addon/docs/view/js/rainbow/language/generic.js',
    '/addon/docs/view/js/rainbow/language/html.js',
    '/addon/docs/view/js/rainbow/language/css.js',
    '/addon/docs/view/js/rainbow/language/javascript.js',
    '/addon/docs/view/js/rainbowlines/rainbow.linenumbers.js',
    '/addon/docs/view/js/jquery.min.js',
    '/addon/docs/view/js/jquery-ui.min.js',
    '/addon/docs/view/js/bootstrap.min.js',
    '/addon/docs/view/js/jquery.tocify.min.js',
    '/addon/docs/view/js/prettify.js');
    
    $js_html = '';
    foreach ($js_files as $file) {
        $js_html .= '<script src="' . $file . '"></script>';
    }
    $a->page['htmlhead'] .= $js_html;
    $o .= replace_macros(get_markup_template('docs_full.tpl', 'addon/docs'), array());
    
    return $o;
}