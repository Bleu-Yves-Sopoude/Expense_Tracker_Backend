# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController

  RegistrationsController
  respond_to :json

  private

  def respond_with(resource, options={})
      if resource.persisted?
        render json:{
          status: { code:200, message:'Signed up sucessfully',
          data:resource}
        }, status: :ok
      else
        render json:{
          status:{
            message: 'User could not be created succesfully',
            errors:'resouce.errors.full_messages'}, status: :unprocessable_entity
          }
        }
      end
    end



end
