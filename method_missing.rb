# Source: https://www.codewithjason.com/ruby-method-missing/
# Takeaways
# 1. `method_missing` can be useful for constructing DSLs
# 2. `method_missing` can be added to any object to endow that object with special
# behavior when the object gets sent a message for which is doesn't have a method defined
# 3. `method_missing` takes the name of the method that was called, an arbitrary number of 
# arguments, and (optionally) a block

class HTMLDocument
    def initialize(&block)
        # This instance_exec means that any message that's
        # sent inside the HTMLDocument.new block (html, body,
        # etc.) will use HTMLDocument as its recipient.
        # See https://www.codewithjason.com/ruby-instance-exec/
        instance_exec(&block)
    end

    private 

    def method_missing(method_name, *args, &block)
        # args is equal to:
        # [{:href=>"https://www.codewithjason.com", :target=>"_top"}]
        # We're interested in the "first" (and only) element
        puts "<#{method_name}#{hash_to_html_attributes(args[0])}>"
        block.call
        puts "</#{method_name}>"
    end

    def hash_to_html_attributes(hash)
        return unless hash

        stringified_attributes = hash.map do |key, value|
            "#{key}=\"#{value}\""
        end

        " #{stringified_attributes.join(" ")}"
    end
end

HTMLDocument.new do
    html do
        body do
            puts "Hello world"

            a({href: "https://www.codewithjason.com", target: "_top"}) do
                puts "Code with Jason"
            end

        end
    end
end