extends Resource
class_name Inventory


signal items_changed

export(Array, Resource) var items = []


# DOC: adds an item
func add_item(item):
	items.append(item)
	emit_signal("items_changed")


# DOC: returns the length of the array
func get_len_of_items():
	return (len(items))


# DOC: return indexes for item in itemlist
func get_indexes_for(item : Item) -> Array:
	var item_indexes = []
	for i in range(len(items)):
		if items[i] == item:
			item_indexes.append(i)
	return item_indexes


# DOC: the item on Item index to 'item'
func set_item(item_index, item):
	var previous_item = items[item_index]
	items[item_index] = item
	emit_signal("items_changed")
	return previous_item


# DOC: swap the item on index with the target item
func swap_items(item_index, target_item_index):
	var targed_item = items[target_item_index]
	var item = items[item_index]
	items[target_item_index] = item
	items[item_index] = targed_item
	emit_signal("items_changed")


# DOC: remove item on item_index
func remove_item(item_index : int) -> Item:
	var previous_item : Item
	if item_index < 0 or item_index >= len(items):
		return null
	previous_item = items[item_index]
	items.remove(item_index)
	emit_signal("items_changed")
	return previous_item
