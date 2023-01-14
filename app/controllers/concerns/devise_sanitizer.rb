# frozen_string_literal: true

module DeviseSanitizer
  def configure_permitted_params
    configure_sign_up_params
  end

  private

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(
      :sign_up,
      keys: user_attributes
    )
  end

  def user_attributes
    [
      :role_id,
      :email,
      {
        profile_attributes: profile_attributes
      }
    ]
  end

  def profile_attributes
    %i[
      firstname
      lastname
      salutation
    ]
  end
end
