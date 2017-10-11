class Node {
  constructor(key = null, val = null) {
    this.key = key;
    this.val = val;
    this.next = null;
    this.prev = null;
  }

  remove() {
    if (this.prev != null) {
      this.prev.next = this.next;
    }
    if (this.next != null) {
      this.next.prev = this.prev;
    }
    this.next = null;
    this.prev = null;

    return this;
  }
}

class DoublyLinkedList {

  constructor() {
    this.head = new Node();
    this.tail = new Node();
    this.head.next = this.tail;
    this.tail.prev = this.head;

    this.length = 0;
  }

  // each() {
  //   let currentNode = this.head.next;
  //   while (currentNode != this.tail) {
  //     yield currentNode
  //     currentNode = currentNode.next
  //   }
  // }

  size() {
    return this.length;
  }

  first() {
    return this.isEmpty() ? null : this.head.next;
  }

  last() {
    return this.isEmpty() ? null : this.tail.prev;
  }

  isEmpty() {
    return this.head.next == this.tail;
  }

  get(key) {
    // no implicit returns
    // this.each(function(node) {
    //   if (node.key == key) {
    //     return node.val;
    //   }
    //   next();
    // });
    let currentNode = this.head.next;
    for(let i = 0; i < this.size(); i++) {
      if (currentNode == this.tail) {
        break;
      }
      if (currentNode.key == key) {
        return currentNode.val;
      }
      currentNode = currentNode.next;
    }

    return null;
  }

  includes(key) {
    // this.some(function(node) { return node.key == key });
    let currentNode = this.head.next;
    for(let i = 0; i < this.size(); i++) {
      if (currentNode == this.tail) {
        break;
      }
      if (currentNode.key == key) {
        return true;
      }
      currentNode = currentNode.next;
    }

    return false;
  }

  append(key, val) {
    let newNode = new Node(key, val);

    this.tail.prev.next = newNode;
    newNode.prev = this.tail.prev;
    newNode.next = this.tail;
    this.tail.prev = newNode;

    this.length++;

    return newNode;
  }

  prepend(key, val) {
    let newNode = new Node(key, val);

    this.head.next.prev = newNode;
    newNode.next = this.head.next;
    newNode.prev = this.head;
    this.head.next = newNode;

    this.length++;

    return newNode;
  }

  update(key, val) {
    // this.each(function(node) {
    //   if (node.key == key) {
    //     node.val = val;
    //     return node;
    //   }
    //   next();
    // });
    let currentNode = this.head.next;
    for(let i = 0; i < this.size(); i++) {
      if (currentNode == this.tail) {
        break;
      }
      if (currentNode.key == key) {
        currentNode.val = val;
      }
      currentNode = currentNode.next;
    }
  }

  remove(key) {
    // this.each(function(node) {
    //   if (node.key == key) {
    //     node.remove();
    //     return node.val;
    //   }
    // });
    let currentNode = this.head.next;
    for(let i = 0; i < this.size(); i++) {
      if (currentNode == this.tail) {
        break;
      }
      if (currentNode.key == key) {
        currentNode.remove();
      }
      currentNode = currentNode.next;
    }

    this.length--;

    return null;
  }
}
