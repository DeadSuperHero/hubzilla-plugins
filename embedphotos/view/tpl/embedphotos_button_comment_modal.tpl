<!-- Modal for embed photo-->
<div class="modal" id="embedPhotoModal-{{$id}}" tabindex="-1" role="dialog" aria-labelledby="embedPhotoModalLabel-{{$id}}" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="embedPhotoModalLabel-{{$id}}">Embed a Photo</h4>
      </div>
     <div class="modal-body" id="embedPhotoModalBody-{{$id}}" >
         <div id="embedPhotoModalBodyAlbumListDialog-{{$id}}" class="hide">
            <div id="embedPhotoModalBodyAlbumList-{{$id}}"></div>
         </div>
         <div id="embedPhotoModalBodyAlbumDialog-{{$id}}" class="hide">
         </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
        <button id="embed-photo-OKButton-{{$id}}" type="button" class="btn btn-primary">OK</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->