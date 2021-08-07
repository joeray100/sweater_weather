class LocationError < StandardError
  class InvalidLocation < LocationError
    def status
      'Bad Request'
    end

    def code
      400
    end

    def message
      "Invalid request, location incorrect format"
    end

    def to_hash
      {
        error: {
          message: message,
          code: code
        }
      }
    end
  end
  class NoLocation < LocationError
    def status
      'Not Found'
    end

    def code
      404
    end

    def message
      'No location given'
    end

    def to_hash
      {
        error: {
          message: message,
          code: code
        }
      }
    end
  end
end
