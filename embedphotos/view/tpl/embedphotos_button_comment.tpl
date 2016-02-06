<style>
    .embed-photo-selected-photo {
        border-color: blue;
        border-style: solid;
        border-width: 5px;
    }
</style>
<script>
    var initializeEmbedPhotoDialogComment{{$id}} = function (id) {
        $('.embed-photo-selected-photo').each(function (index) {
            $(this).removeClass('embed-photo-selected-photo');
        });
        getPhotoAlbumListComment{{$id}}();
        $('#embedPhotoModal-{{$id}}').modal('show');
    };
    var choosePhotoFromAlbumComment{{$id}} = function (album) {
        $.post("embedphotos/album", {name: album}, 
            function(data) {
                if (data['status']) {
                    $('#embedPhotoModalBodyAlbumDialog-{{$id}}').html('<a href="#" onclick="getPhotoAlbumListComment{{$id}}();return false;">Choose a different album...</a><hr>')
                    $('#embedPhotoModalBodyAlbumDialog-{{$id}}').append(data['content']);
                    $('#embedPhotoModalBodyAlbumDialog-{{$id}}').click(function (evt) {
                        evt.preventDefault();
                        var image = document.getElementById(evt.target.id);
                        if (typeof($(image).parent()[0]) !== 'undefined') {
                            var imageparent = document.getElementById($(image).parent()[0].id);
                            $(imageparent).toggleClass('embed-photo-selected-photo');        
                        }
                    });
                    $('#embedPhotoModalBodyAlbumListDialog-{{$id}}').addClass('hide');
                    $('#embedPhotoModalBodyAlbumDialog-{{$id}}').removeClass('hide');
                    $('#embed-photo-OKButton-{{$id}}').click(function () {
                        $('.embed-photo-selected-photo').each(function (index) {
                            var href = $(this).attr('href');
                            $.post("embedphotos/photolink", {href: href}, 
                                function(ddata) {
                                    if (ddata['status']) {
                                        if($("#comment-edit-text-{{$id}}").hasClass("comment-edit-text-empty")) {
                                            $("#comment-edit-text-{{$id}}").addClass("comment-edit-text-full").removeClass("comment-edit-text-empty");
                                            $("#comment-edit-text-{{$id}}").attr('tabindex','9');
                                            $("#comment-edit-submit-{{$id}}").attr('tabindex','10');
                                            $("#comment-tools-{{$id}}").show();
                                            var currentComment = '';
                                        } else {
                                            var currentComment = $("#comment-edit-text-{{$id}}").val();
                                        }
                                        
                                        $("#comment-edit-text-{{$id}}").val(currentComment + ddata['photolink']);
                                    } else {
                                        window.console.log('Error getting photo link' + ':' + ddata['errormsg']);
                                    }
                                    return false;
                                },
                            'json');
                        });
                        $('#embedPhotoModalBodyAlbumDialog-{{$id}}').html('');
                        $('#embedPhotoModalBodyAlbumDialog-{{$id}}').off('click');
                        $('#embedPhotoModal-{{$id}}').modal('hide');
                    });
                } else {
                    window.console.log('Error getting album ' + JSON.stringify(album) + ':' + data['errormsg']);
                }
                return false;
            },
        'json');
    };
    var getPhotoAlbumListComment{{$id}} = function () {
        $.post("embedphotos/albumlist", {}, 
            function(data) {
                if (data['status']) {
                    var albums = data['albumlist']; //JSON.parse(data['albumlist']);
                    $('#embedPhotoModalBodyAlbumList-{{$id}}').html('<ul>');
                    for(var i=0; i<albums.length; i++) {
                        var albumName = albums[i].text;
                        var albumLink = '<li>';
                        albumLink += '<a href="#" onclick="choosePhotoFromAlbumComment{{$id}}(\'' + albumName + '\');return false;">' + albumName + '</a>';
                        albumLink += '</li>';
                        $('#embedPhotoModalBodyAlbumList-{{$id}}').append(albumLink);
                    }
                    $('#embedPhotoModalBodyAlbumList-{{$id}}').append('</ul>');
                    $('#embedPhotoModalBodyAlbumDialog-{{$id}}').addClass('hide');
                    $('#embedPhotoModalBodyAlbumListDialog-{{$id}}').removeClass('hide');
                } else {
                    window.console.log('Error getting album list' + ':' + data['errormsg']);
                }
                return false;
            },
        'json');
    };
</script>
<div class='btn-group'>
<button id="embed-photo-wrapper-comment" class="btn btn-default btn-xs" title="Embed a photo" onclick="initializeEmbedPhotoDialogComment{{$id}}({{$id}});return false;">
    <i id="embed-photo-comment" class="icon-picture jot-icons"></i>
</button>
</div>