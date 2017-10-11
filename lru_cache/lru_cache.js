// Time complexity: O(1)
// Space complexity: O(n)

// look up in a hashmap is O(1)
//  space grows linear to them amount of elements being stored

// Description
// This is achieved by having the doubly-linked list manage
// when we have to rearrange the elements
// while the map gives us direct access to the resource.
// Look-up in a map is O(1) by providing the key.
// We introduce the concept of the “head”,
// which is the least recently used entry,
// and the “tail”,
// which is the most recently used entry,
// to keep track of the order when elements are retrieved
// or added. There are two pointers per node
// which is relatively low cost to manage the ordering.

// API:
//
// lru(limit)
  // Initialize LRU cache with default limit being 10 items
// get(key)
  // Retrieve a single entry from the cache
// set(key, value)
  // Change or add a new value in the cache
  // We overwrite the entry if it already exists
// remove(key)
  // Remove a single entry from the cache
// removeAll()
  // Resets the entire cache
  // Argument limit is optional to be reset
// forEach(function(){})
  // Traverse through the cache elements using a callback function
  // Returns args [node element, element number, cache instance] for the callback function to use
// toJSON()
  // Returns a JSON representation of the cache
// toString()
  // Returns a String representation of the cache

class LRU {
  constructor(limit) {
    this.size = 0;
    (typeof limit == "number") ? this.limit = limit : this.limit = 0;
    this.map = {};
    this.head = null;
    this.tail = null;
  }

  lruNode(key, value) {
    if (typeof key != "undefined" && key !== null) {
      this.key = key;
    }
    if (typeof value != "undefined" && value !== null) {
      this.value = value;
    }
    this.prev = null;
    this.head = null;
  }

  setHead(node) {
    node.next = this.head;
    node.prev = null;
    if (this.head !== null) {
      this.head.prev = node;
    }
    this.head = node;
    if (this.tail === null) {
      this.tail = node;
    }
    this.size++;
    this.map[node.key] = node;
  }

  set(key, value) {
    let node = new lruNode(key, value);
    if (this.map[key]) {
      this.map[key].value = node.value;
      this.remove(node.key);
    } else {
      if (this.size >= this.limit) {
        delete this.map[this.tail.key];
        this.size--;
        this.tail = this.tail.prev;
        this.tail.next = null;
      }
    }
    this.setHead(node);
  }

  get(key) {
    if (this.map[key]) {
      let value = this.map[key].value;
      let node = new lruNode(key, value);
      this.remove(key);
      this.setHead(node);
      return value;
    } else {
      console.log("Key " + key + " does not exist in the cache.");
    }
  }

  remove(key) {
    let node = this.map[key];
    if (node.prev !== null) {
      node.prev.next = node.next;
    } else {
      this.head = node.next;
    }
    if (node.next !== null) {
      node.next.prev = node.prev;
    } else {
      this.tail = node.prev;
    }
    delete this.map[key];
    this.size--;
  }

  removeAll(limit) {
    this.size = 0;
    this.map = {};
    this.head = null;
    this.tail = null;
    if (typeof limit == "number") {
      this.limit = limit;
    }
  }

  forEach(callback) {
    let node = this.head;
    let i = 0;
    while (node) {
      callback.apply(this, [node, i, this]);
      i++;
      node = node.next;
    }
  }

  toJSON() {
    let json = [];
    let node = this.head;
    while (node) {
      json.push({
        key: node.key,
        value: node.value
      });
      node = node.next;
    }
    return json;
  }

  toString() {
    let s = '';
    let node = this.head;
    while (node) {
      s += String(node.key) + ':' + node.value;
      node = node.next;
      if (node) {
        s += '\n';
      }
    }
    return s;
  }
}
