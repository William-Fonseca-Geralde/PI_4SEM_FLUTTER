import 'package:domain_trader/src/features/core/providers/supabase_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final brightnessProvider = StateProvider((ref) => true);

final realtimeDataNotifier = StateNotifierProvider<RealtimeDataNotifier, AsyncValue<List<dynamic>>>(
  (ref) => RealtimeDataNotifier(ref.watch(supabaseProvider))
);

class RealtimeDataNotifier extends StateNotifier<AsyncValue<List<dynamic>>>{
  final SupabaseClient supabaseClient;

  RealtimeDataNotifier(this.supabaseClient) : super(const AsyncValue.loading()) {
    _fetchInitialData();
    _setupRealtimeUpdates();
  }

  Future<void> _fetchInitialData() async {
    try {
      final response = await supabaseClient.from('usuario').select();

      state = AsyncValue.data(List<Map<String, dynamic>>.from(response));
    } catch (e) {
      state = AsyncValue.error(e.toString(), StackTrace.current);
    }
  }

  void _setupRealtimeUpdates() {
    supabaseClient.channel('realtime:public:usuario').onPostgresChanges(
      event: PostgresChangeEvent.all,
      callback: (payload) {
        _handleRealtimePayload(payload);
      },
    ).subscribe();
  }

  void _handleRealtimePayload(PostgresChangePayload payload) {
    final currentState = state.value ?? [];

    if (payload.eventType == 'INSERT') {
      final newData = [...currentState, payload.newRecord];
      state = AsyncValue.data(newData);
    } else if (payload.eventType == 'UPDATE') {
      final updatedData = currentState.map((item) {
        return item['id'] == payload.newRecord['id'] ? payload.newRecord : item;
      }).toList();
      state = AsyncValue.data(updatedData);
    } else if (payload.eventType == 'DELETE') {
      // Remove o registro deletado
      final filteredData = currentState.where((item) => item['id'] != payload.oldRecord['id']).toList();
      state = AsyncValue.data(filteredData);
    }
  }
}