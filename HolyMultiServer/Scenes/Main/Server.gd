extends Node

var network : NetworkedMultiplayerENet = NetworkedMultiplayerENet.new()
var port : int = 16899
var max_player : int = 8

func _ready():
	StartServer()
	
func StartServer():
	var error : int = network.create_server(port,max_player)
	if error == 0:
		get_tree().set_network_peer(network)
		print("Server started")
# warning-ignore:return_value_discarded
		network.connect("peer_connected",self, "_Peer_Connected")
# warning-ignore:return_value_discarded
		network.connect("peer_disconnected",self, "_Peer_Disconnected")
	
	else:
		print("Error : " + str(error))

func _Peer_Connected(player_id : int):
	print("User " + str(player_id) + " Connected")

func _Peer_Disconnected(player_id : int):
	print("User " + str(player_id) + " Deconnected")
