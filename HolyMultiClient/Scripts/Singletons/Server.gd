extends Node

var network : NetworkedMultiplayerENet = NetworkedMultiplayerENet.new()
var ip : String = "127.0.0.1"
var port : int = 16899

func _ready():
	network.create_client(ip,port)
	get_tree().set_network_peer(network)
	
	network.connect("connection_failed",self,"_OnConnectionFailed")
	network.connect("connection_succeeded",self,"_OnConnectionSucceeded")
	
func _OnConnectionFailed():
	print("Failed to connect")

func _OnConnectionSucceeded():
	print("Succesfuly connected")
