extends Node

var connection = PacketPeerUDP.new()
var test = null
var values = [
	true,false,
	1, -1, 500, -500,
	1.2, -1.2, 50.1, -50.1, 80.852078542,
	"test1", "test2", "test3"
]

func _ready():
	print("Start client UDP")
	# Connect
	connection.connect_to_host("127.0.0.1", 9091)
	connection.put_var("whee")

func _process(_delta):
	if connection.is_socket_connected():
		if connection.get_available_packet_count() > 0 :
			test = connection.get_var()
			print(test)

		if values.size() > 0 :
			connection.put_var(values.pop_front())
