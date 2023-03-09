class UsersController < ApplicationController
  def index
    @users = User.all
    @markers = @users.geocoded.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude,
        info_window_html: render_to_string(partial: "/shared/info_window", locals: {user: user}),
        marker_html: render_to_string(partial: "/shared/marker")
      }
    end
  end

  def show
    @user = current_user
  end
end
