import 'package:likeminds_feed/src/models/community/action.dart';
import 'package:likeminds_feed/src/models/community/connection_type.dart';

class UpdateConnectionRequest {
  final String receiverUUID;
  final ConnectionAction action;
  final ConnectionType connectionType;

  UpdateConnectionRequest._({
    required this.receiverUUID,
    required this.action,
    required this.connectionType,
  });

  Map<String, dynamic> toJson() => {
        'action': action.value,
        'connection_type': connectionType.value,
      };
}

class UpdateConnectionRequestBuilder {
  String? _receiverUUID;
  ConnectionAction? _action;
  ConnectionType? _connectionType;

  UpdateConnectionRequestBuilder();

  void receiverUUID(String receiverUUID) {
    _receiverUUID = receiverUUID;
  }

  void action(ConnectionAction action) {
    _action = action;
  }

  void connectionType(ConnectionType connectionType) {
    _connectionType = connectionType;
  }

  UpdateConnectionRequest build() {
    if (_receiverUUID == null) {
      throw ArgumentError.notNull('receiverUUID');
    }
    if (_action == null) {
      throw ArgumentError.notNull('action');
    }
    if (_connectionType == null) {
      throw ArgumentError.notNull('connectionType');
    }

    return UpdateConnectionRequest._(
      receiverUUID: _receiverUUID!,
      action: _action ?? ConnectionAction.reject,
      connectionType: _connectionType!,
    );
  }
}
