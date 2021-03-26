class BinaryTree
    def initialize(array)
        @root = build_tree(array)
    end

    def build_tree(array)
        array = array.uniq.sort

        return build_tree_helper(array, 0, array.length - 1)
    end

    private_class_method
    def build_tree_helper(array, start, finish)

        # base case
        if start > finish
            return
        end

        mid = (start + finish) / 2
        node = Node.new(array[mid])

        node.left = build_tree_helper(array, start, mid - 1)
        node.right = build_tree_helper(array, mid + 1, finish)

        return node

    end

    def insert(value, node = @root)
        return nil if value == node.data
    
        if value < node.data
          node.left.nil? ? node.left = Node.new(value) : insert(value, node.left)
        else
          node.right.nil? ? node.right = Node.new(value) : insert(value, node.right)
        end
    end

    def delete(value, node = @root)

        return node if node.nil?
    
        if value < node.data
          node.left = delete(value, node.left)
        elsif value > node.data
          node.right = delete(value, node.right)
        else
          # if node has one or no child
          return node.right if node.left.nil?
          return node.left if node.right.nil?
    
          # if node has two children
          leftmost_node = leftmost_leaf(node.right)
          node.data = leftmost_node.data
          node.right = delete(leftmost_node.data, node.right)
        end
        node
    end

      # helper method that finds the leftmost leaf

    def leftmost_leaf(node)
        node = node.left until node.left.nil?

        node
    end

    def find(value, node = @root)

        return nil if node.nil?
        
        if value < node.data
            find(value, node.left)
        elsif value > node.data
            find(value, node.right)
        else
            node
        end
    end

    def level_order(node = @root, values = [], queue = [])

        # puts values

        #queue empty, return values
        return values if node.nil?
        
        values.append(node.data)

        queue.append(node.left) unless node.left.nil?
        queue.append(node.right) unless node.right.nil?

        next_node = queue.shift

        level_order(next_node, values, queue)
    end

    def inorder(node = @root, values = [])
        
        inorder(node.left, values) unless node.left.nil?
        values.append(node.data)
        inorder(node.right, values) unless node.right.nil?

        values

    end

    def preorder(node = @root, values = [])
        
        values.append(node.data)
        preorder(node.left, values) unless node.left.nil?
        preorder(node.right, values) unless node.right.nil?

        values

    end

    def postorder(node = @root, values = [])
        
        postorder(node.left, values) unless node.left.nil?
        postorder(node.right, values) unless node.right.nil?
        values.append(node.data)

        values

    end

    def height(node = @root, height = 0)

        return 0 if node.nil?
        
        return height if (node.left.nil? && node.right.nil?)

        height_left = height(node.left, 1 + height)
        height_right = height(node.right, 1 + height)

        return [height_left, height_right].max
    end

    def depth(node_to_find, node = @root)

        return nil if node.nil?
        
        if node_to_find.data < node.data
            1 + depth(node_to_find, node.left)
        elsif node_to_find.data > node.data
            1 + depth(node_to_find, node.right)
        else
            return 0
        end

    end

    def balanced?(node = @root)

        if node.nil?
            return true
        end

        if (node.left.nil? && node.right.nil?)
            return true
        end
        
        height_left = height(node.left)
        height_right = height(node.right)

        if (height_left - height_right).abs > 1
            return false
        end

        return (balanced?(node.left) && balanced?(node.right))
        
    end

    def rebalance
        array = level_order
        @root = build_tree(array)
    end

    def pretty_print(node = @root, prefix = '', is_left = true)
        pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
        puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
        pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
      end
      

end