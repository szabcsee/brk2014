class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]
  # GET /users
  # GET /users.json

  before_filter :authorize, only: [:edit, :update, :index]

  def index
    @users = User.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(current_user.id)
    @registrations = Registration.where(:user_id => @user.id)
    @travels = @user.travels.all
    @meals = @user.meals.all
    @children = Child.where(:user_id => @user.id)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    reset_session
    @user = User.new
    @meal_dates = ["2014-07-22","2014-07-23","2014-07-24","2014-07-25","2014-07-26","2014-07-27"]
    @child = @user.children.build
    @meals = @user.meals.build
    @travels = @user.travels.build
    @registration = @user.registrations.build
    @programs = Program.all
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @meal_dates = ["2014-07-22","2014-07-23","2014-07-24","2014-07-25","2014-07-26","2014-07-27"]
    @user.meals
    @user.programs
    @user.travels
    @programs = Program.all
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    @meal_dates = ["2014-07-22","2014-07-23","2014-07-24","2014-07-25","2014-07-26","2014-07-27"]
    @programs = Program.all
    start = DateTime.new(2014,7,22,0,0,0)
    finish = DateTime.new(2014,7,27,0,0,0)
    @range = start..finish
    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        UserMailer.confirmation_email(@user).deliver

        format.html { redirect_to @user, notice: t('user_created') }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update

    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @User, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @User.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to Users_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email_address,
                                   :password,
                                   :password_confirmation,
                                   :first_name,
                                   :home_country,
                                   :payment,
                                   :phone_number,
                                   :price_category,
                                   :price_method,
                                   :reference_number,
                                   :second_name,
                                   meals_attributes: [:fifth_day, :fifth_day_meal_type, :first_day, :first_day_meal_type, :food_type, :fourth_day, :fourth_day_meal_type, :second_day, :second_day_meal_type, :sixth_day, :sixth_day_meal_type, :third_day, :third_day_meal_type],
                                   registrations_attributes: [:user_id, :program_id, :participate],
                                   children_attributes: [:age, :child_care, :language, :name, :user_id],
                                   travels_attributes: [:arrival, :arrival_seats, :bus_trip, :departure, :departure_seats, :flight_date, :flight_number, :user_id] )
    end

end
