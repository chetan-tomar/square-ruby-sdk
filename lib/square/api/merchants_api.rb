# square
#
# This file was automatically generated by APIMATIC v2.0
# ( https://apimatic.io ).

module Square
  # MerchantsApi
  class MerchantsApi < BaseApi
    def initialize(config, http_call_back: nil)
      super(config, http_call_back: http_call_back)
    end

    # Retrieve a `Merchant` object for the given `merchant_id`.
    # @param [String] merchant_id Required parameter: The ID of the merchant to
    # retrieve
    # @return [RetrieveMerchantResponse Hash] response from the API call
    def retrieve_merchant(merchant_id:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/merchants/{merchant_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'merchant_id' => merchant_id
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.get(
        _query_url,
        headers: _headers
      )
      OAuth2.apply(config, _request)
      _response = execute_request(_request)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      _errors = APIHelper.map_response(decoded, ['errors'])
      ApiResponse.new(_response, data: decoded, errors: _errors)
    end
  end
end