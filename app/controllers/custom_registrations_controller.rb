class CustomRegistrationsController < Devise::RegistrationsController
  def create
    super do |resource|
      if resource.persisted?
        render json: resource
        return
      else
        render json: { errors: resource.errors.full_messages }, status: :unprocessable_entity
        return
      end
    end
  end
end
