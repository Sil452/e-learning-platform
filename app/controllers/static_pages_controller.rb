class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:landing_page
  ]
  def landing_page
    @courses = Course.all.limit(3)
    @latest_couses = Course.all.limit(3).order(created_at: :desc)
    @ransack_courses = Course.ransack(params[:courses_search], search_key: :courses_search)
  end
  
  def activity
    @activities = PublicActivity::Activity.all
  end
end
