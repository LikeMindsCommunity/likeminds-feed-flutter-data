import 'package:likeminds_feed/src/models/community/connection_type.dart';

class SendConnectionRequest {
  String receiverUUID;
  ConnectionType connectionType;
  bool? connectionRequestAutoAccepted;

  SendConnectionRequest._({
    required this.receiverUUID,
    required this.connectionType,
    this.connectionRequestAutoAccepted,
  });

  Map<String, dynamic> toJson() => {
        'connection_type': connectionType.value,
        'connection_request_auto_accepted': connectionRequestAutoAccepted,
      };
}

class SendConnectionRequestBuilder {
  String? _receiverUUID;
  ConnectionType? _connectionType;
  bool? _connectionRequestAutoAccepted;

  SendConnectionRequestBuilder();

  void receiverUUID(String receiverUUID) {
    _receiverUUID = receiverUUID;
  }

  void connectionType(ConnectionType connectionType) {
    _connectionType = connectionType;
  }

  void connectionRequestAutoAccepted(bool connectionRequestAutoAccepted) {
    _connectionRequestAutoAccepted = connectionRequestAutoAccepted;
  }

  SendConnectionRequest build() {
    if (_receiverUUID == null) {
      throw ArgumentError.notNull('receiverUUID');
    }
    if (_connectionType == null) {
      throw ArgumentError.notNull('connectionType');
    }

    return SendConnectionRequest._(
      receiverUUID: _receiverUUID!,
      connectionType: _connectionType!,
      connectionRequestAutoAccepted: _connectionRequestAutoAccepted,
    );
  }
}
