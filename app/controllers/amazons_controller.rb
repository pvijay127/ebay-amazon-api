class AmazonsController < ApplicationController



  def get_request
    request = Amazon.new
    # request.get_az_list
    # request.get_az_product("B0053X62GK")
    upc_price_list = request.make_a_request(params[:node_id], params[:list_type])
    #upc_price_list = request.get_az_product("B00VVKE0DG")

    render json: upc_price_list
  end

end
