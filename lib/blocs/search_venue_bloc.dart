import 'package:rxdart/rxdart.dart';
import '../repository/venue_repository.dart';
import '../models/venue.dart';

class SearchVenueBloc {
  final _venueRepository = VenueRepository();

  final _venueFetcher = PublishSubject<Venue>();

  fetchNearbyVenues() async {
    Venue venue = await _venueRepository.fetchNearByVenues();
    _venueFetcher.sink.add(venue);
  }

  dispose() {
    _venueFetcher.close();
  }
}

final searchVenueBloc = SearchVenueBloc();