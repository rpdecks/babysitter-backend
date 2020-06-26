class ApplicationController < ActionController::API

    def current_employer
      token = request.headers['Auth-Token']
      begin
        employer_id = JWT.decode(token, ENV['SUPER_SECRET_KEY'])[0]['employer_id']
        return Employer.find_by(id: employer_id)
      rescue
        nil
      end
    end

    def current_caregiver
      token = request.headers['Auth-Token']
      begin
        caregiver_id = JWT.decode(token, ENV['SUPER_SECRET_KEY'])[0]['caregiver_id']
        return Caregiver.find_by(id: caregiver_id)
      rescue
        nil
      end
    end

    def authenticate_employer
      unless current_employer
        return nil
      end
    end

    def authenticate_caregiver
      unless current_caregiver
        return nil
      end
    end
end