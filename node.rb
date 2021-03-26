class Node
    include Comparable

    attr_accessor :left, :right, :data

    def initialize(data)
        @data = data
        @left = nil
        @right = nil
    end

    def <=>(other_node)
        @value <=> other_node.data
    end

    def to_s
        "#{@data} #{left.data} #{right.data}"
    end
end