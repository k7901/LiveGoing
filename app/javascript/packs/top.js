/* global $ */
 $(document).ready(function() {
  $('#searchInput').click(function() {
    $('#regionModal').modal('show');
  });

  $('#regionModal .list-group-item').click(function() {
    var selectedRegionId = $(this).data('region-id');
    $.get('/prefectures_for_region', { region_id: selectedRegionId }, function(prefectures) {
      $('#prefectureSelect').empty();
      $.each(prefectures, function(index, prefecture) {
        $('#prefectureSelect').append($('<option>', {
          value: prefecture.id,
          text: prefecture.name
        }));
      });
      $('#regionModal').modal('hide');
      $('#prefectureModal').modal('show');
    });
  });

  $('#prefectureModal .btn-primary').click(function() {
    var selectedPrefectureId = $('#prefectureSelect').val();
    $.get('/venues_for_prefecture', { prefecture_id: selectedPrefectureId }, function(venues) {
      $('#venueSelect').empty();
        $.each(venues, function(index, venue) {
        $('#venueSelect').append($('<option>', {
          value: venue.id,
          text: venue.name
        }));
      });
      $('#venueModal').modal('hide');
      $('#venueModal').modal('show');
    });
  });

  $('#venueModal .btn-primary').click(function() {
    var selectedVenue = $('#venueSelect').val();
    $('#searchInput').val($('#venueSelect option:selected').text());
  });
});


