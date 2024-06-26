class_name Resource_container

var basket = [0, 0, 0, 0, 0, 0]

func get_re(r:Resources.r):
	return basket[r]

func set_re(r:Resources.r, i):
	basket[r] = i

func add_re(r:Resources.r, i):
	basket[r] += i

func sub_re(r:Resources.r, i):
	if i >= basket[r]:
		basket[r] = 0
	else:
		basket[r] -= i
		
func _init(b = [0, 0, 0, 0, 0, 0]):
	basket = b

static func combine(r1:Resource_container, r2:Resource_container):
	var r3: Resource_container = Resource_container.new()
	for i in range(6):
		if r1.basket[i] + r2.basket[i] >= 0 || i == Resources.r.CULTISTS : r3.basket[i] = r1.basket[i] + r2.basket[i]
		else : r3.basket[i] = 0
		r3.basket[i] = r1.basket[i] + r2.basket[i];
	return r3

static func compare(player:Resource_container, event:Resource_container):
	for i in range(6):
		if player.basket[i] + event.basket[i] < 0:
			return false
	return true

func per_delta(scale):
	var r = Resource_container.new()
	for i in range(6):
		r.basket[i] = basket[i] * scale
	return r

func scale(r:Resource_container):
	for i in range(6):
		basket[i] *= r.basket[i]/100
