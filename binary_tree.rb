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

    def insert(value, start = @root)
        
        # left side
        if value < start.value
            # no left child
            if start.left.nil?
                start.left = Node.new(value)

            #continue with left child
            else
                insert(value, start.left)
            end
        else
            if start.right.nil?
                start.right = Node.new(value)
            else
                insert(value, start.right)
            end
        end
    end

    

    def pretty_print(node = @root, prefix = '', is_left = true)
        pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
        puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.value}"
        pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
      end
      

end