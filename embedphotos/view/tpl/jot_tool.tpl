<style>
    .embed-photo-selected-photo {
        border-color: blue;
        border-style: solid;
        border-width: 5px;
    }
</style>
<script>
    var initializeEmbedPhotoDialog = function () {
        $('.embed-photo-selected-photo').each(function (index) {
            $(this).removeClass('embed-photo-selected-photo');
        });
        getPhotoAlbumList();
        $('#embedPhotoModalBodyAlbumDialog').off('click');
        $('#embedPhotoModal').modal();
    };
    var choosePhotoFromAlbum = function (album) {
        $.post("embedphotos/album", {name: album}, 
            function(data) {
                if (data['status']) {
                    $('#embedPhotoModalLabel').html('Choose images to embed');
                    $('#embedPhotoModalBodyAlbumDialog').html('\
                            <div><ul class="nav">\n\
                                <li><a href="#" onclick="initializeEmbedPhotoDialog();return false;">\n\
                                    <i class="icon-chevron-left"></i>&nbsp\n\
                                    Choose a different album...\n\
                                    </a>\n\
                                </li>\n\
                            </ul><br></div>')
                    $('#embedPhotoModalBodyAlbumDialog').append(data['content']);
                    $('#embedPhotoModalBodyAlbumDialog').click(function (evt) {
                        evt.preventDefault();
                        var image = document.getElementById(evt.target.id);
                        if (typeof($(image).parent()[0]) !== 'undefined') {
                            var imageparent = document.getElementById($(image).parent()[0].id);
                            $(imageparent).toggleClass('embed-photo-selected-photo');        
                        }
                    });
                    $('#embedPhotoModalBodyAlbumListDialog').addClass('hide');
                    $('#embedPhotoModalBodyAlbumDialog').removeClass('hide');
                    $('#embed-photo-OKButton').click(function () {
                        $('.embed-photo-selected-photo').each(function (index) {
                            var href = $(this).attr('href');
                            $.post("embedphotos/photolink", {href: href}, 
                                function(ddata) {
                                    if (ddata['status']) {
                                        addeditortext(ddata['photolink']);
                                    } else {
                                        window.console.log('Error getting photo link' + ':' + ddata['errormsg']);
                                    }
                                    return false;
                                },
                            'json');
                        });
                        $('#embedPhotoModalBodyAlbumDialog').html('');
                        $('#embedPhotoModalBodyAlbumDialog').off('click');
                        $('#embedPhotoModal').modal('hide');
                    });
                } else {
                    window.console.log('Error getting album ' + JSON.stringify(album) + ':' + data['errormsg']);
                }
                return false;
            },
        'json');
    };
    var getPhotoAlbumList = function () {
        $.post("embedphotos/albumlist", {}, 
            function(data) {
                if (data['status']) {
                    var albums = data['albumlist']; //JSON.parse(data['albumlist']);
                    $('#embedPhotoModalLabel').html('Choose an album');
                    $('#embedPhotoModalBodyAlbumList').html('<ul class="nav"></ul>');
                    for(var i=0; i<albums.length; i++) {
                        var albumName = albums[i].text;
                        var albumLink = '<li>';
                        albumLink += '<a href="#" onclick="choosePhotoFromAlbum(\'' + albumName + '\');return false;">' + albumName + '</a>';
                        albumLink += '</li>';
                        $('#embedPhotoModalBodyAlbumList').find('ul').append(albumLink);
                    }
                    $('#embedPhotoModalBodyAlbumDialog').addClass('hide');
                    $('#embedPhotoModalBodyAlbumListDialog').removeClass('hide');
                } else {
                    window.console.log('Error getting album list' + ':' + data['errormsg']);
                }
                return false;
            },
        'json');
    };
</script>
{{include file="addon/embedphotos/view/tpl/embedphotos_button.tpl"}}
<!-- Modal for embed photo-->
<div class="modal" id="embedPhotoModal" tabindex="-1" role="dialog" aria-labelledby="expiryModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="embedPhotoModalLabel">Embed a Photo</h4>
      </div>
     <div class="modal-body" id="embedPhotoModalBody" >
         <div id="embedPhotoModalBodyAlbumListDialog" class="hide">
            <div id="embedPhotoModalBodyAlbumList"></div>
         </div>
         <div id="embedPhotoModalBodyAlbumDialog" class="hide">
         </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
        <button id="embed-photo-OKButton" type="button" class="btn btn-primary">OK</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->