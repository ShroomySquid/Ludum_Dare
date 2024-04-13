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

static func combine(r1:Resource_container, r2:Resource_container):
	var r3: Resource_container
	for i in range(6):
		r3.basket[i] = r1.basket[i] + r2.basket[i];
	return r3

func scale(s:int):
	for i in range(6):
		basket[i] *= s / 100
