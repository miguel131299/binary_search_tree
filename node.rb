class Node
    include Comparable

    attr_accessor :value, :left, :right

    def initialize(value, left = nil, right = nil)
        @value = value
        @left = left
        @right = right
    end

    def <=>(other_node)
        if other_node == nil
            return false
        end
        @value <=> other_node.value
    end

    def to_s
        "#{value}"
    end
end