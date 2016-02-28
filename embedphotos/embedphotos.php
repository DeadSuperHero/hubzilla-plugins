<?php

/**
 *
 * Name: Embed Photos
 * Description: Adds a button to the post editor that lets you browse album galleries and select linked images to embed in the post.
 * Version: 0.2.3
 * Author: Andrew Manning <andrew@reticu.li>
 * MinVersion: 1.1.2
 *
 */

function embedphotos_load() {
    register_hook('jot_tool', 'addon/embedphotos/embedphotos.php', 'embedphotos_jot_tool');
    register_hook('display_item', 'addon/embedphotos/embedphotos.php', 'embedphotos_display_item');
    register_hook('comment_buttons', 'addon/embedphotos/embedphotos.php', 'embedphotos_comment_buttons');
}

function embedphotos_unload() {
    unregister_hook('jot_tool', 'addon/embedphotos/embedphotos.php', 'embedphotos_jot_tool');
    unregister_hook('display_item', 'addon/embedphotos/embedphotos.php', 'embedphotos_display_item');
    unregister_hook('comment_buttons', 'addon/embedphotos/embedphotos.php', 'embedphotos_comment_buttons');
}
function embedphotos_install() {
    
}
function embedphotos_uninstall() {
    
}
function embedphotos_module() {
    return;
}

function embedphotos_init($a) {}

function embedphotos_post($a) {  
    if (argc() > 1 && argv(1) === 'album') {
        // API: /embedphotos/album
        $name = (x($_POST,'name') ? $_POST['name'] : null );
        if (!$name) {
            json_return_and_die(array('errormsg' => 'Error retrieving album', 'status' => false));
        }
        $album = embedphotos_widget_album(array('channel' => $a->get_channel(), 'album' => $name));   
//        $album_list = embedphotos_album_list($a);
//        logger('album: ' . $album);
        json_return_and_die(array('status' => true, 'content' => $album));

    }
    if (argc() > 1 && argv(1) === 'albumlist') {
        // API: /embedphotos/albumlist
//        $album = embedphotos_widget_album(array('channel' => $a->get_channel(), 'album' => $name));   
        $album_list = embedphotos_album_list($a);
        json_return_and_die(array('status' => true, 'albumlist' => $album_list));

    }
    if (argc() > 1 && argv(1) === 'photolink') {
        // API: /embedphotos/photolink
        $href = (x($_POST,'href') ? $_POST['href'] : null );
        if (!$href) {
            json_return_and_die(array('errormsg' => 'Error retrieving link ' . $href, 'status' => false));
        }
        $resource_id = array_pop(explode("/", $href));
        $r = q("SELECT object from item where resource_type = 'photo' and resource_id = '%s' limit 1",
			dbesc($resource_id)
		);
        if(!$r) {
            json_return_and_die(array('errormsg' => 'Error retrieving resource ' . $resource_id, 'status' => false));
        }
        $obj = json_decode($r[0]['object'], true);
        if(x($obj,'body')) {
            $photolink = $obj['body'];
        } elseif (x($obj,'bbcode')) {
            $photolink = $obj['bbcode'];
        } else {
            json_return_and_die(array('errormsg' => 'Error retrieving resource ' . $resource_id, 'status' => false));
        }
        json_return_and_die(array('status' => true, 'photolink' => $photolink));

    }
}

function embedphotos_jot_tool ($a, &$b) {
    $b .= replace_macros(get_markup_template('jot_tool.tpl', 'addon/embedphotos'), array(
    ));
}

function embedphotos_comment_buttons ($a, &$b) {
    $b['comment_buttons'] = replace_macros(get_markup_template('embedphotos_button_comment.tpl', 'addon/embedphotos'), array(
        '$id' => $b['id']
    ));
}

function embedphotos_album_list($a) {
    $o = '';
    require_once('include/photos.php');
    $p = photos_albums_list($a->get_channel(), $a->get_observer());
    if ($p['success']) {
        return $p['albums'];
    } else {
        return null;
    }
}

/**
 * Copied from include/widgets.php::widget_album() with a modification to get the profile_uid from 
 * the input array as in widget_item()
 * @param type $name
 * @return string
 */
function embedphotos_widget_album($args) {

    $channel_id = 0;
    if(array_key_exists('channel',$args))
            $channel = $args['channel'];
            $channel_id = intval($channel['channel_id']);
    if(! $channel_id)
            $channel_id = get_app()->profile_uid;
    if(! $channel_id)
            return '';

    require_once('include/security.php');
    $sql_extra = permissions_sql($channel_id);

    if(! perm_is_allowed($channel_id,get_observer_hash(),'view_storage'))
            return '';

    if($args['album'])
            $album = $args['album'];
    if($args['title'])
            $title = $args['title'];

    /** 
     * This may return incorrect permissions if you have multiple directories of the same name.
     * It is a limitation of the photo table using a name for a photo album instead of a folder hash
     */

    if($album) {
            $x = q("select hash from attach where filename = '%s' and uid = %d limit 1",
                    dbesc($album),
                    intval($channel_id)
            );
            if($x) {
                    $y = attach_can_view_folder($channel_id,get_observer_hash(),$x[0]['hash']);
                    if(! $y)
                            return '';
            }
    }

    $order = 'DESC';

    $r = q("SELECT p.resource_id, p.id, p.filename, p.type, p.scale, p.description, p.created FROM photo p INNER JOIN
            (SELECT resource_id, max(scale) scale FROM photo WHERE uid = %d AND album = '%s' AND scale <= 4 AND photo_usage IN ( %d, %d ) $sql_extra GROUP BY resource_id) ph 
            ON (p.resource_id = ph.resource_id AND p.scale = ph.scale)
            ORDER BY created $order ",
            intval($channel_id),
            dbesc($album),
            intval(PHOTO_NORMAL),
            intval(PHOTO_PROFILE)
    );

    //edit album name
    $album_edit = null;

    $photos = array();
    if($r) {
            $twist = 'rotright';
            foreach($r as $rr) {

                    if($twist == 'rotright')
                            $twist = 'rotleft';
                    else
                            $twist = 'rotright';

                    $ext = $phototypes[$rr['type']];

                    $imgalt_e = $rr['filename'];
                    $desc_e = $rr['description'];

                    $imagelink = (z_root() . '/photos/' . $channel['channel_address'] . '/image/' . $rr['resource_id']);


                    $photos[] = array(
                            'id' => $rr['id'],
                            'twist' => ' ' . $twist . rand(2,4),
                            'link' => $imagelink,
                            'title' => t('View Photo'),
                            'src' => z_root() . '/photo/' . $rr['resource_id'] . '-' . $rr['scale'] . '.' .$ext,
                            'alt' => $imgalt_e,
                            'desc'=> $desc_e,
                            'ext' => $ext,
                            'hash'=> $rr['resource_id'],
                            'unknown' => t('Unknown')
                    );
            }
    }


    $tpl = get_markup_template('photo_album.tpl');
    $o .= replace_macros($tpl, array(
            '$photos' => $photos,
            '$album' => (($title) ? $title : $album),
            '$album_id' => rand(),
            '$album_edit' => array(t('Edit Album'), $album_edit),
            '$can_post' => false,
            '$upload' => array(t('Upload'), z_root() . '/photos/' . $channel['channel_address'] . '/upload/' . bin2hex($album)),
            '$order' => false,
            '$upload_form' => $upload_form,
            '$usage' => $usage_message
    ));

    return $o;
}

function embedphotos_display_item ($a, &$b) {
    $cnt = preg_match("/\"comment-edit-wrapper-(.*?)\"/ism", $b['output']['comment'], $matches);
    logger('matches: ' . json_encode($matches));
    if($b['output']['comment'] !== "") {
        $b['output']['comment'] .= replace_macros(get_markup_template('embedphotos_button_comment_modal.tpl', 'addon/embedphotos'), array(
            '$id' => $matches[1]
        ));
    }
}