class EbayController < ApiController

  def show
    result = Ebay.new.cheapest_result(upc: params[:upc])

    begin
      respond_to do |format|
        format.json { render json: result.to_json, status: 200 }
        format.xml  { render xml: result.to_xml, status: 200 }
      end
    rescue
      render json: { Error: "Something went wrong" }
    end
  end

  def all
    params[:number] ||= 10
    results = Ebay.new.search(upc: params[:upc], entries: params[:entries])
    respond_to do |format|
      format.json { render json: results.to_json, status: 200 }
      format.xml  { render xml: results.to_xml, status: 200 }
    end
  end

end
