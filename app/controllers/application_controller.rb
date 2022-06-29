class ApplicationController < ActionController::API
    rescue_from ActiveRecord::RecordInvalid, with: :invalid_record

    private

    def invalid_record(exception)
        # render json: {errors: "Can't be blank"}, status: :unprocessable_entity
        #above works, below lets it be dynamic across models
        render json: {errors: exception.record.errors}, status: :unprocessable_entity
    end
end
