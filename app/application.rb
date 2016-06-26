require_relative 'item.rb'
require 'pry'


class Application

#@@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
      the_item = @@items.find{|s| s.name == item_name}
#      binding.pry
      if @@items.include?(the_item)
          resp.status = 200
          resp.write "#{the_item.price}"

        else
          resp.write "Item not found"
          resp.status = 400
      end
    
    else
      resp.write "Route not found"
      resp.status = 404
    end
    resp.finish
  end
end


    # if req.path.include?("/items/")
    #   @@items.each do |item|
    #     if @@items.include?(item)
    #       resp.write "#{item.name}, $#{item.price}"
    #       resp.status = 200
    #     else
    #       resp.write "Item not found"
    #       resp.status = 400
    #     end
    #   end
    # else
    #   resp.write "Route not found"
    #   resp.status = 404
    # end